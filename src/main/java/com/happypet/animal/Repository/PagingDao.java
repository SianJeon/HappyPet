package com.happypet.animal.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Entity.PagingVo;

@Repository
public class PagingDao {

	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<AnimalVo> page(PagingVo vo) {
		
		
		return sqlSession.selectList("paging.page", vo);
		
	}
	
	public int pageAll() {
		
		return sqlSession.selectOne("paging.selectAll");
		
	}
}
