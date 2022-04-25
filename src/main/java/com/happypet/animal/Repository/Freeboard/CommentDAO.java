package com.happypet.animal.Repository.Freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.Freeboard.CommentVo;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertCmtOne(CommentVo vo) {
		return sqlSession.insert("comment.insertCmt", vo);
	}
	
	public List<CommentVo> cmtListAll(int no) {
		return sqlSession.selectList("comment.selectCmt",no);
	}
}
