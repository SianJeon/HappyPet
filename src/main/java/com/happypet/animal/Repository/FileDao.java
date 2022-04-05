package com.happypet.animal.Repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.FileBoardVo;

@Repository
public class FileDao {

	@Autowired
	SqlSession sqlSession;
	
	
	public int fileBoard(FileBoardVo vo){
		
		
		return sqlSession.insert("animal.insertBoard",vo);
		
		
		
	}
	
	
	
}
