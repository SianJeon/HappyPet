package com.happypet.animal.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Entity.HospitalReviewCommentVo;
import com.happypet.animal.Entity.HospitalReviewVo;
import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Entity.PagingVo;
import com.happypet.animal.Service.HospitalService;

@SessionAttributes("loginUser")
@Controller
public class HospitalController {
	
	@Autowired
	HospitalService hs;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping("/hospital")
	public String hospitalHandle() {
		
		return "hospital/list";
	}
	
	@ResponseBody
	@RequestMapping("/hospital/list")
	public Map hospitalListHandle(@RequestParam("page") int page) {
		
		Map li = hs.hospitalList(page);
		
		
		return li;
	}
	
	@RequestMapping("hospital/detail")
	public String hospitalDetailHandle(@RequestParam("no") int no, Model model) {
		
		HospitalVo vo = hs.findDataByNo(no);
		
		model.addAttribute("data", vo);
		
		return "hospital/detail";
	}
	
	@RequestMapping("hospital/writeReview")
	public String writeReviewHandle(@RequestParam("no") int no, Model model) {
		
		HospitalVo vo = hs.findDataByNo(no);
		
		model.addAttribute("data", vo);
		
		return "hospital/review/write";
	}
	
	@RequestMapping("/hospital/write")
	public String writeHandle(@RequestParam("no") int no, @RequestParam("title") String title,
			@RequestParam("content") String content, @ModelAttribute("loginUser") AccountVo vo) {
		
		HospitalReviewVo review = new HospitalReviewVo();
		
		review.setWriter(vo.getUserId());
		review.setOwner(no);
		review.setTitle(title);
		review.setContent(content);
		
		boolean r = hs.insertReview(review);
		
		if(r == true) {
			return "redirect: /hospital/detail?no="+no;
		}
		return "redirect: /hospital/writeReview";
		
		
	}
	
	@ResponseBody
	@RequestMapping("/hospital/reviewList")
	public Map reviewListHandle(@RequestParam("no") int no, @RequestParam("page") int page){
		
		PagingVo vo = new PagingVo();
		vo.setPage(page);
		
		Map m = new HashMap();
		
		m = hs.findReviewByOwner(no, vo);
		
		return m;
		
	}
	
	
	@RequestMapping("/hospital/reviewDetail")
	public String reviewDetailHandle(@RequestParam("no") int no, Model model) {
		
		HospitalReviewVo vo = hs.findReviewByNo(no);
		
		model.addAttribute("data", vo);
		
		return "hospital/review/detail";
	}
	
	@RequestMapping("/hospital/deleteReview")
	public String deleteReviewHandle(@RequestParam("no") int no) {
		
		HospitalReviewVo vo = hs.findReviewByNo(no);

		hs.deleteReview(no);
		
		
		return "redirect: /hospital/detail?no=" + vo.getOwner();
	}
	
	@RequestMapping("/hospital/reviewUpdate")
	public String updateReviewHandle(@RequestParam("no") int no, Model model) {
		
		HospitalReviewVo vo = hs.findReviewByNo(no);
		
		model.addAttribute("data",vo);
		
		return "hospital/review/update";
	}
	
	@RequestMapping("/hospital/reviewModify")
	public String reviewModifyHandle(@RequestParam("no") int no, @RequestParam("title") String title,
			@RequestParam("content") String content) {
		
		HospitalReviewVo vo = hs.findReviewByNo(no);
		
		vo.setTitle(title);
		vo.setContent(content);
		
		boolean r = hs.updateReviewByNo(vo);
		
		if(r == true) {
			return "redirect: /hospital/reviewDetail?no=" + no;
		}
		return "redirect/hospital/reviewUpdate?no=" + no;
	}
	
	@ResponseBody
	@RequestMapping("/hospital/reviewComment/insert")
	public boolean insertCommentHandle(@RequestParam("owner") int owner, @RequestParam("content") String content, 
			@ModelAttribute("loginUser") AccountVo vo) {
		
		
		HospitalReviewCommentVo comment = new HospitalReviewCommentVo();
		
		comment.setOwner(owner);
		comment.setContent(content);
		comment.setWriter(vo.getUserId());
		
		boolean response = hs.insertReviewComment(comment);
		
		return response;
	}
	
	@RequestMapping("/hospital/reviewComment/list")
	public String commentListHandle(@RequestParam("owner") int owner,  @RequestParam("page") int page, Model model){
		
		PagingVo vo = new PagingVo();
		vo.setPage(page);
		
		model.addAttribute("obj", hs.findCommentByOwner(owner, vo));
		
		return "hospital/review/comment/reviewComment";
	}
	
	@ResponseBody
	@RequestMapping("/hospital/reviewComment/delete")
	public String deleteCommentHandle(@RequestParam("no") int no) {

		HospitalReviewCommentVo vo = hs.findCommentByNo(no);
		
		hs.deleteCommentByNo(no);
		
		
		return "redirect: /hospital/reviewComment/list?owner=" + vo.getOwner();
	}
	
	@ResponseBody
	@RequestMapping("/hospital/reviewComment/modify")
	public String modifyCommentHandle(@RequestParam("no") int no,@RequestParam("content") String content) {

		HospitalReviewCommentVo vo = hs.findCommentByNo(no);
		
		vo.setContent(content);
		
		boolean r = hs.modifyCommentByNo(vo);
		
		
		return "redirect: /hospital/reviewComment/list?owner=" + vo.getOwner();
	}
	
	@RequestMapping("/hospital/review/upload")
	@ResponseBody
	public Map<String, Object> uploadHandle(@RequestParam Map<String, Object> paramMap, 
			MultipartRequest request) throws Exception{
		MultipartFile uploadFile = request.getFile("upload");
		System.out.println(uploadFile.isEmpty() + "/" + uploadFile.toString());
		
		String uploadDir = servletContext.getRealPath("/").replace("\\", "/") + "resources/upload/images/";
		
		String uploadId = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		
		uploadFile.transferTo(new File(uploadDir + uploadId));
		paramMap.put("url", "/upload/images/" + uploadId);
		
		return paramMap;
	}

}
