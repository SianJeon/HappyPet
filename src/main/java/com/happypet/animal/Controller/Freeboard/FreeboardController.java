package com.happypet.animal.Controller.Freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Entity.Freeboard.PagingVo;
import com.happypet.animal.Service.Freeboard.FreeboardService;
import com.happypet.animal.Service.Freeboard.PagingService;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	@Autowired
	FreeboardService freeboardService;
	
	@Autowired
	PagingService pagingService;

	
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
		System.out.println(vo);
		boolean rst = freeboardService.addNewOne(vo);
		if(!rst) {
		return "freeboard/insert";
		}
		return "redirect:/freeboard/list";
	}
	
//	@RequestMapping("/view")
//	public String writingHandler() {
//		
//		
//		return "freeboard/view";
//	}
	@RequestMapping("/view")
	public String insertPostHandle(@RequestParam int no, Model model,
			@SessionAttribute(required = false) Boolean auth) {
		
		
		FreeboardVo vo =freeboardService.getOneByNo(no);
		if(vo == null) {
			return "redirect:/freeboard/list";
		}
		model.addAttribute("one", vo);
		
		return "freeboard/view";
	}
	
	@GetMapping("/boardPaging")
	public String boardListHandle(PagingVo vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = pagingService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", pagingService.selectBoard(vo));
		System.out.println(vo);
		return "freeboard/boardPaging";
	}
	
	
	@RequestMapping("/detail/delete")
	public String delPageHandle(@RequestParam int no, Model model) {
		
		FreeboardVo vo = freeboardService.getOneByNo(no);
		
		model.addAttribute("user", vo);
		
		return "freeboard/detail/delete";
	}
	
	
	@RequestMapping("/detail/modify")
	public String modPageHandle() {
		
		return "freeboard/detail/modify";
	}
	
	@PostMapping("/detail/delete")
	public String delPostHandle(String pw, RedirectAttributes rttr) {

		freeboardService.delete(pw);
		
		rttr.addFlashAttribute("result","delete success");
		
		return "redirect/freeboard/view";
	}
	
	@PostMapping("/detail/modify")
	public String modPostHandle(String pw, RedirectAttributes rttr) {

		freeboardService.delete(pw);
		
		rttr.addFlashAttribute("result","delete success");
		
		return "redirect/freeboard/view";
	}
}
