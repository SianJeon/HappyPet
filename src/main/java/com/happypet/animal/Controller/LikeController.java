package com.happypet.animal.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happypet.animal.Entity.LikeVo;
import com.happypet.animal.Service.LikeService;

@Controller
public class LikeController {

	@Autowired
	LikeService likeService;
	
	
	@ResponseBody
	@RequestMapping("like")
	public int likeinsert(@RequestParam String boardno,@RequestParam String memberno) {
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("boardno", boardno);
		map.put("memberno", memberno);
		return	likeService.likeInsert(map);
				
	}
	
	@ResponseBody
	@RequestMapping("likeselect")
	public LikeVo likeselect(@RequestParam String boardno) {
		
		return likeService.likeSelect(boardno);
		
	}
	
	@ResponseBody
	@RequestMapping("likeupdate")
	public int likeupdate(@RequestParam String boardno) {
		
		
		return likeService.likeUpdate(boardno);
	}
}
