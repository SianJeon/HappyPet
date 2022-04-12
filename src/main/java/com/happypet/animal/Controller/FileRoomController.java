package com.happypet.animal.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.FileDataVo;
import com.happypet.animal.Service.FileService;

@Controller
public class FileRoomController {

	@Autowired
	FileService fileService;
	
	
	
	@RequestMapping(path="/add", method = RequestMethod.POST)
	public String addPostHandle(@ModelAttribute AnimalReviewVo vo , @RequestParam MultipartFile[] attach) {
			
				
		fileService.registerOne(vo, attach);
			
	
			return "redirect:/adopt";
	}
	
	@RequestMapping(path = "/download")
	public ResponseEntity<Resource> downloadHandle(@RequestParam int no) {
		
		FileDataVo vo = fileService.filedownload(no);
		
		
		
		Resource resource = new FileSystemResource(vo.getPath());
		
		if(!resource.exists())
			return null;
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Disposition", "attachment; filename="+vo.getName());
		header.add("Content-Length", String.valueOf(vo.getLen()));
		header.add("Content-type", vo.getType());
		
		ResponseEntity<Resource>  resp = new ResponseEntity<Resource>(resource, header,HttpStatus.OK);
		
		return resp;
		
		
	}
	
	
	
	
}
