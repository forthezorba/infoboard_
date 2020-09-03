package com.example.info.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexContorller {
	@GetMapping("/postindex")
	public String index() {
		return "index";
	}
	
	@GetMapping("/homeTax/sb_homeTax")
	public String index_homeTax() {
		System.out.println("home");
		return "sb_homeTax";
	}
}
