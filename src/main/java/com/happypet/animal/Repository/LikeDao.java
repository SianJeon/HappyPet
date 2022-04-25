package com.happypet.animal.Repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.LikeVo;

@Repository
public class LikeDao {

	
	@Autowired
	SqlSession sqlSession;
	
	
	public int like_insert(Map<String,Object> map) {
		
		return sqlSession.insert("like.like_insert",map);
		
	}
	public LikeVo like_select(String boardno) {
		return sqlSession.selectOne("like.like_select", boardno);
	}
	
	public int like_updata(String boardno) {
		
		return sqlSession.update("like.like_update",boardno);
		
		
	}
	
	public int like_delete(String boardno) {
		
		return sqlSession.update("like.like_delete",boardno);
		
	}
}
