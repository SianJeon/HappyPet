package com.happypet.animal.Repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.FileDataVo;

@Repository
public class FileDataDao {

	
	@Autowired
	SqlSession sqlSession;
	
	public int fileData(FileDataVo vo) {
		
		
		return sqlSession.insert("animal.insertData",vo);
		
		
	}
}
