package com.happypet.animal.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.AnimalDetailVo;
import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.FileDataVo;

@Repository
public class FileDataDao {

	
	@Autowired
	SqlSession sqlSession;
	
	public int fileData(FileDataVo vo) {
		
		
		return sqlSession.insert("animal.insertData",vo);
		
		
	}
	
	public FileDataVo fileDownload(int no) {
		
		
		return sqlSession.selectOne("animalreview.selectByno", no);
	}
	
	public int fileupdate(FileDataVo vo) {
		
		
		return sqlSession.update("animalreview.fileupdate",vo);
	}
}
