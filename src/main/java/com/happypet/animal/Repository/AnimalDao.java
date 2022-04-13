package com.happypet.animal.Repository;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AnimalCommentVo;
import com.happypet.animal.Entity.AnimalDetailVo;
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
	
	public AnimalDetailVo animalDetail(String no) {
		
		
		return sqlSession.selectOne("animalreview.detail",no);
		
	}
	
	public int animalComment(AnimalCommentVo vo) {
		
		
		
		return sqlSession.insert("animalreview.comment",vo);
		
	}
	
	public List<AnimalCommentVo> animalCommentAll(Map<String,Object> map) {
	
		
		return sqlSession.selectList("animalreview.commentAll", map);
	}
	
	public int animalCommentDel(String no) {
		
		
		return sqlSession.delete("animalreview.commentdele", no);
	}

	public int animalCommentupdate(AnimalCommentVo vo) {
		
		
		return sqlSession.update("animalreview.commentupdate", vo);
	}

	public AnimalCommentVo animalCommentselectbyupdate(String no) {
		
		return sqlSession.selectOne("animalreview.commentselet", no);
		
	}
	
	public int animalCommentdeleteByowner(String no ) {
		
		return sqlSession.delete("animalreview.decomendelete", no);
		
	}
	
	public int animaldetaildeleteByno(String no) {
		
		return sqlSession.delete("animalreview.detaildelete", no);
		
	}
	
	
	public int animaldetailupdate(AnimalDetailVo vo) {
		
		return sqlSession.update("animalreview.detailupdate",vo);
		
	}
	
}




