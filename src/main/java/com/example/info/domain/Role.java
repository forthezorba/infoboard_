package com.example.info.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Role {
	GUEST("ROLE_GUEST","¼Õ´Ô"),
	USER("ROLE_USER","À¯Àú");
	
	private final String key;
	private final String title;
}
