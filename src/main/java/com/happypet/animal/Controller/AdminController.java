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

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    MarketService marketService;
    
    @RequestMapping("")
    public String adminHandle()
    {
        return "admin/admin";
    }

    @RequestMapping("/market/insertProduct")
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
        return "redirect:/admin/market/insert";
    } 
    
    
    @RequestMapping("/market/insert")
    public String adminMarketHometHandle() 
    {
    	System.out.println("insert");
    	return "admin/market/market-insert";
	}

    @RequestMapping("market/modify")
    public String adminMarketModifyHandle(Model model) 
    {
        model.addAttribute("vo", marketService.modifyList());
        
        return "admin/market/market-modify";
    }
    
    @RequestMapping("market/market-modifySubmit")
    public String adminModifyActionHandle(@ModelAttribute MarketVo vo, Model model)
    {
    	model.addAttribute("vo", marketService.modifyList());
        MarketVo mVo = vo;

        marketService.updateProduct(mVo);

        return "redirect:/admin/market/modify";
    }

}
