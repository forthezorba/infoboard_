package com.example.info.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;


import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class TaxService {
    
    public Map<String, Object> query(String txprDscmNo) throws Exception{
		
	
		String uri = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=";
		String sendStr ="<map id=\"ATTABZAA001R08\">\n" + 
				"    <pubcUserNo/>\n" + 
				"    <mobYn>N</mobYn>\n" + 
				"    <inqrTrgtClCd>1</inqrTrgtClCd>\n" + 
				"    <txprDscmNo>crn_here</txprDscmNo>\n" + 
				"    <dongCode>45</dongCode>\n" + 
				"    <psbSearch>Y</psbSearch>\n" + 
				"    <map id=\"userReqInfoVO\"/></map>";

		final String USER_AGENT = "Mozilla/5.0";

		URL obj = new URL(uri);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		
		sendStr = sendStr.replace("crn_here", txprDscmNo);

		// request method
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT); // add request header
		con.setRequestProperty("Content-length", String.valueOf(sendStr));
		con.setRequestProperty("Content-Type", "application/xml;charset=UTF-8");
//		        // Send post request
		con.setDoOutput(true);

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
		bw.write(sendStr);
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		StringBuffer response = new StringBuffer();
		String line = "";
		

		while ((line = br.readLine()) != null) {
			response.append(line);
		}
		
        JSONObject xmlJSONObj = XML.toJSONObject(response.toString()); 
   		String result = (xmlJSONObj.toString(4));
   		
   		
	   	ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> map = mapper.readValue(xmlJSONObj.toString(), new TypeReference<Map<String,Object>>(){});
	    
	    System.out.println(map.get("map")); 
	    
    	return map;
    }
    
    
    public String queryJson(String txprDscmNo) throws Exception{
    	
    	
    	String uri = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=";
    	String sendStr ="<map id=\"ATTABZAA001R08\">\n" + 
    			"    <pubcUserNo/>\n" + 
    			"    <mobYn>N</mobYn>\n" + 
    			"    <inqrTrgtClCd>1</inqrTrgtClCd>\n" + 
    			"    <txprDscmNo>crn_here</txprDscmNo>\n" + 
    			"    <dongCode>45</dongCode>\n" + 
    			"    <psbSearch>Y</psbSearch>\n" + 
    			"    <map id=\"userReqInfoVO\"/></map>";
    	
    	final String USER_AGENT = "Mozilla/5.0";
    	
    	URL obj = new URL(uri);
    	HttpURLConnection con = (HttpURLConnection) obj.openConnection();
    	
    	sendStr = sendStr.replace("crn_here", txprDscmNo);
    	
    	// request method
    	con.setRequestMethod("POST");
    	con.setRequestProperty("User-Agent", USER_AGENT); // add request header
    	con.setRequestProperty("Content-length", String.valueOf(sendStr));
    	con.setRequestProperty("Content-Type", "application/xml;charset=UTF-8");
//		        // Send post request
    	con.setDoOutput(true);
    	
    	BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
    	bw.write(sendStr);
    	bw.flush();
    	bw.close();
    	
    	BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    	StringBuffer response = new StringBuffer();
    	String line = "";
    	
    	
    	while ((line = br.readLine()) != null) {
    		response.append(line);
    	}
    	
    	JSONObject xmlJSONObj = XML.toJSONObject(response.toString()); 
    	String jsonRes = (xmlJSONObj.toString(4));
    	
    	System.out.println(jsonRes);

    	
    	return jsonRes;
    }

}
