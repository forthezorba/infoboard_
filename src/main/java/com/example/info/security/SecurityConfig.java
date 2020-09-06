package com.example.info.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Configuration   
@RequiredArgsConstructor
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	@Autowired
	public AuthenticationFailureHandler authenticationFailureHandler;
	@Autowired
	public LoginSuccessHandler successHandler;
	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
    private final CustomOAuth2UserService customOAuth2userService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
        .headers().frameOptions().disable()
            .and()
                .authorizeRequests()
                .antMatchers("/","/user/signup").permitAll()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**","/assets/**","/fonts/**","/dis/**","/vendor/**","*.jpg","*.jpeg").permitAll()
                .anyRequest().authenticated()
            .and()
            	.formLogin()
            		.successHandler(successHandler)
            			.failureHandler(authenticationFailureHandler)
            .and()
	            .logout()
		            .logoutUrl("/user/logout")
		            	.logoutSuccessUrl("/login")
            .and()
                .oauth2Login()
                	.defaultSuccessUrl("/")
                    .userInfoEndpoint()
                        .userService(customOAuth2userService);
		
//		http
//        .authorizeRequests()
//        	.antMatchers("/","/user/signup","/list").permitAll() // "/", "/hello" 는 인증정보 필요 없음.
//            .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**","/assets/**","/fonts/**","/dis/**","/vendor/**").permitAll()
//            .anyRequest()
//            .fullyAuthenticated()
//            .and()
//        .formLogin()
//        	.successHandler(successHandler)
//            .failureUrl("/login?error").failureHandler(authenticationFailureHandler)
//            .permitAll()
//            .and()
//        .logout()
//            .logoutUrl("/user/logout")
//            .logoutSuccessUrl("/login")
//            .permitAll()
//            .and()
//        .csrf();
	}
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) 
	  throws Exception {
	    auth.jdbcAuthentication()
	      .dataSource(dataSource)
	      .usersByUsernameQuery("select email,password,enabled "
	        + "from bael_users "
	        + "where email = ?")
	      .authoritiesByUsernameQuery("select email,authority "
	        + "from authorities "
	        + "where email = ?")
	      .passwordEncoder(passwordEncoder());	      
	} 
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}
