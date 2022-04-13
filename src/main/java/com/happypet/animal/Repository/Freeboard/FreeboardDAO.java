package com.happypet.animal.Repository.Freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Entity.Freeboard.PagingVo;


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
	
	public int updateHit(int no) {
		return sqlSession.update("freeboard.boardHit", no);
	}
	
	//페이징 처리 게시글 조회
	public List<FreeboardVo> selectBoard(PagingVo vo){
		return sqlSession.selectList("freeboard.selectBoard", vo);
	}
	
	//게시물 총 갯수
	public int countBoard() {
		return sqlSession.selectOne("freeboard.countBoard");
	}
	
	//게시글 삭제
	public int deleteBoard(FreeboardVo vo) {
		return sqlSession.insert("freeboard.deleteBoard", vo);
	}
//	
//	//게시글 불러오기
//	public FreeboardVo modifyBoard(FreeboardVo vo) {
//		return sqlSession.selectOne("freeboard.modifyTb", vo);
//	}
//	
	
	public FreeboardVo selectAll(FreeboardVo vo) {
		return sqlSession.selectOne("freeboard.selectOne",vo);
	}
	
	//게시글 업데이트
	public int updateBoard(FreeboardVo vo) {
		return sqlSession.update("freeboard.modifyBoard",vo);
	}
}
