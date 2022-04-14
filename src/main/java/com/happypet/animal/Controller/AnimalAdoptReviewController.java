package com.happypet.animal.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.AnimalCommentVo;
import com.happypet.animal.Entity.AnimalDetailVo;
import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Entity.FileDataVo;
import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.PagingVo;
import com.happypet.animal.Service.AnimalReviewService;
import com.happypet.animal.Service.FileService;

@Controller
public class AnimalAdoptReviewController {

	@Autowired
	AnimalReviewService animalReviewService;
	
	@Autowired
	FileService fileService;
	
	@ResponseBody
	@RequestMapping("animal/review")
	public  Map<String,Object> animalReview(@RequestParam int page) {
	
		PagingVo vo = new PagingVo();
		vo.setPage(page);
		
		return animalReviewService.animalreview(vo);
		
	
	}
	
	
	
	

	@RequestMapping("animal/reviewdetail")
	public String animaldetail(@RequestParam String no,Model model) {
		
		
		model.addAttribute("detail", animalReviewService.animalDetail(no));
		
		return "animal/detail";	
		
	
	}
	
	@RequestMapping("animal/comment")
	public String animalcomment(@RequestParam String writer , @RequestParam String content,@RequestParam String no) {
		
		AnimalCommentVo vo = new AnimalCommentVo();
		
		vo.setWriter(writer);
		vo.setContent(content);
		vo.setOwner(no);
		animalReviewService.animalComment(vo);
	
		return "redirect:/animal/reviewdetail?no="+no;
	}
	
	@ResponseBody
	@RequestMapping("animal/commentall")
	public Map<String,Object> animalCommentAll(@RequestParam String owner,@RequestParam int page) {
		
		
		
		
		Map<String,Object> map = new HashMap<>();
		
		
		map.put("owner",owner);
		map.put("page", page);
		
		
		
		
		
		return animalReviewService.animalCommentAll(map);
		
		
	}
	

	@RequestMapping("animal/commentdele")
	public String animalCommentDele(@RequestParam String no,@RequestParam String owner) {
		
		System.out.println(no);
		
		animalReviewService.animalCommentdele(no);
	
		
		return "redirect:/animal/reviewdetail?no="+owner;
		

		
	}
	
	
	@ResponseBody
	@RequestMapping("animal/commentupdate")
	public int animalCommentDele(@RequestParam String no, @RequestParam String content,Model model) {
			AnimalCommentVo vo = new AnimalCommentVo();
			
			vo.setContent(content);
			vo.setNo(no);
		
		
			return animalReviewService.animalCommentupdate(vo);
		
		
			
		
	}
	@RequestMapping("animal/decomdelete")
	public String animlaCommentdetailDelete(@RequestParam String no) {
		
		animalReviewService.animalCommentdetailDelete(no);
		
		return "redirect:/adopt";
	}
	
	@RequestMapping("animal/deupdate")
	public String deupdate(@RequestParam String no,Model model) {
		
			model.addAttribute("list", animalReviewService.animalDetail(no));
		
		
		return "/animal/update";
	}
	
	@RequestMapping(path = "animal/update",method = RequestMethod.POST)
	public String update(@RequestParam String no,@RequestParam String content ,@RequestParam String title,@RequestParam MultipartFile[] attach ) {
			AnimalDetailVo vo = new AnimalDetailVo();
		
			vo.setNo(no);
			vo.setContent(content);
			vo.setTitle(title);
		
		animalReviewService.animalDetailupdate(vo);
		fileService.update(vo, attach);
		
		return "redirect:/animal/reviewdetail?no="+vo.getNo();
	}
	
}
