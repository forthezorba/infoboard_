package com.example.info.domain;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ReplyVO {
    private int rno;
    private int bno;
    private String title;
    private String content;
    private Date reg_date;
    
}


