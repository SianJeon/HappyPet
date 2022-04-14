package com.happypet.animal.Repository.MarketRepository.Payment;


import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertPaymentInfo(PaymentVo vo)
    {
        return sqlSession.insert("payment.insert-paymentInfo", vo);
    }
    
}
