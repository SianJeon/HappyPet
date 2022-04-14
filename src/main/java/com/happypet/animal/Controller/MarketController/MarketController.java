package com.happypet.animal.Controller.MarketController;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.MarketCart;
import com.happypet.animal.Entity.MarketEntity.MarketCartOrderVo;
import com.happypet.animal.Entity.MarketEntity.MarketCartView;
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
    public String productOrderHandle(@RequestParam int buyAmount, @RequestParam int no, Model model)
    {
        model.addAttribute("order", marketService.orderList(no));
        model.addAttribute("buyAmount", buyAmount);
        return "market/order";
    }

    @RequestMapping("/market/cartorder")
    public String cartOrderHandle(Model model, HttpSession session)
    {
        AccountVo acVo = (AccountVo)session.getAttribute("loginUser");
        // model.addAttribute("vo", marketService.cartListOrder(acVo.getUserId()));
        model.addAttribute("vo", marketService.cartListOrder("qwer"));
        return "market/order";
    }
    
    @ResponseBody
    @RequestMapping("/market/addCart")
    public boolean addCartHandle(@ModelAttribute MarketCart cart)
    {
        System.out.println(cart);
    	return marketService.insertMarketCart(cart);
    }

    @RequestMapping("/market/cart")
    public String cartHandle(Model model, HttpSession session)
    {
        // AccountVo accountVo = (AccountVo)session.getAttribute("loginUser");
        String accountVo = "qwer";
        List<MarketCartView> cartVo = marketService.selectAllCart(accountVo);

        model.addAttribute("vo", cartVo);
        return "market/marketCart";
    }

    @ResponseBody
    @RequestMapping("/market/cartplus")
    public String plusCartHandle(@ModelAttribute MarketCart vo)
    {
        marketService.plusMarketCart(vo);
        return "plus";
    }

    @ResponseBody
    @RequestMapping("/market/cartminus")
    public String minusCartHandle(@ModelAttribute MarketCart vo)
    {
        marketService.minusMarketCart(vo);
        return "minus";
    }

    @ResponseBody
    @RequestMapping("/market/cartDelete")
    public String deleteCartHandle(@ModelAttribute MarketCart vo)
    {
        marketService.deleteMarketCart(vo);

        return "/market/cart";
    }

}

