package com.happypet.animal.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.happypet.animal.Entity.FreeboardVo;
import com.happypet.animal.Service.FreeboardService;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	@Autowired
	FreeboardService freeboardService;

	@RequestMapping("/list")
	public String listHandler() {
		return "freeboard/list";
	}
	
	@RequestMapping(path="/list", method= RequestMethod.GET)
	public String listGetHandler(Model model) {
		
		model.addAttribute("all",freeboardService.getAll());
		
		return "freeboard/list";
	}
	
	@RequestMapping(path="/insert", method= RequestMethod.GET)
	public String insertGetHandler() {
		
		return "freeboard/insert";
	}
	
	@RequestMapping(path="/insert", method= RequestMethod.POST)
	public String insertPostHandler(@ModelAttribute FreeboardVo vo,Model model) {
		boolean rst = freeboardService.addNewOne(vo);
		if(!rst) {
		return "freeboard/insert";
		}
		return "redirect:/freeboard/list";
	}
	
	@RequestMapping("/writing")
	public String writingHandler(@RequestParam int no, Model model,@SessionAttribute Boolean auth) {
		FreeboardVo vo =freeboardService.getOneByNo(no);
		if(vo == null) {
			return "redirect:/freeboard/list";
		}
		model.addAttribute("one", vo);
		
		return "freeboard/writing";
	}
}
