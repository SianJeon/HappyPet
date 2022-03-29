package com.happypet.animal.Controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Service.AccountService;
import com.happypet.animal.Service.CommonService;

@SessionAttributes("accountVo")
@Controller
public class SignUpController {
	
	@Autowired
	AccountService as;
	
	@Autowired
	CommonService cs;
	
	@ModelAttribute
	public AccountVo defaultModel() {
		return new AccountVo();
	}
	
	
	@RequestMapping(path = "/signup", method = RequestMethod.GET)
	public String singup1Handle(Model model) {

		return "account/signup";
	}
	
	@RequestMapping(path = "/signup", method = RequestMethod.POST)
	public String singupOkHandle(@ModelAttribute @Valid AccountVo vo, BindingResult result) {
		if (result.hasErrors()) {
			return "account/signup";
		}
		boolean r = as.insertAccount(vo);
	
		
		return "account/signupok";
	}
	
	@ResponseBody
	@RequestMapping("/find/zipcode")
	public List<Map> findZipcodeHandle(@RequestParam String data ) {
		List<Map> li =cs.findZipcode(data);
		
		return li;
	}
}
