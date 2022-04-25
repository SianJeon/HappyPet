package com.happypet.animal.Service.Freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.Freeboard.CommentVo;
import com.happypet.animal.Entity.Freeboard.Criteria;
import com.happypet.animal.Entity.Freeboard.FreeboardVo;
import com.happypet.animal.Repository.Freeboard.CommentDAO;

@Service
public class CommentService {

	@Autowired
	CommentDAO commentDao;

	public boolean addNewOne(CommentVo vo) {
		int r = commentDao.insertCmtOne(vo);

		return r == 1;
	}

	public List<CommentVo> listAll(int no) {

		List<CommentVo> list = commentDao.cmtListAll(no);

		return list;
	}

	public int deleteOne(CommentVo vo) {

		int r = commentDao.deleteCmtOne(vo);

		return r;
	}

	/* 댓글 목록(페이징 적용) */
	public List<CommentVo> getListPaging(Criteria cri) {
		List<CommentVo> listPaging = commentDao.getListPaging(cri);

		return listPaging;
	}

	/* 댓글 총 갯수 */
	public int getTotal(int no) {
		int total = commentDao.countBoard(no);
		return total;
	}
}
