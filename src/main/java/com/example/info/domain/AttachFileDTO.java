package com.example.info.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String url;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
