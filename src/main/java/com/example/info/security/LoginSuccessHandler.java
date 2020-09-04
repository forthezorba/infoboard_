package com.example.info.security;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.info.domain.MemberVO;
import com.example.info.domain.User;
import com.example.info.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequiredArgsConstructor
@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	@Resource
	private MemberService memberService;
    private final HttpSession httpSession;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.info("success...");
		try {
			MemberVO user = memberService.read_member(authentication.getName());
			System.out.println(user);
			httpSession.setAttribute("user",new SessionUser(user));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("/");
	}
    
}