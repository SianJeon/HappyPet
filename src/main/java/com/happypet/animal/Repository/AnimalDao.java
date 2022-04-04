package com.happypet.animal.Repository;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AnimalVo;


@Repository
public class AnimalDao {

	@Autowired
	SqlSession sqlSession;
	

	public int detailInsert(Map<String, Object> map) {
		
		
		return sqlSession.insert("animal.add",map);
		
	}
	
	public AnimalVo detailSelect(String vo) {
		
		
		return sqlSession.selectOne("animal.detail",vo);
		
	}
	
	
	
}
