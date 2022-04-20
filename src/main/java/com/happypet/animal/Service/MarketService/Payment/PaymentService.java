package com.happypet.animal.Service.MarketService.Payment;

import java.io.IOException;

import com.google.gson.Gson;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentAccountInfo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentInsertVo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;
import com.happypet.animal.Repository.MarketRepository.MarketDAO;
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

    @Autowired
    MarketDAO marketDAO;

    IamportClient client;

    // 구매 내역 불러오기
    public String selectList()
    {
        PaymentVo vo = paymentDAO.selectBuyList();
        Gson gson = new Gson();
        
        CustomData[] temp =  gson.fromJson(vo.getCustomData(), CustomData[].class);
        
        for (CustomData customData : temp) {
            System.out.println(customData.no);
            System.out.println(customData.name);
        }
        
        return" ";
    }
    private class CustomData { public String no; public String name; }

    // 결제 정보 저장 및 계정에 결제 저장
    public boolean insertPaymentInfo(PaymentInsertVo vo, String accountNo)
    {
        PaymentAccountInfo acInfo = new PaymentAccountInfo();
        System.out.println("acc = " + accountNo);
        System.out.println("impuid " +  vo.getImp_uid());
        // if(accountNo == null || vo.getImpUid() == null) return false;

        acInfo.setAccountNo(accountNo);
        acInfo.setImpUid(vo.getImp_uid());
        
        int result = paymentDAO.insertPaymentAccountInfo(acInfo);
        
        if(result == 1) 
            return 1 == paymentDAO.insertPaymentInfo(vo);
        else 
            return false;
    }

    // 결제 금액과 상품 구매 가격 검사
    public IamportResponse<Payment> vaildCheck(String imp_uid, String accountId)
    {
        IamportResponse<Payment> payment_response = null;

        try
        {
            payment_response = client.paymentByImpUid(imp_uid);
            
            payment_response.getResponse().getAmount();

            // 결제 금액 검증후 장바구니 삭제
            // marketDAO.deleteBuyItem(accountId);
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
