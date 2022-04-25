package com.happypet.animal.Repository.MarketRepository.Comment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketCommentDAO {
    
    @Autowired
    SqlSession sqlSession;

    public int insertComment()
    {
        return sqlSession.insert("market.insert-comment");
    }
}
