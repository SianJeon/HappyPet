package com.happypet.animal.Repository.MarketRepository;

import java.util.List;

import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.MarketCart;
import com.happypet.animal.Entity.MarketEntity.MarketFileVo;
import com.happypet.animal.Entity.MarketEntity.MarketVo;

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

    public ConbineMarket selectOrderlist(int no)
    {
        return sqlSession.selectOne("market.select-productOrder", no);
    }

    public List<MarketCart> selectOrderAmount(MarketCart cart)
    {
        return sqlSession.selectList("select-cartOrder", cart);
    }

    // 구매버튼시 카트 담은거 가져오기
    public MarketCart selectBuyBtn(int no)
    {
        return sqlSession.selectOne("marke.buyBtn", no);
    }

}
