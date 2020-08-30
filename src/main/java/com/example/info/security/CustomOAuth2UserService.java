package com.example.info.security;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.info.domain.User;
import com.example.info.mapper.MemberMapper;
import com.example.info.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.Setter;


@RequiredArgsConstructor
@Service
public class CustomOAuth2UserService  implements OAuth2UserService<OAuth2UserRequest, OAuth2User>{
    //private final UserRepository userRepository;
	@Setter(onMethod_ = { @Autowired })
	private UserMapper userMapper;
	
    private final HttpSession httpSession;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest,OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();//google,naver
        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails()
                .getUserInfoEndpoint().getUserNameAttributeName();//key 값
        OAuthAttributes attributes = OAuthAttributes.
                of(registrationId,userNameAttributeName,oAuth2User.getAttributes());//service통해 가져온 attribute담는 클래스

        User user = saveOrUpdate(attributes);
        System.out.println(user);
        httpSession.setAttribute("user",new SessionUser(user));
        
        return new DefaultOAuth2User(Collections.singleton(
                new SimpleGrantedAuthority(
                        user.getRoleKey())),
                        attributes.getAttributes(),
                        attributes.getNameAttributeKey());
    }

    private User saveOrUpdate(OAuthAttributes attributes) {
    	System.out.println(attributes.getEmail());
        User user = userMapper.findByEmail(attributes.getEmail());
        			//.map(entity -> entity.update(attributes.getName(), attributes.getPicture()))
        			//.orElse(attributes.toEntity());
        //처음 로그인
        if(user == null) {
        	user = attributes.toEntity();
        	userMapper.save(user);
        }
        
        return user;
    }

}
