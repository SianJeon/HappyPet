package com.happypet.animal.Repository.Freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.Freeboard.FileVo;

@Repository
public class FileDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertFileUploadDB(FileVo vo) {
		return sqlSession.insert("file.insertFileUploadDB", vo);
	}
	
	public List<FileVo> selectFileAll(int fNo){
		return sqlSession.selectList("file.selectFile", fNo);
	}
	
	public FileVo selectDownOne(int no){
		return sqlSession.selectOne("file.selectDownFile", no);
	}
}
