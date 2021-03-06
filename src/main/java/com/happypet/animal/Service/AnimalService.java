package com.happypet.animal.Service;

import java.net.URI;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Entity.PagingVo;
import com.happypet.animal.Repository.AnimalDao;


@Service
public class AnimalService {
	
	@Autowired
	AnimalDao animalDao;
	
	public Map<String,Object> animalListcho(String upkind, int pageNo) {
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		
		
		System.out.println("bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D");
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		UriComponentsBuilder urlBuilder =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				.queryParam("serviceKey", key)
				.queryParam("pageNo", pageNo)
				.queryParam("numOfRows", 20)
				.queryParam("_type", "json");
		
		if(!upkind.equals("-")) {
			urlBuilder.queryParam("upkind", upkind);
		}
		
		System.out.println(urlBuilder.build(true).toUri());
		
		
		
		Map rest = restTemplate.getForObject(urlBuilder.build(true).toUri(), Map.class);			
		
		Map res =(Map)rest.get("response");
			res = (Map)res.get("body");
			
		int cnt = ((Double)res.get("totalCount")).intValue();
		

		PagingVo vo = new PagingVo();
		
		vo.setTotalCount(cnt);
		vo.setPage(pageNo);
		vo.update();
		
		rest = (Map)rest.get("response");
		rest = (Map)rest.get("body");
		rest = (Map)rest.get("items");
		List<Map> rests = (List<Map>)rest.get("item");
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("paging", vo);
		map.put("rests", rests);
			
		System.out.println("rest.get = "+rest.get("item"));
		
		
		
		
		System.out.println(rests);
		
		
		
		return map;
	}
	

	public int animaltotal() {
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		
		
		System.out.println("bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D");
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		URI url =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				.queryParam("serviceKey", key)
				.queryParam("numOfRows", 20)
				.queryParam("_type", "json").build(true).toUri();
		
		
		System.out.println(url);
		
		
		
		Map rest = restTemplate.getForObject(url, Map.class);			
		
		Map res =(Map)rest.get("response");
		res = (Map)res.get("body");
		
		int cnt = ((Double)res.get("totalCount")).intValue();
		
		
		System.out.println(cnt);
		
		return cnt;
	}

	
	
	public List animalinsert() throws ParseException {
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		URI url =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				.queryParam("serviceKey", key)
				.queryParam("numOfRows", 20)
				.queryParam("_type", "json").build(true).toUri();
		
		
		System.out.println(url);
		
		
		
		Map rest = restTemplate.getForObject(url, Map.class);			
		
		rest = (Map)rest.get("response");
		rest = (Map)rest.get("body");
		rest = (Map)rest.get("items");
		List<Map> rests = (List<Map>)rest.get("item");
				
		
		
		for (Map<String, Object> map : rests) {
			
			animalDao.detailInsert(map);
			
			
		}
		
		
		
		return rests;
	}
	
	public List animalinsertDay() throws ParseException {
		
		LocalDate now = LocalDate.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYYMMdd");

		String nowtime = formatter.format(now);
		
		System.out.println(nowtime);
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		
		
		System.out.println("bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D");
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		URI url =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				.queryParam("serviceKey", key)
				.queryParam("bgnde", nowtime )
				.queryParam("endde", nowtime )
				.queryParam("numOfRows", 50)
				.queryParam("_type", "json").build(true).toUri();
		
		
		System.out.println(url);
		
		
		
		Map rest = restTemplate.getForObject(url, Map.class);			
		
		rest = (Map)rest.get("response");
		rest = (Map)rest.get("body");
		rest = (Map)rest.get("items");
		List<Map> rests = (List<Map>)rest.get("item");
		
		
		
		for (Map<String, Object> map : rests) {
			
			animalDao.detailInsert(map);
			
			
		}
		
		return rests;
	}
	
	

	public AnimalVo animalDetail(String vo) {
		
		
		
		return animalDao.detailSelect(vo);
		
	}
	
	
	
	
}
