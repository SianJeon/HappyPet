package com.happypet.animal.Service;

import java.net.URI;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.happypet.animal.Entity.AnimalVo;
import com.happypet.animal.Repository.AnimalDao;


@Service
public class AnimalService {
	
	@Autowired
	AnimalDao animalDao;
	
	public List animalList(String pageNo) {
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		
		
		System.out.println("bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D");
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		URI url =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				 .queryParam("serviceKey", key)
				 .queryParam("pageNo", pageNo)
				 .queryParam("numOfRows", 20)
				 .queryParam("_type", "json").build(true).toUri();
	
		
		System.out.println(url);
			
		
		
			Map rest = restTemplate.getForObject(url, Map.class);			
				
			rest = (Map)rest.get("response");
			rest = (Map)rest.get("body");
			rest = (Map)rest.get("items");
			List<Map> rests = (List<Map>)rest.get("item");
			
			
		
			
			System.out.println("rest.get = "+rest.get("item"));
			
			
			
			
			System.out.println(rests);
			
			

		return rests;
	}
	
	public List animalcho(String upkind) {
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		
		
		
		System.out.println("bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D");
		String key = "bSD7tbU0huUXGhalXBOZRwGypzbQhTO8%2Bz0VC94EC%2BqkuDKKH9HShaJa4Ljf4B0K2uIas8S1HSvlAZmKTikvCw%3D%3D";
		URI url =  UriComponentsBuilder.fromHttpUrl("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic")
				.queryParam("serviceKey", key)
				.queryParam("upkind", upkind)
				.queryParam("numOfRows", 20)
				.queryParam("_type", "json").build(true).toUri();
		
		
		System.out.println(url);
		
		
		
		Map rest = restTemplate.getForObject(url, Map.class);			
		
		rest = (Map)rest.get("response");
		rest = (Map)rest.get("body");
		rest = (Map)rest.get("items");
		List<Map> rests = (List<Map>)rest.get("item");
		
		
		
		
		System.out.println("rest.get = "+rest.get("item"));
		
		
		
		
		System.out.println(rests);
		
		
		
		return rests;
	}
	
	
	public List animalinsert() throws ParseException {
		
		
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
