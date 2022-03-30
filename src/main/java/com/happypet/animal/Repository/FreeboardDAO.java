package com.happypet.animal.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.FreeboardVo;


@Repository
public class FreeboardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertOne(FreeboardVo vo) {
		return sqlSession.insert("freeboard.insertOne",vo);
	}
			
	public List<FreeboardVo> selectAll(){
		return sqlSession.selectList("freeboard.selectAll");
	}
	
	public FreeboardVo selectOne(int no) {
		return sqlSession.selectOne("freeboard.selectOne",no);
	}
	
	public List<FreeboardVo> selectListByNo(int no){
		return sqlSession.selectList("freeboard.selectOne",no);
	}
}
