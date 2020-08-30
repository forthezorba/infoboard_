package com.example.info.security;

import java.util.Map;

import com.example.info.domain.Role;
import com.example.info.domain.User;

import lombok.Builder;
import lombok.Getter;

@Getter
public class OAuthAttributes {
	private Map<String,Object> attributes;
    private String nameAttributeKey;
    private String name;
    private String email;
    private String picture;
    @Builder
    public OAuthAttributes(Map<String,Object> attributes, 
                           String nameAttributeKey, String name,
                           String email, String picture){
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.name = name; 
        this.email = email;
        this.picture = picture;
    }
    //of Map정보를 하나씩 반환
    public static OAuthAttributes of(String registrationId, String userNameAttributeName,
                                     Map<String, Object> attributes){
    	System.out.println(registrationId+attributes.get("response"));
        if("naver".equals(registrationId)){
            return ofNaver("id",attributes);
        }
        return ofGoogle(userNameAttributeName,attributes);
    }
    //User 엔티티 생성
    private static OAuthAttributes ofGoogle(String userNameAttributeName,Map<String, Object> attributes){
    	System.out.println("ofgoogle..."+attributes.get("email"));
    	return OAuthAttributes.builder()
                .name((String)attributes.get("name"))
                .email((String)attributes.get("email"))
                .picture((String)attributes.get("picture"))
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .build();                            
    }
    //User 엔티티 생성
    private static OAuthAttributes ofNaver(String userNameAttributeName,Map<String, Object> attributes){
        Map<String,Object> response = (Map<String, Object>) attributes.get("response");
        System.out.println("ofnaver..."+response.get("email"));
        return OAuthAttributes.builder()
                .name((String) response.get("name"))
                .email((String) response.get("email"))
                .picture((String) response.get("picture"))
                .attributes(response)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }

    public User toEntity(){
        return User.builder()
                .name(name)
                .email(email)
                .picture(picture)
                .role(Role.GUEST)
                .build();
    }
}
