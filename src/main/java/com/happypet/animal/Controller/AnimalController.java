package com.happypet.animal.Controller;

import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Service.AnimalService;

import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnimalController {

	
	
	@Autowired
	AnimalService animalService;

    @RequestMapping("/")
    public String testHandle()
    {
        return "index";
    }
    
    @RequestMapping("/animal")
    public String animalList() {
    	
    
    	
    	return "/animal/animallist";
    }

     
    
    @ResponseBody
    @RequestMapping("/animal/list")
    public List<Map> animal(@RequestParam String pageNo) {
    	
    	List<Map> rst= animalService.animalList(pageNo);
  
    	
    	return rst;
    }
    
    @RequestMapping("/animal/insert")
    	public void animalInsert() throws ParseException {
    		
    		
    	animalService.animalinsertDay();
    		
    	}
   
    @RequestMapping("/animal/detail")
    	public String animalDetail(@RequestParam String desertionNo,Model model) {
    	
    	model.addAttribute("detail", animalService.animalDetail(desertionNo));
    	
    	
    	return "/animal/animaldetail";
    }
    
  
    @RequestMapping("/adopt")
    public String animaladopt() {
    	
    	
    	return "/animal/adopt";
    }
     
    @RequestMapping("/write")
    public String write() {
    	
    	
    	
    	return "/animal/write";
    }
    
    
    
    

    	
    	
    
}
