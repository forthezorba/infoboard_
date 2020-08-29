package com.example.info.service.posts;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.info.domain.AuthVO;
import com.example.info.domain.MemberVO;
import com.example.info.mapper.MemberMapper;


@Service("com.example.info.service.MemberService")
public class MemberService{
	@Resource(name="com.example.info.mapper.MemberMapper")
	MemberMapper memberMapper;
	
	public void insert_member(MemberVO vo) throws Exception{
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
    	AuthVO auth = new AuthVO();
    	auth.setEmail(vo.getEmail());
    	auth.setAuth("ROLE_MEMBER");
		
		memberMapper.insert_member(vo);
		memberMapper.insert_auth(auth);
    }
	public MemberVO read_member(String userEmail) throws Exception{
		return memberMapper.read(userEmail);
	}
	public List read_all_member() throws Exception{
		return memberMapper.read_all();
	}
	
	
	//public int insert_member(MemberVO memberVO); //회원 가입 후 넣기
	//public int update_member(MemberVO memberVO); //회원 가입 후 넣기
	//public int email_chk(MemberVO memberVO);//중복체크
}