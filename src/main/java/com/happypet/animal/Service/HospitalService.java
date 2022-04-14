package com.happypet.animal.Service;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import com.happypet.animal.Entity.FileDataVo;
import com.happypet.animal.Entity.HospitalReviewCommentVo;
import com.happypet.animal.Entity.HospitalReviewVo;
import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Entity.PagingVo;
import com.happypet.animal.Repository.HospitalDao;

@Service
public class HospitalService {

	@Autowired
	HospitalDao dao;
	
	public Map hospitalList(int page) {
		
		Map d=new HashMap() ;
		RestTemplate rest = new RestTemplate();
		
		URI uri = UriComponentsBuilder
				.fromHttpUrl("http://apis.data.go.kr/3510500/veterinary_hospital/getList")
				.queryParam("serviceKey","ehRy5h1wKLTcUJJfXjxJPGCFeeDfp1LTLecUXYOoEsu1hJCmjz0hoGsQ69VP3sGTPP9T%2BOPfqBkG7adchz0Z%2BA%3D%3D")
				.queryParam("pageNo", page)
				.queryParam("numOfRows",10)
				.queryParam("type", "json").build(true).toUri();
		
		
		Map rst = rest.getForObject(uri, Map.class);
		rst = (Map)rst.get("response");
		d.put("total", rst.get("totalCount"));
		rst = (Map)rst.get("body");
		rst = (Map)rst.get("items");
		List<Map> req = (List<Map>)rst.get("item");
		d.put("item", req);
//		for(Map m : req) {
//			HospitalVo vo = new HospitalVo();
//			
//			vo.setNo( ((Double)m.get("no")).intValue());
//			vo.setBsn_nm(String.valueOf(m.get("bsn_nm")));
//			vo.setRoad_nm_addr(String.valueOf(m.get("road_nm_addr")));
//			vo.setTel_no(String.valueOf( m.get("tel_no")));
//			vo.setRep_person(String.valueOf(m.get("rep_person")));
//			vo.setLat(String.valueOf(m.get("lat")));
//			vo.setLot(String.valueOf( m.get("lot")));
//			
//			dao.insertData(vo);
//		}
		
		return d;
		
	}
	
	public HospitalVo findDataByNo(int no) {
		return dao.findDataByNo(no);
	}
	
	public boolean insertReview(HospitalReviewVo vo) {
		
		int r = dao.insertReview(vo);
		
		return r==1 ? true : false;
	}
	
	public Map<String, Object> findReviewByOwner(int owner, PagingVo vo){
		
		vo.setTotalCount(dao.getReviewCountByOwner(owner));
		vo.update();
		
		Map<String, Object> parameters = new HashMap();
		
		parameters.put("owner", owner);
		parameters.put("offset", vo.getOffset());
		
		Map<String, Object> oo = new HashMap();
		
		oo.put("paging", vo);
		oo.put("list", dao.findReviewByOwner(parameters));
		
		return oo;
	}
	
	public int getReviewCountByOwner(int owner) {
		return dao.getReviewCountByOwner(owner);
	}
	
	public HospitalReviewVo findReviewByNo(int no) {
		return dao.findReviewByNo(no);
	}
	
	public void deleteReview(int no) {
		dao.deleteReview(no);
	}
	
	public boolean updateReviewByNo(HospitalReviewVo vo) {
		
		int r = dao.updateReviewByNo(vo);
		
		return r==1 ? true: false;
	}
	
	public boolean insertReviewComment(HospitalReviewCommentVo vo) {
		
		int r = dao.insertReviewComment(vo);
		
		if(r == 1) {
			
			return true;
		}else return false;
		
	}
	
	public List<HospitalReviewCommentVo> findCommentByOwner(int owner){
		return dao.findCommentByOwner(owner);
	}
	
	public void deleteCommentByNo(int no) {
		dao.deleteCommentByNo(no);
	}
	
	public HospitalReviewCommentVo findCommentByNo(int no) {
		return dao.findCommentByNo(no);
	}
	
	public boolean modifyCommentByNo(HospitalReviewCommentVo vo) {
		
		int r = dao.modifyCommentByNo(vo);
		
		if (r == 1){
			return true;			
		}else return false;
	}
}
