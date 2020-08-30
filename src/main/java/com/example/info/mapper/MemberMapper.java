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
	public void insert_member(MemberVO memberVO);		//ȸ������
	public void insert_auth(AuthVO auth);		//ȸ������
	//public int update_member(MemberVO memberVO);		//ȸ������
	//public int insert_auth(AuthVO auth);		//ȸ������
	//int email_chk(MemberVO memberVO);		//�̸��� �ߺ�üũ, �̸��� ������ ����� ���� ��������

}