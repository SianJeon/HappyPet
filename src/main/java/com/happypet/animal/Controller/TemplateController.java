package com.happypet.animal.Controller;

import com.happypet.animal.Entity.TemplateVo;
import com.happypet.animal.Repository.TemplateDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TemplateController {

    @RequestMapping("/")
    public String testHandle(Model model)
    {
        return "home";
    }
    
    @RequestMapping("/settingss")
    public String templateHandle(Model model)
    {
        return "account/settingss";
    }
    
}
