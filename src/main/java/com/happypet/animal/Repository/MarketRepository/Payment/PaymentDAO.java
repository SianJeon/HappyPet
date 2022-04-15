package com.happypet.animal.Repository.MarketRepository.Payment;


import java.util.List;

import com.happypet.animal.Entity.MarketEntity.MarketCartOrderVo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentAccountInfo;
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

    public int insertPaymentAccountInfo(PaymentAccountInfo vo)
    {
        return sqlSession.insert("payment.insert-patmentAccountInfo", vo);
    }

    public List<MarketCartOrderVo> selectPaymentVaildCheck(String accountNo)
    {
        return sqlSession.selectList("payment.select-paymentVaildChekc", accountNo);
    }
    
    public PaymentVo selectBuyList()
    {
        return sqlSession.selectOne("payment.select-pamentBuyList");
    }
}
