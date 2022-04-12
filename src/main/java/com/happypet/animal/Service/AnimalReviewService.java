package com.happypet.animal.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.AnimalCommentVo;
import com.happypet.animal.Entity.AnimalDetailVo;
import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.FileDataVo;
import com.happypet.animal.Entity.PagingVo;
import com.happypet.animal.Repository.AnimalDao;
import com.happypet.animal.Repository.FileDao;
import com.happypet.animal.Repository.PagingDao;

@Service
public class AnimalReviewService {

	@Autowired
	FileDao fileDao;

	@Autowired
	AnimalDao animalDao;

	@Autowired
	PagingDao pagingDao;

	public Map<String, Object> animalreview(PagingVo vo) {

		
		vo.setTotalCount(pagingDao.pageAll());
		vo.update();

		Map<String, Object> map = new HashMap<>();

		map.put("paging", vo);
		map.put("datas", fileDao.adoptreview(vo.getOffset()));
		return map;

	}

	public List<FileDataVo> animalphoto(String owner) {

		return fileDao.adoptphoto(owner);
	}

	public AnimalDetailVo animalDetail(String no) {

		AnimalDetailVo vo = animalDao.animalDetail(no);

		return vo;

	}

	public int animalComment(AnimalCommentVo vo) {

		
		
		return animalDao.animalComment(vo);
	}

	public Map<String,Object> animalCommentAll(Map<String,Object> map) {
		
		PagingVo vo = new PagingVo();
		vo.setTotalCount(pagingDao.pageAll());
		vo.setPage((int)map.get("page"));
		vo.update();
		
		map.put("offset",vo.getOffset());
		map.put("paging", vo);
		map.put("datas",animalDao.animalCommentAll(map));
		
		
		return map;

	}

	public int animalCommentdele(String no) {

		return animalDao.animalCommentDel(no);

	}

	public int animalCommentupdate(AnimalCommentVo vo) {

		return animalDao.animalCommentupdate(vo);
	}

	public AnimalCommentVo animalCommentselectbyupdate(String no) {

		return animalDao.animalCommentselectbyupdate(no);

	}
}
