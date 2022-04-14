package com.happypet.animal.Repository.Freeboard;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.Freeboard.FileVo;

@Repository
public class FileDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertFile(FileVo vo) {
		return sqlSession.insert("file.insertFile", vo);
	}
}
