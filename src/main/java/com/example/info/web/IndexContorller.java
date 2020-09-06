package com.example.info.web;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.info.domain.AttachFileDTO;
import com.mysql.cj.log.Log;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

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
	
	
	private String getFolder() {
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str= sdf.format(date);
		return str;
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjax", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list= new ArrayList<>();
		String uploadFolder="/image/upload";
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		//System.out.println("upload path:"+uploadPath);
		//System.out.println("uploadFolderPath:"+uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName= multipartFile.getOriginalFilename();
			//System.out.println(uploadFileName);
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			//System.out.println("only file name"+uploadFileName);
			
			attachDTO.setFileName(uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			
			try {
				File saveFile=new File(uploadPath, uploadFileName);
				
				//System.out.println("filepath..."+saveFile.toPath());
				multipartFile.transferTo(saveFile);
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				//check and make thumbnail
//				if(checkImageType(saveFile)) {
//					attachDTO.setImage(true);
//					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					thumbnail.close();
//				}
				list.add(attachDTO);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
}
