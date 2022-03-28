package com.happypet.animal.Service;


import com.happypet.animal.Entity.TemplateVo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TemplateService {

    @Autowired
    SqlSession sqlSession;

    public TemplateVo testSQL()
    {
       // TestInsert();
        return sqlSession.selectOne("test.TestSQL");
    }
    public int TestInsert()
    {
    	return sqlSession.insert("test.TestInsert");
    }
    
}
