package com.example.info.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
 
    private int bno;
    private int ref;
    private int reply;
    private String subject;
    private String content;
    private String writer;
    private String name;
    private Date reg_date;
    
}


