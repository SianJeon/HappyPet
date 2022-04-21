package com.happypet.animal.Service.Freeboard;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.FileVo;
import com.happypet.animal.Repository.Freeboard.FileDAO;

@Service
public class FreeboardFileService {

	@Autowired
	FileDAO fileDao;
	
	public boolean insertOneNew(FileVo vo) {
		int r = fileDao.insertFileUploadDB(vo);
		
		return r == 1;
	}
	
	public List<FileVo> selectFileList(int fNo){
		List<FileVo> f = fileDao.selectFileAll(fNo);
	
		return f;
	}
	
	public FileVo selectDownFile(int no){
		FileVo df = fileDao.selectDownOne(no);
		
		return df;
	}
	
}
