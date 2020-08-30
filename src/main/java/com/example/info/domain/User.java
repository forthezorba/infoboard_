package com.example.info.domain;


import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class User {

    private Long id;
    private String name;
    private String email;
    private String picture;
    private Role role;
    private Date reg_date;
    
    @Builder
    public User(String name, String email, String picture, Role role, Date reg_date){
        this.name = name;
        this.email = email;
        this.picture = picture;
        this.role = role;
        this.reg_date = reg_date;
    }

    public User update(String name, String picture){
        this.name = name;
        this.picture = picture;
        return this;
    }
    public String getRoleKey(){
        return this.role.getKey();
    }
}