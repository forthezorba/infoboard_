package com.example.info.security;

import java.io.Serializable;
import java.util.Date;

import com.example.info.domain.MemberVO;
import com.example.info.domain.User;

import lombok.Getter;
import lombok.Setter;

@Getter
public class SessionUser implements Serializable{
	private String name;
	private String email;
	private String picture;
	private Date reg_date;

	public SessionUser(User user) {
		this.name = user.getName();
		this.email = user.getEmail();
		this.picture = user.getPicture();
		this.reg_date = user.getReg_date();
	}
	public SessionUser(MemberVO member) {
		this.name = member.getName();
		this.email = member.getEmail();
		this.picture = member.getPicture();
		this.reg_date = member.getReg_date();
	}
}
