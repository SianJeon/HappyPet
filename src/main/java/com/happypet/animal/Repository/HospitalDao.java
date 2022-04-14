package com.happypet.animal.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happypet.animal.Entity.HospitalReviewCommentVo;
import com.happypet.animal.Entity.HospitalReviewVo;
import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Entity.PagingVo;


@Repository
public class HospitalDao {
	@Autowired
	SqlSession ss;
	
	public int insertData(HospitalVo vo) {
		return ss.insert("hospital.insertOne", vo);
	}
	
	public HospitalVo findDataByNo(int no) {
		return ss.selectOne("hospital.findDataByNo", no);
	}
	
	public int insertReview(HospitalReviewVo vo) {
		return ss.insert("hospital.insertReview", vo);
	}
	
	public List<HospitalReviewVo> findReviewByOwner(Map<String, Object> parameters){
		List<HospitalReviewVo> rv = ss.selectList("hospital.findReviewByOwner", parameters);
		
		return rv;
	}
	public int getReviewCountByOwner(int owner) {
		return ss.selectOne("hospital.getReviewCountByOwner", owner);
	}
	
	public HospitalReviewVo findReviewByNo(int no) {
		return ss.selectOne("hospital.findReviewByNo", no);
	}
	
	public void deleteReview(int no) {
		ss.update("hospital.deleteReview", no);
	}
	
	public int updateReviewByNo(HospitalReviewVo vo) {
		
		return ss.update("hospital.updateReviewByNo", vo);
	}
	
	public int insertReviewComment(HospitalReviewCommentVo vo) {
		return ss.insert("hospital.insertReviewComment", vo);
	}
	
	public List<HospitalReviewCommentVo> findCommentByOwner(int owner){
		List<HospitalReviewCommentVo> co = ss.selectList("hospital.findCommentByOwner", owner);
		
		return co;
	}
	
	public void deleteCommentByNo(int no) {
		ss.update("hospital.deleteCommentByNo",no);
	}
	
	public HospitalReviewCommentVo findCommentByNo(int no) {
		return ss.selectOne("hospital.findCommentByNo", no);
	}
	
	public int modifyCommentByNo(HospitalReviewCommentVo vo) {
		return ss.update("hospital.modifyCommentByNo", vo);
	}
}
