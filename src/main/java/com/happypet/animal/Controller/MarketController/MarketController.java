package com.happypet.animal.Controller.MarketController;

import java.util.ArrayList;
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
    public String marketHomeHandle(@RequestParam int page, Model model)
    {
        int nextPage = page;
        List<ConbineMarket> vo = marketService.marketHomeList(nextPage);
      
        model.addAttribute("vo", vo);
        
        model.addAttribute("pageCount", marketService.countProduct() / 8);

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
    public String cartOrderHandle(@ModelAttribute MarketCartOrderVo vo, 
                                @RequestParam(value = "buyAmount", required = false) int buyAmount,
                                Model model, HttpSession session)
    {
        AccountVo acVo = (AccountVo)session.getAttribute("loginUser");
        // model.addAttribute("vo", marketService.cartListOrder(acVo.getUserId()));
        List<MarketCartOrderVo> orderList = new ArrayList<MarketCartOrderVo>();
        
        if(vo.getProductNo() == 0)
            orderList = marketService.cartListOrder("qwer");
        else 
            orderList.add(marketService.waitingOrderList(vo.getProductNo(), buyAmount));

        for (MarketCartOrderVo marketCartOrderVo : orderList) {
            System.out.println("discount : " + marketCartOrderVo.getDiscountPrice());
            System.out.println("price : " + marketCartOrderVo.getProductPrice());
        }
        model.addAttribute("vo", orderList);
        return "market/order";
    }
    
    @ResponseBody
    @RequestMapping("/market/addCart")
    public boolean addCartHandle(@ModelAttribute MarketCart cart)
    {
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

    @RequestMapping("/market/orderList")
    public String orderList(Model model, HttpSession session)
    {
        AccountVo vo = (AccountVo)session.getAttribute("loginUser");

        model.addAttribute("vo", marketService.orderList("qwer"));
        // model.addAttribute("vo", marketService.orderList(vo.getUserId()));
        return "market/orderList";
    }
}

