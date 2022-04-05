package com.happypet.animal.Service.Freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Entity.Freeboard.PagingVo;
import com.happypet.animal.Repository.Freeboard.FreeboardDAO;

@Service
public class PagingService {

	@Autowired
	FreeboardDAO freeboardDao;
	
	public int countBoard() {
		return freeboardDao.countBoard();
	}
	
	public List<FreeboardVo> selectBoard(PagingVo vo){
		return freeboardDao.selectBoard(vo);
	}
}
