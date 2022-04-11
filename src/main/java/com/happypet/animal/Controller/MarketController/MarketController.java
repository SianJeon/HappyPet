package com.happypet.animal.Controller.MarketController;

import java.util.List;

import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.MarketCart;
import com.happypet.animal.Service.MarketService.MarketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/market/review")
    public String productReviewHandle()
    {
        return "market/review";
    }

    @RequestMapping("/market/order")
    public String productOrderHandle(@RequestParam int buyAmount, @RequestParam int no,
                    @ModelAttribute MarketCart cart, Model model)
    {
        model.addAttribute("order", marketService.orderList(no));
        model.addAttribute("buyAmount", buyAmount);
        // model.addAttribute("amount", marketService.orderAmount(cart));
        return "market/order";
    }

    @ResponseBody
    @RequestMapping("/market/addCart")
    public boolean addCartHandle(@ModelAttribute MarketCart cart)
    {
    	return marketService.insertMarketCart(cart);
    }


    

}

