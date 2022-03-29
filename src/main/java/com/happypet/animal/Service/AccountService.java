package com.happypet.animal.Service;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.happypet.animal.Entity.AccountVo;
import com.happypet.animal.Repository.AccountDao;

@Service
public class AccountService {
	
	@Autowired
	AccountDao dao;
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
public boolean insertAccount(AccountVo vo) {
		
		String pass = vo.getUserPass();
		String encodedPass = passwordEncoder.encode(pass);
		vo.setUserPass(encodedPass);
		
		int r = dao.insertAccount(vo);
		
		return r == 1 ? true : false; 
	}
	
	public boolean isValidAccount(String id, String pass) {
		String dbPass = dao.selectPassById(id);
		if(dbPass == null)
			return false;
		
		return passwordEncoder.matches(pass, dbPass);
	}
	
	public AccountVo selectOneById(String id) {
		return dao.selectOneById(id);
	}
	
	public boolean addProfile(AccountVo vo) {
		if(vo.getAttach() == null || vo.getAttach().isEmpty())
			return false;
		if(! vo.getAttach().getContentType().startsWith("image"))
			return false;
		
		String path = ctx.getRealPath("/resources/profiles");
		File fPath = new File(path);
		
		if(!fPath.exists())
			fPath.mkdirs();
		String fileName = UUID.randomUUID().toString();
		File dest = new File(path, fileName);
		try {
			vo.getAttach().transferTo(dest);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		vo.setProfile(fileName);
		
		
		int r = dao.updateOne(vo);
		
		return r == 1 ? true:false;
	}
	
public boolean updateData(AccountVo vo) {
		
		int r = dao.updateOne(vo);
		
		return r==1 ? true: false;
	}
}
