package com.happypet.animal.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.LikeVo;
import com.happypet.animal.Repository.LikeDao;

@Service
public class LikeService {

	@Autowired
	LikeDao likeDao;
	
	
	public int likeInsert(Map<String,Object> map) {
		
		return likeDao.like_insert(map);
		
	}
	
	public LikeVo likeSelect(String boardno) {
		
		
		return likeDao.like_select(boardno);
		
	}
	
	public int likeUpdate(String boardno) {
		
		
			likeDao.like_updata(boardno);
			likeDao.like_delete(boardno);
			
		return 1; 
	}
	
	
}
