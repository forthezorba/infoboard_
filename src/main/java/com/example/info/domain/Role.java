package com.example.info.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Role {
	GUEST("ROLE_GUEST","�մ�"),
	USER("ROLE_USER","����");
	
	private final String key;
	private final String title;
}
