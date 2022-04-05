package com.happypet.animal.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.FileBoardVo;
import com.happypet.animal.Service.FileService;


@Controller
public class FileRoomController {

	@Autowired
	FileService fileService;
	
	
	@RequestMapping(path="/add", method = RequestMethod.POST)
	public String addPostHandle(@ModelAttribute FileBoardVo vo , @RequestParam MultipartFile[] attach) {
			
		
		
		fileService.registerOne(vo, attach);
		
	
			return "redirect:/adopt";
	}
	
}
