package com.happypet.animal.Controller.MarketController.Payment;

import javax.servlet.http.HttpSession;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentInsertVo;
import com.happypet.animal.Service.MarketService.Payment.PaymentService;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Paymentcontroller {
    
    @Autowired
    PaymentService paymentService;
    
    @RequestMapping("/market/Checkedvaild/{imp_uid}")
    @ResponseBody
    public IamportResponse<Payment> vaildCheckHandle(@PathVariable(value = "imp_uid") String imp_uid, HttpSession session)
    {
        // System.out.println(imp_uid);
        // 세션 로그인 아이디 필요
        AccountVo acVo = (AccountVo)session.getAttribute("loginUser");
        return paymentService.vaildCheck(imp_uid, acVo.getUserId());
    }
    
    // @ResponseBody
    @RequestMapping(value = "/market/orderSuccess", method = {RequestMethod.POST})
    public String paymentHandle(@RequestBody PaymentInsertVo vo, HttpSession session)
    {	
        AccountVo acVo = (AccountVo)session.getAttribute("loginUser");
        // boolean success =  paymentService.insertPaymentInfo(vo, acVo.getUserId());
        boolean success =  paymentService.insertPaymentInfo(vo,acVo.getUserId());
    	if(success)
        {
            System.out.println("저장 성공");
            return "저장 성공";
        }
        else
        {
            System.out.println("저장 실패");
            return "저장 실패";
        }
        
    }

    @RequestMapping("/market/buyList")
    public String listHandle(){
        System.out.println(paymentService.selectList());
        return "";
    }
}
