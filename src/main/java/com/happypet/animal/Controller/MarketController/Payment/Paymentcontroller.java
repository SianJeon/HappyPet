package com.happypet.animal.Controller.MarketController.Payment;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;
import com.happypet.animal.Service.MarketService.Payment.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.PaymentBalance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Paymentcontroller {
    
    @Autowired
    PaymentService paymentService;

    IamportClient iampoart;

    @RequestMapping("/market/Checkedvaild/{imp_uid}")
    public IamportResponse<PaymentBalance> vaildCheckHandle(@PathVariable(value = "imp_uid") String imp_uid)
    {
        iampoart = new IamportClient("6281239092289273",
                             "d6638fd458050bf0a0fab3e144012c2e278d7a3903345d781c342115114a1f29914158ce5c5d30e2");
        try
        {
            return iampoart.paymentBalanceByImpUid(imp_uid);
        } 
        catch (IamportResponseException | IOException e) 
        {
            e.printStackTrace();
        }
        return null;
    }
    
    @ResponseBody
    @RequestMapping("/market/orderSuccess")
    public String paymentHandle(@ModelAttribute PaymentVo vo)
    {
        boolean success =  paymentService.insertPaymentInfo(vo);
        if(success)
        {
            System.out.println("dd?");
            return "저장 성공";
        }
        else
        {
            System.out.println("faild");
            return "저장 실패";
        }
        
    }
}
