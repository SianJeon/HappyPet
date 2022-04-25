package com.happypet.animal.Service.Freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.Criteria;
import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Repository.Freeboard.FreeboardDAO;

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
	
	/* 게시판 목록(페이징 적용) */
	public List<FreeboardVo> getListPaging(Criteria cri){
		List<FreeboardVo> listPaging = freeboardDao.getListPaging(cri);
		
		return listPaging;
	}
	
	/* 게시물 총 갯수 */
	public int getTotal(Criteria cri) {
		int total = freeboardDao.countBoard(cri);
		return total;
	}

	public FreeboardVo getOneByNo(int no){
		
		FreeboardVo vo = freeboardDao.selectOne(no);
		
		freeboardDao.updateHit(no);
		return vo;
	}
	
	public boolean modifyOne(FreeboardVo vo) {
		int r = freeboardDao.updateBoard(vo);
		
		return r==1;
	}
	
	public FreeboardVo getOneAll(FreeboardVo vo){
		
		freeboardDao.selectAll(vo);
		
		return vo;
	}
}
