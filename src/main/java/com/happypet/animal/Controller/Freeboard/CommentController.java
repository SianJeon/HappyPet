package com.happypet.animal.Controller.Freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.happypet.animal.Entity.Freeboard.CommentVo;
import com.happypet.animal.Service.Freeboard.CommentService;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@PostMapping("/comment/add")
	public String insertPostHandle(@ModelAttribute CommentVo vo, Model model) {
		boolean r = commentService.addNewOne(vo);
		
		return "redirect:/freeboard/view?no="+vo.getFbNo();
	}	
	
}