package com.happypet.animal.Repository;

import java.util.List;

import com.happypet.animal.Entity.TemplateVo;
import com.happypet.animal.Service.TemplateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TemplateDAO {
    
    @Autowired
    TemplateService templateService;

    public TemplateVo testDAO()
    {
        return templateService.testSQL();
    }

}
