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
    
    @RequestMapping("/appointment")
    public String appointmentHandle(Model model)
    {
        return "exFile/appointment";
    }
    
    @RequestMapping("/project")
    public String projectHandle(Model model)
    {
        return "exFile/project";
    }
    
    @RequestMapping("/404")
    public String fourZeroHandle(Model model)
    {
        return "exFile/404";
    }
    
    @RequestMapping("/about")
    public String aboutHandle(Model model)
    {
        return "exFile/about";
    }
    
    @RequestMapping("/temp")
    public String tempHandle(Model model)
    {
        return "exFile/temp";
    }
    
    @RequestMapping("/feature")
    public String featureHandle(Model model)
    {
        return "exFile/feature";
    }
    
    @RequestMapping("/contact")
    public String contactHandle(Model model)
    {
        return "exFile/contact";
    }
    
    
    
    
    
    
    
}
