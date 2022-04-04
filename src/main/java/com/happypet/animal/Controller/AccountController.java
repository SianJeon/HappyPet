package com.happypet.animal.Controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Service.AccountService;
import com.happypet.animal.Service.MailService;

@SessionAttributes("loginUser")
@Controller
public class AccountController {
	
	@Autowired
	AccountService as;
	
	@Autowired
	MailService ms;
	
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
	
	// 프사 변경화면
	@RequestMapping("/settings/profiles")
	public String profilesHandle() {
		
		
		return "account/setting/profile";
	}
	
	@RequestMapping("/settings/profile")
	public String profileHandle(@ModelAttribute("loginUser") AccountVo vo, @RequestParam MultipartFile attach) {
		
		vo.setAttach(attach);
		
		boolean r = as.addProfile(vo);
		
		return "redirect: /settings/profiles";
	}
	
	// 개인정보변경화면
	@RequestMapping("/settings/privacy")
	public String privacyHandle() {
		
		
		return "account/setting/privacy";
	}
	
	// 개인정보변경화면
	@RequestMapping("/settings/password")
	public String passwordHandle() {
		
		
		return "account/setting/password";
	}
	
	@PostMapping("/settings/modify")
	public String settingsModifyHandle(@ModelAttribute("loginUser") AccountVo vo) {
		// id, email 이라는 이름으로 데이터가 넘어옴.
		// 그 정보로 로그인 사용자의 email을 update
		
		boolean r = as.updateData(vo);
		
		
		return "redirect:/settings";
	}
	
	@PostMapping("/settings/passChk")
	@ResponseBody
	public int passChkHandle(@ModelAttribute("loginUser") AccountVo vo, @RequestParam String userPass) {
		
		int rst;
		
		boolean valid = as.isValidAccount(vo.getUserId(), userPass);
	
		if(valid == true) {
			rst = 1;
		}else{
			rst = 0;
		}
		
		return rst;
	}
	
	@PostMapping("/settings/changePass")
	@ResponseBody
	public int changePassHandle(@ModelAttribute("loginUser") AccountVo vo, @RequestParam String userPass) {
		int rst = 0;
		
		vo.setUserPass(userPass);
		
		boolean r = as.changePass(vo);
		
		if(r == true) rst = 1;
		
		
		return rst;
	}
	
	// 메일 인증 화면이동
	@GetMapping("/settings/auth")
	public String authHandle() {
		
		return "account/auth";
	}
	
	// 인증 번호 발송용
	@ResponseBody
	@RequestMapping("/settings/reqAuth")
	public Map<String, Object> reqAuthHandle(@ModelAttribute("loginUser") AccountVo vo, HttpSession hs){
		
		Map<String, Object> rst = ms.sendAuthMail(vo.getEmail()) ;
		
		if(rst.containsKey("authKey")) {
			hs.setAttribute("authKey", rst.get("authKey"));
			rst.remove("authKey");
		}
		
		return rst;
	}
	
	@RequestMapping("/settings/verify")
	public String verifyHandle(@ModelAttribute AccountVo vo, 
			HttpSession hs, @RequestParam String key, Model model) {
		
		String authKey =(String)hs.getAttribute("authKey");
		if(authKey.equals(key)) {
			AccountVo loginVo = (AccountVo)hs.getAttribute("loginUser");
			
			vo.setAuth("Y");
			vo.setUserId(loginVo.getUserId());
			
			as.updateData(vo);
			
			AccountVo reVo = as.selectOneById(vo.getUserId());
			hs.setAttribute("loginUser", reVo);
			return "redirect:/settings/auth";
		}else {
			model.addAttribute("err", "errr");
			return "account/auth";
		}
	}
}
