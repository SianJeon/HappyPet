package com.happypet.animal.Controller.MarketController;

import java.util.HashMap;
import java.util.List;

import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.Market;
import com.happypet.animal.Entity.MarketEntity.MarketFileVo;
import com.happypet.animal.Entity.MarketEntity.MarketVo;
import com.happypet.animal.Service.MarketService.MarketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MarketController {

    @Autowired
    MarketService marketService;

    @RequestMapping("/market")
    public String marketHomeHandle(Model model)
    {
        List<ConbineMarket> vo = marketService.marketHomeList();
        
        model.addAttribute("vo", vo);

    	return "market/market";
    }

    @RequestMapping("/market/product")
    public String productDetailHandle(@RequestParam int no, Model model)
    {
        model.addAttribute("vo", marketService.marketDetail(no));
        return "market/product";
    }

}

