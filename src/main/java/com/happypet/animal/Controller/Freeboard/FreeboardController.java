package com.happypet.animal.Controller.Freeboard;

import java.io.File;
import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.happypet.animal.Entity.Freeboard.Criteria;
import com.happypet.animal.Entity.Freeboard.FileVo;
import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Entity.Freeboard.PageVo;
import com.happypet.animal.Service.Freeboard.CommentService;
import com.happypet.animal.Service.Freeboard.DetailService;
import com.happypet.animal.Service.Freeboard.FreeboardFileService;
import com.happypet.animal.Service.Freeboard.FreeboardService;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	@Autowired
	FreeboardService freeboardService;

	@Autowired
	DetailService detailService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	FreeboardFileService fileService;
	

	@RequestMapping(path="/list", method= RequestMethod.GET)
	public String listGetHandler(Model model,Criteria cri) {
		
		model.addAttribute("all", freeboardService.getListPaging(cri));
		
		int total = freeboardService.getTotal(cri);
		
		PageVo pageMake = new PageVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
//		model.addAttribute("all", freeboardService.getAll());
		
//		model.addAttribute("all",freeboardService.getAll(pv));
//		model.addAttribute("pageMaker", new pageVo(pv,123));
		
		return "freeboard/list";
	}
	
	
	@RequestMapping(path="/insert", method= RequestMethod.GET)
	public String insertGetHandler() {
		
		return "freeboard/insert";
	}
	
	@RequestMapping(path="/insert", method= RequestMethod.POST)
	public  String insertPostHandler(@ModelAttribute FreeboardVo vo,Model model,
			@RequestParam(required = false) MultipartFile[] file,MultipartHttpServletRequest mRequest) {
		System.out.println(vo);
		
			
		
		 	List<MultipartFile> fileList = mRequest.getFiles("file");
	        String src = mRequest.getParameter("src");
	        	
	        String path = "/Users/leemyeonghan/Documents/";
	        
	        boolean rst = freeboardService.addNewOne(vo);
	        
	        for (MultipartFile mf : fileList) {
	        	if(mf.isEmpty()) {
	        		System.out.println("!!!?????? ????????????!!!!");
	        		continue;
	        	}
	            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
	            long fileSize = mf.getSize(); // ?????? ?????????
	            String contentType = mf.getContentType(); //?????? ??????
	           
	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	            System.out.println("contentType : " + contentType);
	            
	            String safeFile =  path + originFileName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
         			e.printStackTrace();
	            }
	            FileVo fileVo = new FileVo();
	            fileVo.setFileName(originFileName);
	            fileVo.setFilePath(path);
	            fileVo.setFileSize(fileSize);
	            fileVo.setFileType(contentType);
	            fileVo.setNo(vo.getNo());
	                      	            
	            model.addAttribute("all",fileService.insertOneNew(fileVo) );
	        }	        
	                 
	        
			if(!rst) {
			return "freeboard/insert";
			}
			return "redirect:/freeboard/list";
	}
	
	@RequestMapping("/view")
	public String insertPostHandle(@RequestParam int no, Model model,
			@SessionAttribute(required = false) Boolean auth, Criteria cri) {
		
		
		
		
		FreeboardVo vo =freeboardService.getOneByNo(no);
		if(vo == null) {
			return "redirect:/freeboard/list";
		}
		
		model.addAttribute("one", vo);
		
		
		model.addAttribute("list", fileService.selectFileList(no));
		// model.addAttribute("listSize", fileService.selectFileList(no));
		
		//model.addAttribute("all", commentService.listAll(no));
		cri.setFbNo(no);
		model.addAttribute("all", commentService.getListPaging(cri));
	//	int total = commentService.getTotal();	// ????????? ???????
		int total = commentService.getTotal(no);
		
		PageVo pageMake2 = new PageVo(cri,total);
		
		model.addAttribute("pageMaker2", pageMake2);
		
		return "freeboard/view";
	}
	
	
	@GetMapping("/detail/delete")
	public String delPageHandle(@RequestParam int no, Model model) {
		
		model.addAttribute("no", no);
		
		return "freeboard/detail/delete";
	}
	
	
	@PostMapping("/detail/delete")
	public String delPostHandle(@ModelAttribute FreeboardVo vo, Model model) {
		
		// vo ?????? no ?????? pw?????? ???????????? ???,
		
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
		// ModelAttribute ??? ????????? ??? ????????? pw ??? no??? ??????????????????.
		// ??? ???????????? ????????? ???????????????..
		
		
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
	
	@GetMapping("/download")
	public ResponseEntity fileDownHandle(Model model,@RequestParam(required = false ) int no) {
		System.out.println("-------------");
		System.out.println(no);
		
		FileVo vo = fileService.selectDownFile(no);
		// System.out.println(vo);
		Resource resource = new FileSystemResource(vo.getFilePath()+vo.getFileName());
		if(resource.exists()) {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Disposition", "attachment; filename="+vo.getFileName());
			header.add("Content-Length", String.valueOf(vo.getFileSize()));
			header.add("Content-type", vo.getFileType());
			
			
			ResponseEntity resp = new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
			return resp;
			
		}else {
			ResponseEntity resp = new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
			return resp;
		}
				
	}

}
