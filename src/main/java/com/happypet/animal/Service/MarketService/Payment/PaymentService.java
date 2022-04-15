package com.happypet.animal.Service.MarketService.Payment;

import java.io.IOException;

import com.google.gson.Gson;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentAccountInfo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;
import com.happypet.animal.Repository.MarketRepository.Payment.PaymentDAO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    
    @Autowired
    PaymentDAO paymentDAO;

    IamportClient client;

    // 구매 내역 불러오기
    public String selectList()
    {
    	System.out.println("11111111111");
        PaymentVo vo = paymentDAO.selectBuyList();
        System.out.println("vo.getCustom_data = " + vo.getCustomData());
        Gson gson = new Gson();
        String custom_data = gson.toJson(vo.getCustomData());
        System.out.println("String customData = " + custom_data);
        return custom_data;
    }

    // 결제 정보 저장 및 계정에 결제 저장
    public boolean insertPaymentInfo(PaymentVo vo, String accountNo)
    {
        PaymentAccountInfo acInfo = new PaymentAccountInfo();
        if(accountNo == null || vo.getImpUid() == null) return false;

        acInfo.setAccountNo(accountNo);
        acInfo.setImpuid(vo.getImpUid());

        int result = paymentDAO.insertPaymentAccountInfo(acInfo);
        System.out.println("result : " + result);

        if(result == 1) 
            return 1 == paymentDAO.insertPaymentInfo(vo);
        else 
            return false;
    }

    // 결제 금액과 상품 구매 가격 검사
    public IamportResponse<Payment> vaildCheck(String imp_uid)
    {
        IamportResponse<Payment> payment_response = null;

        try
        {
            payment_response = client.paymentByImpUid(imp_uid);
            
            // payment_response.getResponse().getAmount();
        }
        catch(IamportResponseException e)
        {
            System.out.println(e.getMessage());

            switch(e.getHttpStatusCode())
            {
                case 401 : System.out.println("401");  break;
                case 500 : System.out.println("500");  break;
            }
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        return payment_response;
    }

    public PaymentService ()
    {
        String api_key = "6281239092289273";
        String api_secret = "d6638fd458050bf0a0fab3e144012c2e278d7a3903345d781c342115114a1f29914158ce5c5d30e2";
        client = new IamportClient(api_key, api_secret);
    }
}
