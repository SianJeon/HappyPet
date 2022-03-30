package com.happypet.animal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.FreeboardVo;
import com.happypet.animal.Repository.FreeboardDAO;

@Service
public class FreeboardService {
	
	@Autowired
	FreeboardDAO freeboardDao;
	
	public boolean addNewOne(FreeboardVo vo) {
		int r = freeboardDao.insertOne(vo);
		
		return r ==1;
	}
	
	public List<FreeboardVo> getAll() {
		List<FreeboardVo> list = freeboardDao.selectAll();
		
		
		
		return list;
	}

	public FreeboardVo getOneByNo(int no) {
		FreeboardVo vo = freeboardDao.selectOne(no);
		
		return vo;
	}
}
