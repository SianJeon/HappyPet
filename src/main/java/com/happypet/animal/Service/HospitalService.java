package com.happypet.animal.Service;

import java.net.URI;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.happypet.animal.Entity.HospitalVo;
import com.happypet.animal.Repository.HospitalDao;

@Service
public class HospitalService {

	@Autowired
	HospitalDao dao;
	
	public List hospitalList(int page, int rows) {
		RestTemplate rest = new RestTemplate();
		
		URI uri = UriComponentsBuilder
				.fromHttpUrl("http://apis.data.go.kr/3510500/veterinary_hospital/getList")
				.queryParam("serviceKey","ehRy5h1wKLTcUJJfXjxJPGCFeeDfp1LTLecUXYOoEsu1hJCmjz0hoGsQ69VP3sGTPP9T%2BOPfqBkG7adchz0Z%2BA%3D%3D")
				.queryParam("pageNo", page)
				.queryParam("numOfRows",rows)
				.queryParam("type", "json").build(true).toUri();
		
		
		Map rst = rest.getForObject(uri, Map.class);
		rst = (Map)rst.get("response");
		rst = (Map)rst.get("body");
		rst = (Map)rst.get("items");
		List<Map> req = (List<Map>)rst.get("item");
		
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
//		
		return req;
		
	}
	
	public HospitalVo findDataByNo(int no) {
		return dao.findDataByNo(no);
	}
}
