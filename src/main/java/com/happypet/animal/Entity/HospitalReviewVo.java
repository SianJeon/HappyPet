package com.happypet.animal.Entity;

import java.sql.Date;

public class HospitalReviewVo {
	int no;
	String content, writer, pass, title;
	Date wriedate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWriedate() {
		return wriedate;
	}
	public void setWriedate(Date wriedate) {
		this.wriedate = wriedate;
	}
	
	
}
