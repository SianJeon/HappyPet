package com.happypet.animal.Repository.Freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.Freeboard.CommentVo;
import com.happypet.animal.Entity.Freeboard.Criteria;
import com.happypet.animal.Entity.Freeboard.FreeboardVo;

@Repository
public class CommentDAO {

	@Autowired
	SqlSession sqlSession;

	public int insertCmtOne(CommentVo vo) {
		return sqlSession.insert("comment.insertCmt", vo);
	}

	public List<CommentVo> cmtListAll(int no) {
		return sqlSession.selectList("comment.selectCmt", no);
	}

	public int deleteCmtOne(CommentVo vo) {
		return sqlSession.insert("comment.deleteCmt", vo);
	}

	/* 댓글 목록(페이징 적용) */
	public List<CommentVo> getListPaging(Criteria cri) {
		return sqlSession.selectList("comment.getListPaging", cri);
	}

	/* 댓글 총 갯수 */
	public int countBoard(int no) {
		return sqlSession.selectOne("comment.countCmt",no);
	}
}
