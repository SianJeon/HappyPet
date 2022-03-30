package com.happypet.animal.Controller;

import com.happypet.animal.Service.AnimalService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
        return "home";
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
    
    
    
    
    

    	
    	
    
}
