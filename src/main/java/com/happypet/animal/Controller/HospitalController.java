package com.happypet.animal.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HospitalController {
	
	@RequestMapping("/hospital")
	public String hospitalHandle() {
		
		return "hospital/list";
	}
}
