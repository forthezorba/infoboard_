package com.example.info.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.info.domain.AuthVO;
import com.example.info.domain.MemberVO;
import com.example.info.domain.User;
@Repository("com.example.info.mapper.MemberMapper")
public interface MemberMapper { 
	public MemberVO read(String userEmail);
	public List read_all();
	public void insert_member(MemberVO memberVO);		//회원가입
	public void insert_auth(AuthVO auth);		//회원가입
	//public int update_member(MemberVO memberVO);		//회원가입
	//public int insert_auth(AuthVO auth);		//회원가입
	//int email_chk(MemberVO memberVO);		//이메일 중복체크, 이메일 가지고 사용자 정보 가져오기

}