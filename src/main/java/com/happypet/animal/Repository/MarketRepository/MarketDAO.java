package com.happypet.animal.Repository.MarketRepository;

import java.util.List;

import com.happypet.animal.Entity.MarketEntity.CompanyCount;
import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.Market;
import com.happypet.animal.Entity.MarketEntity.MarketCart;
import com.happypet.animal.Entity.MarketEntity.MarketCartOrderVo;
import com.happypet.animal.Entity.MarketEntity.MarketCartView;
import com.happypet.animal.Entity.MarketEntity.MarketCompanyView;
import com.happypet.animal.Entity.MarketEntity.MarketFileVo;
import com.happypet.animal.Entity.MarketEntity.MarketPageVo;
import com.happypet.animal.Entity.MarketEntity.MarketVo;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;
import com.siot.IamportRestClient.response.Payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDAO {
 
    @Autowired
    SqlSession sqlSession;

    public int insertFile(MarketFileVo vo)
    {
        return sqlSession.insert("market.insert-MarketFile", vo);
    }

    public int insertMarket(MarketVo vo)
    {
        return sqlSession.insert("market.insert-Market", vo);
    }

    public List<ConbineMarket> selectMarketList()
    {
        return sqlSession.selectList("market.select-MarketHomeList");
    }

    public List<MarketFileVo> selectMarketFileList()
    {
        return sqlSession.selectList("market.select-MarketHomeList");
    }

    public ConbineMarket selectMarketDetail(int no)
    {
        return sqlSession.selectOne("market.select-marketDetail", no);
    }

    public List<String> selectMarketFileDetail(int no)
    {
        return sqlSession.selectList("market.select-marketFileDetailList", no);
    }

    public List<MarketVo> selectModifyList()
    {
        return sqlSession.selectList("market.select-marketModifyList");
    }

    public int updateMarketProduct(MarketVo vo)
    {
        return sqlSession.update("market.update-marketProduct", vo);
    }

    public int deleteMarketProduct(MarketVo vo)
    {
        return sqlSession.delete("market.delete-marketProduct", vo);
    }

    public int insertMarketCart(MarketCart cart)
    {
        return sqlSession.insert("market.insert-marketCart", cart);
    }

    public boolean selectAddMarketCart(MarketCart cart)
    {

        boolean result = sqlSession.selectOne("market.select-marketCart", cart) == null ? true : false;
        
        return result;
    }

    public int updateMartketCartAmount(MarketCart cart)
    {
        return sqlSession.update("market.update-marketCartAmountAdd", cart);
    }
    
    public int updateMarketCartMinus(MarketCart cart)
    {
        return sqlSession.update("market.update-marketCartAmountMinus", cart);
    }

    public MarketCartOrderVo selectWaitingOrderlist(int no)
    {
        return sqlSession.selectOne("market.select-productOrder", no);
    }
    
    public List<MarketCart> selectOrderAmount(MarketCart cart)
    {
        return sqlSession.selectList("market.select-cartOrder", cart);
    }

    // 구매버튼시 카트 담은거 가져오기
    public MarketCart selectBuyBtn(int no)
    {
        return sqlSession.selectOne("market.buyBtn", no);
    }

    // 장바구니 전부 보여주기
    public List<MarketCartView> selectAllCart(String account_id)
    {
        return sqlSession.selectList("market.select-allMarketCart", account_id);
    }
    
    // 장바구니 제거
    public int deleteMarketCart(MarketCart cart)
    {
        return sqlSession.delete("market.delete-marketCart", cart);
    }

    // 장바구니 상품 주문리스트 가져오기
    public List<MarketCartOrderVo> selectOrderCartList(String accountId)
    {
        return sqlSession.selectList("market.select-cartListOrder", accountId);
    }

    // 구매 완료시 장바구니 물건 삭제
    public int deleteBuyItem(String accountId)
    {
        return sqlSession.delete("market.delete-buyItemClear", accountId);
    }
    
    // 가격 검증을 위한 db저장 상품 가격 가져오기
    public Object selectCheckedPrice()
    {
        return sqlSession.selectOne("market.paymentVaildChecked");
    }

    // 구매 목록 확인
    public PaymentVo selectOrderList(String accountId)
    {
        return sqlSession.selectOne("market.select-orderList", accountId);
    }

    // 구매 목록 이름, 사진
    public ConbineMarket selectOrderNameList(int productNo)
    {
        return sqlSession.selectOne("market.select-orderListNameImage", productNo);
    }

    // 페이징
    public List<ConbineMarket> selectPaging(MarketCompanyView vo)
    {
        return sqlSession.selectList("market.select-paging", vo);
    }

    // 총 상품 수
    public int selectProductCount()
    {
        return sqlSession.selectOne("market.select-totalProduct");
    }

    public List<CompanyCount> selectCompany()
    {
        return sqlSession.selectList("market.select-company");
    }
}
