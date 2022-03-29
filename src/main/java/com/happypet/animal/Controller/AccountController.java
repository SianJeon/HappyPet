package com.happypet.animal.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Service.AccountService;

@SessionAttributes("loginUser")
@Controller
public class AccountController {
	
	@Autowired
	AccountService as;
	
	// 로그인 화면 이동
	@RequestMapping("/login")
	public String loginHandle() {
		return "account/login";
	}
	
	// 로그인
	@PostMapping("/session")
	public String sessionHandle(HttpSession session, @RequestParam String loginId, @RequestParam String loginPass, Model model) {
		
		
		boolean valid = as.isValidAccount(loginId, loginPass);
		
		if (valid) {
			AccountVo vo = as.selectOneById(loginId);
			// vo == null ?
			session.setAttribute("loginUser", vo);
			
			return "redirect:/";
		} else {
			model.addAttribute("err", "error");
			return "account/login";
		}
		
		
	}
	

	// 로그아웃
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 마이페이지
	@RequestMapping("/mypage")
	public String myPageHandle(HttpSession session) {
		return "account/mypage";
	}
	
	// 정보변경
	@RequestMapping("/settings")
	public String settingsHandle() {
		
		
		return "account/settings";
	}
	
	// 프사 변경
	@RequestMapping("/settings/profile")
	public String profileHandle(@ModelAttribute("loginUser") AccountVo vo, @RequestParam MultipartFile attach) {
		
		vo.setAttach(attach);
		
		boolean r = as.addProfile(vo);
		
		return "redirect:/settings";
	}
	
	@PostMapping("/settings/modify")
	public String settingsModifyHandle(@ModelAttribute("loginUser") AccountVo vo) {
		// id, email 이라는 이름으로 데이터가 넘어옴.
		// 그 정보로 로그인 사용자의 email을 update
		
		boolean r = as.updateData(vo);
		
		
		return "redirect:/settings";
	}
	
	@PostMapping("/settings/passChk")
	public String passChkHandle(@ModelAttribute("loginUser") AccountVo vo, @RequestParam String userPass) {
		
		String result = "";
		
		boolean valid = as.isValidAccount(vo.getUserId(), userPass);
		
		System.out.println(valid);
		
		if(valid == true) {
			result = "passOk";
		}else{
			result = "passNo";
		}
		
		return result;
	}
	
	
	
}
