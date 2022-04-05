package com.happypet.animal.Controller;

import java.io.IOException;
import java.util.List;

import com.happypet.animal.Entity.MarketEntity.Market;
import com.happypet.animal.Entity.MarketEntity.MarketFileVo;
import com.happypet.animal.Entity.MarketEntity.MarketVo;
import com.happypet.animal.Service.MarketService.MarketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class AdminController {

    @Autowired
    MarketService marketService;
    
    @RequestMapping("admin")
    public String adminHandle()
    {
        return "admin/admin";
    }

    @RequestMapping("admin/market/insertProduct")
    public String insertHandle(@ModelAttribute Market vo)
    {
        MarketVo marketVo = vo.getMarketVo();
        MarketFileVo marketFileVo = vo.getMarketFileVo();
        
        try 
        {
            marketService.insertProductDetail(marketVo, marketFileVo);
        } 
        catch (IllegalStateException | IOException e) 
        {
            e.printStackTrace();
        }
        return "redirect:/admin";
    } 
    
    
    @RequestMapping("/market-admin")
    public String adminMarketHometHandle() {return "admin/market/market-insert";}

    @RequestMapping("market/modify")
    public String adminMarketModifyHandle(Model model) 
    {
        model.addAttribute("vo", marketService.modifyList());
        
        return "admin/market/market-modify";
    }
    
    @RequestMapping("/market-modifySubmit")
    public String adminModifyActionHandle(@ModelAttribute MarketVo vo)
    {
        MarketVo mVo = vo;

        System.out.println(mVo.getCategory());
        System.out.println(mVo.getCompany());
        System.out.println(mVo.getDiscount());
        System.out.println(mVo.getProductName());
        System.out.println(mVo.getProductPrice());
        return "admin/market/market-modify";
    }

    @RequestMapping("market/insert")
    public String adminMarketInsertHandle() {return "admin/market/market-insert";}

}
