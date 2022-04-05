package com.happypet.animal.Controller.Freeboard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;



@ControllerAdvice
public class CommonController{
		
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@ExceptionHandler(RuntimeException.class)
	public String exceptionHandler(Model model, Exception e) {
		logger.info("exception:" + e.getMessage());
		model.addAttribute("exception", e);
		
		return "error/exception";
	}
}
