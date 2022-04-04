package com.happypet.animal.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Service.HospitalService;

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
		
		model.addAttribute("data", hs.findDataByNo(no));
		
		return "hospital/detail";
	}
	
	
}
