package com.happypet.animal.Service;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class MailService {
	
	@Autowired
	JavaMailSender jms;
	
	private int size;
	
	public Map<String, Object> sendAuthMail(String email){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		String uuid = UUID.randomUUID().toString();
		String[] uuids = uuid.split("-");
		String authKey = uuids[4];
		
		SimpleMailMessage mail = new SimpleMailMessage();
		String title = "happypet-인증메일입니다.";
		String mailContent = "[이메일 인증]인증번호입니다."
                 + authKey +  "인증번호는 일시적인 것으로 로그아웃후 사용이 불가합니다.";
		
		mail.setSubject(title);
		mail.setText(mailContent);
		mail.setTo(email);
		
		try {
			jms.send(mail);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("rst", false);
			return map;
		}
		
		map.put("rst", true);
		map.put("authKey", authKey);
		
		return map;
		
		
	}
}
