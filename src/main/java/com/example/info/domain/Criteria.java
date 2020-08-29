package com.example.info.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		return type==null? new String[] {}: type.split("");
	}
	public Criteria(String type, String keyword) {
		this.type = type;
		this.keyword = keyword;
	}
	
//	public String getListLink() {
//		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//				.queryParam("type", this.getType())
//				.queryParam("keyword", this.getKeyword()
//				);
//		return builder.toUriString();
//	}

}
