package com.happypet.animal.Controller;

import com.happypet.animal.Entity.TemplateVo;
import com.happypet.animal.Repository.TemplateDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TemplateController {

	@Autowired
    TemplateDAO dao;

    @RequestMapping("/")
    public String testHandle(Model model)
    {
    	System.out.println("TestHandle start");
    	TemplateVo vo = dao.testDAO();
        model.addAttribute("vo", vo.getUser_id());
        System.out.println(vo.getUser_id());
        return "home";
    }
    
}
