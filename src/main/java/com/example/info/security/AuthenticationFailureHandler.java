package com.example.info.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.AuthenticationException;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Configuration
public class AuthenticationFailureHandler implements org.springframework.security.web.authentication.AuthenticationFailureHandler{

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String username = request.getParameter("username");
        String str_errorMsg = exception.getMessage();
        
        
        log.info("fail..."+username);
        log.info("error..."+str_errorMsg);
        //로그인 실패시 필요한 작업 추가
       
        response.sendRedirect("/secure/login.do?error=500");
    }
    
}