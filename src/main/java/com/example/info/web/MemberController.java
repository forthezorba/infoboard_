package com.example.info.web;

import java.security.Principal;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.info.domain.MemberVO;
import com.example.info.service.MemberService;


@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
//	@GetMapping("/userInfo")
//	public String dispUserInfo(Principal principal,Model model) throws Exception{
//		
//		String userId = principal.getName();
//		model.addAttribute("user", memberService.read_member(userId));
//
//		return "userInfo";
//	}
	
	@GetMapping("/sb_userInfo")
	public String UserInfo(Principal principal,Model model) throws Exception{
		
		String userId = principal.getName();
		if(userId.equals("admin@naver.com")){
			model.addAttribute("list", memberService.read_all_member());
		}
//		else {
//			model.addAttribute("user", memberService.read_member(userId));	
//		}
		
		return "sb_userInfo";
	}
	
	@GetMapping("/user/signup")
	public String dispSignup() {
		return "sb_signup";
	}

	// ȸ������ ó��
	@PostMapping("/user/signup")
	public String execSignup(MemberVO member) {
		try {
			memberService.insert_member(member);
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return "redirect:/";
	}

	// �α��� ������
	@GetMapping("/user/login")
	public String dispLogin() {
		return "/";
	}
//
//	// �α��� ��� ������
//	@GetMapping("/user/login/result")
//	public String dispLoginResult() {
//		return "/loginSuccess";
//	}

	// �α׾ƿ� ��� ������
	@GetMapping("/user/logout/result")
	public String dispLogout() {
		return "/logout";
	}
}
