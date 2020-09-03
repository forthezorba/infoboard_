package com.example.info.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.info.service.TaxService;

@Controller
@RestController
@RequestMapping("/homeTax/")
public class HomeTaxController {
	@Autowired
    TaxService taxService;
	
	
	@SuppressWarnings("deprecation")
	@PostMapping(value="/sendReq",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> homeTax_index(@RequestBody String txprDscmNo) throws Exception{ 
			System.out.println(txprDscmNo);
		return new ResponseEntity<>(taxService.queryJson(txprDscmNo),HttpStatus.OK);
	}  
//	@GetMapping("/query_action")
//	public String query_action(@RequestParam("txprDscmNo") String txprDscmNo,Model model) throws Exception {
//		System.out.println(txprDscmNo);
//		model.addAttribute("query_result",taxService.query(txprDscmNo).get("map"));
//		
//		model.addAttribute("json_res",taxService.queryJson(txprDscmNo));
//		
//		return "sb_homeTax";
//	}
}
