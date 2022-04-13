package com.happypet.animal.Service.Freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.CommentVo;
import com.happypet.animal.Repository.Freeboard.CommentDAO;

@Service
public class CommentService {

	@Autowired
	CommentDAO commentDao;
	
	public boolean addNewOne(CommentVo vo) {
		int r = commentDao.insertCmtOne(vo);
		
		return r ==1;
	}
	
	public List<CommentVo> listAll(int no) {
		 
		List<CommentVo> list = commentDao.cmtListAll(no);
		
		  return list;
	}
	
}
