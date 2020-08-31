package com.example.info.domain;


import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class MemberVO {
	private String name;
    private String email;
    private String password;
    private String picture;
    private Boolean enabled;
    private Date reg_date;
    //private LocalDateTime createdDate;
	
	private List<AuthVO> auth;
}
