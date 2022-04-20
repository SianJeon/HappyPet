package com.happypet.animal.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Service.AccountService;

@Controller
public class LogInOutController {
	
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
	
	
}
