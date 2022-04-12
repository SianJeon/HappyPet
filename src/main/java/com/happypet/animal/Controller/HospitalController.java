package com.happypet.animal.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Entity.HospitalReviewCommentVo;
import com.happypet.animal.Entity.HospitalReviewVo;
import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Service.HospitalService;

@SessionAttributes("loginUser")
@Controller
public class HospitalController {
	
	@Autowired
	HospitalService hs;
	
	@RequestMapping("/hospital")
	public String hospitalHandle() {
		
		return "hospital/list";
	}
	
	@ResponseBody
	@RequestMapping("/hospital/list")
	public List<Map> hospitalListHandle(@RequestParam("page") int page, @RequestParam("rows") int rows) {
		
		List<Map> li = hs.hospitalList(page, rows);
		
		
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
	public List<HospitalReviewVo> reviewListHandle(@RequestParam("no") int no){
		
		
		List<HospitalReviewVo> list = hs.findReviewByOwner(no);
		
		return list;
		
	}
	
	
	@RequestMapping("/hospital/reviewDetail")
	public String reviewDetailHandle(@RequestParam("no") int no, Model model) {
		
		HospitalReviewVo vo = hs.findReviewByNo(no);
		
		model.addAttribute("data", vo);
		
		return "hospital/review/detail";
	}
	
	@RequestMapping("/hospital/deleteReview")
	public String deleteReviewHandle(@RequestParam("no") int no) {
		
		System.out.println(no);
		
		
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
	public String commentListHandle(@RequestParam("owner") int owner, Model model){
		
		List<HospitalReviewCommentVo> comments = hs.findCommentByOwner(owner);
		
		model.addAttribute("comments", comments);
		
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
	
	
	// 이미지 업로드
//	@RequestMapping("/hospital/review/fileUpload")
//	public void fileUploadHandle(HttpServletRequest request,
//    		HttpServletResponse response, MultipartHttpServletRequest multiFile
//    		, @RequestParam MultipartFile upload) throws Exception{
//		
//		// 랜덤 문자 생성
//		UUID uid = UUID.randomUUID();
//		
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		
//		// 인코딩
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
//		
//		try {
//			// 파일이름 가져오기
//			String fileName = upload.getOriginalFilename();
//			byte[] bytes = upload.getBytes();
//			
//			// 이미지 경로 생성
//			String path = "C:\\Users\\kkh50\\OneDrive\\사진\\images" + "ckImages/"; // 이미지 경로설정(폴더 자동 생성)
//			String ckUploadPath = path + uid + "_" + fileName;
//			
//			File folder = new File(path);
//			
//			System.out.println("path : " + path); // 이미지 저장경로 확인용
//			
//			// 해당 디렉토리 확인
//			
//			if(!folder.exists()) {
//				try{
//					folder.mkdirs(); // 폴더생성
//				}catch(Exception e) {
//					e.getStackTrace();
//				}
//			}
//			
//			out = new FileOutputStream(new File(ckUploadPath));
//			out.write(bytes);
//			out.flush(); // outputStream 에 저장된 데이터를 전송하고 초기화
//			
//			String callback = request.getParameter("CKEditorFuncNum");
//			
//			printWriter = response.getWriter();
//			String fileUrl = "/hospital/review/fileSubmit?uid=" + uid + "&fileName=" +fileName; // 작성화면 
//			
//			// 업로드시 메시지 출력
//			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
//			printWriter.flush();
//		}catch(IOException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(out != null) { out.close();}
//				if(printWriter != null) { printWriter.close(); }
//			}catch(IOException e) {e.printStackTrace();}
//		}
//	}
	
	// 서버로 전송된 이미지 뿌려주기
//	@RequestMapping("/hospital/review/fileSubmit")
//	public void imageSubmit(@RequestParam("uid") String uid, @RequestParam(value="fileName") String fileName
//    		, HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//		
//		// 서버에 저장된 이미지 경로
//		String path = "C:\\Users\\kkh50\\OneDrive\\사진\\images\\" + "ckImages/";  // 저장된 이미지 경로
//		System.out.println("path : " + path);
//		String sDirPath = path + uid + "_" + fileName;
//		
//		File imgFile = new File(sDirPath);
//		
//		// 사진이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일 설정
//		if(imgFile.isFile()) {
//			byte[] buf = new byte[1024];
//			int readByte = 0;
//			int length = 0;
//			byte[] imgBuf = null;
//			
//			FileInputStream fileInputStream = null;
//			ByteArrayOutputStream outputStream = null;
//			ServletOutputStream out = null;
//			
//			try {
//				fileInputStream = new FileInputStream(imgFile);
//				outputStream = new ByteArrayOutputStream();
//				out = response.getOutputStream();
//				
//				while((readByte =  fileInputStream.read(buf)) != -1) {
//					outputStream.write(buf, 0, readByte);
//				}
//				
//				imgBuf = outputStream.toByteArray();
//				length = imgBuf.length;
//				out.write(imgBuf, 0,  length);
//				out.flush();
//			}catch(IOException e) {
//				e.printStackTrace();
//			}finally {
//				outputStream.close();
//				fileInputStream.close();
//				out.close();
//			}
//		}
//	}
}
