package com.happypet.animal.Repository.MarketRepository;

import java.util.List;

import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
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

    public void updateMarketList()
    {
        
    }

}
