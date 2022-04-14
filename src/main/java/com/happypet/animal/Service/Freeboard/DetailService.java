package com.happypet.animal.Service.Freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Repository.Freeboard.FreeboardDAO;

@Service
public class DetailService {

	@Autowired
	FreeboardDAO freeboardDao;
	
	
	public boolean deleteOne(FreeboardVo vo) {
		
		int r = freeboardDao.deleteBoard(vo);
		if(r==1)
			return true;
		else
			return false;
	}
	
}
