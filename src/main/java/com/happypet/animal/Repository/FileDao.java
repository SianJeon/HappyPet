package com.happypet.animal.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.FileDataVo;

@Repository
public class FileDao {

	@Autowired
	SqlSession sqlSession;
	
	
	public int fileBoard(AnimalReviewVo vo){
		
		
		return sqlSession.insert("animal.insertBoard",vo);
		
	}
	
	public List<AnimalReviewVo> adoptreview(int offset) {
		
		
		return sqlSession.selectList("animalreview.selectAll",offset);
	}
	
	public List<FileDataVo> adoptphoto(String owner){
		
		
		return sqlSession.selectList("animalreview.selectByowner", owner);
	}
	
	public int photodelete(String no) {
		
		return sqlSession.delete("animalreview.photodelete", no);
		
	}
	
}
