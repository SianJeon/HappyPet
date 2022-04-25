package com.happypet.animal.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StepController {

	
	@RequestMapping("step")
	public String step() {
		
		
		return "/animal/step";
	}
}
