package com.happypet.animal.Service.MarketService.Payment;

import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;
import com.happypet.animal.Repository.MarketRepository.Payment.PaymentDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    
    @Autowired
    PaymentDAO paymentDAO;

    public boolean insertPaymentInfo(PaymentVo vo)
    {
        return 1 == paymentDAO.insertPaymentInfo(vo);
    }

}
