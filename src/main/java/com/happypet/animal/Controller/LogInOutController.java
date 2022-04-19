package com.happypet.animal.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Service.AccountService;
import com.happypet.animal.Service.MailService;

@Controller
public class LogInOutController {
	
	@Autowired
	AccountService as;
	
	@Autowired
	MailService ms;
	
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
	
	// 아이디 찾기
	@RequestMapping("/forgetId")
	public String idHandle() {
		
		return "account/findId";
	}
	
	@ResponseBody
	@RequestMapping("/login/findId")
	public String findIdHandle(@ModelAttribute("name") String name, @ModelAttribute("email") String email){
		
		String rst = as.getIdByNameandEmail(name, email);
		
		if(rst != null) {
			return rst;
		}
		return "";
	}
	
	@RequestMapping("/forgetPw")
	public String pwHandle() {
		
		return "account/findPass";
	}
	
	@ResponseBody
	@RequestMapping("/login/findData")
	public AccountVo findId2Handle(@ModelAttribute("name") String name, @ModelAttribute("id") String id, @ModelAttribute("email") String email){
	
		AccountVo vo = as.getDataByParameters(name, email, id);
		
		return vo;
		
	}
	
	@RequestMapping("/login/changePass")
	@ResponseBody
	public int changePassHandle( @RequestParam("userPass")  String userPass, @RequestParam("userId") String userId) {
		int rst = 0;
		
		AccountVo vo = as.selectOneById(userId);
		
		vo.setUserPass(userPass);
		
		boolean r = as.changePass(vo);
		
		if(r == true) rst = 1;
		
		
		return rst;
		
	}
	
	
	
}
