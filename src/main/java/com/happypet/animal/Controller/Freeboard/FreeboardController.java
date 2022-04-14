package com.happypet.animal.Controller.Freeboard;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Entity.Freeboard.PagingVo;
import com.happypet.animal.Service.Freeboard.CommentService;
import com.happypet.animal.Service.Freeboard.DetailService;
import com.happypet.animal.Service.Freeboard.FileService;
import com.happypet.animal.Service.Freeboard.FreeboardService;
import com.happypet.animal.Service.Freeboard.PagingService;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	@Autowired
	FreeboardService freeboardService;
	
	@Autowired
	PagingService pagingService;

	@Autowired
	DetailService detailService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	FileService fileService;
	
	@RequestMapping("/list")
	public String listHandler() {
		return "freeboard/list";
	}
	
	//properties에 있는 uploadPath값 가져오기
    @Resource(name="uploadPath")
    String uploadPath;
	
	
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
	public String insertPostHandler(@ModelAttribute FreeboardVo vo,Model model,@RequestParam(required = false) MultipartFile[] file) {
		System.out.println(vo);
		
		
		String path = "/Users/leemyeonghan/Documents/upload";
		


		
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
		
		model.addAttribute("all", commentService.listAll(no));
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
	
	
	@GetMapping("/detail/delete")
	public String delPageHandle(@RequestParam int no, Model model) {
		
		model.addAttribute("no", no);
		
		return "freeboard/detail/delete";
	}
	
	
	@PostMapping("/detail/delete")
	public String delPostHandle(@ModelAttribute FreeboardVo vo, Model model) {
		
		// vo 에는 no 하고 pw값이 넘어와야 함,
		
		boolean r= detailService.deleteOne(vo);
		
		System.out.println(r);
		// rttr.addFlashAttribute("result","delete success");
		if(r)
			return "redirect:/freeboard/list";
		else 
			return "freeboard/detail/fail";
	}
	

	@GetMapping("/detail/modify")
	public String modGetHandle(@RequestParam int no, Model model) {
		
		model.addAttribute("no",no);
		
		return "freeboard/detail/modify";
	}

	@PostMapping("/detail/modifyTable")
	public String modTbHandle(@ModelAttribute FreeboardVo vo, Model model) {
		// ModelAttribute 를 받으면 이 안에는 pw 랑 no가 들어있을거임.
		// 이 데이터를 가지고 와야되는데..
		
		
		FreeboardVo dbVo =freeboardService.getOneByNo(vo.getNo());
		
		if(dbVo.getPw().equals(vo.getPw()) ){
			model.addAttribute("dbVo", dbVo);
			return "freeboard/detail/modifyTable";			
		} else {			
			return "redirect:/freeboard/detail/modify?no="+vo.getNo();
		}
		
	}
	
	@PostMapping("/detail/update")
	public String updatePostHandle(@ModelAttribute FreeboardVo vo, Model model) {
		System.out.println(vo);
		
		boolean r = freeboardService.modifyOne(vo);
		if(r)
			return "redirect:/freeboard/list";
		else
			return "freeboard/modifyTable?no="+vo.getNo();
	}
	
	

}
