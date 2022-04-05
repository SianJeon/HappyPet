package com.happypet.animal.Controller;

import com.happypet.animal.Repository.TemplateDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String homeHandle(Model model)
    {
        return "index";
        // return "template";
        // return "contact";
    }
}
