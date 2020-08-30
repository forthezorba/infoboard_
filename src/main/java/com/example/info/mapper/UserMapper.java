package com.example.info.mapper;


import org.springframework.stereotype.Repository;
import com.example.info.domain.User;
@Repository("com.example.info.mapper.UserMapper")
public interface UserMapper { 
	public User findByEmail(String userEmail);
	public int save(User user);

}