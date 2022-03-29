package com.happypet.animal.Service;

import java.net.URI;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class CommonService {
	public List findZipcode(String word) {
		RestTemplate rest = new RestTemplate();
		/*
		 * Map<String, String> params = new HashMap<String, String>();
		 * params.put("confmKey", "devU01TX0FVVEgyMDIyMDMxNTEzMzExODExMjM0ODE=");
		 * params.put("currentPage", "1"); params.put("countPerPage", "100");
		 * params.put("keyword", word); params.put("resultType", "json");
		 */
		
		URI uri = UriComponentsBuilder
				.fromHttpUrl("https://www.juso.go.kr/addrlink/addrLinkApi.do")
				.queryParam("confmKey",	"devU01TX0FVVEgyMDIyMDMxNjAxMzAyNTExMjM1MTY=")
				.queryParam("currentPage", "1")
				.queryParam("countPerPage","100")
				.queryParam("keyword", word)
				.queryParam("resultType", "json").build().toUri();
		
		System.out.println(uri);

		// String rst = rest.getForObject(uri, String.class);
		
		Map rst = rest.getForObject(uri, Map.class);
		rst = (Map)rst.get("results");
		List<Map>  juso = (List<Map>)rst.get("juso");
		
		System.out.println(juso);
		return juso;
	}
}
