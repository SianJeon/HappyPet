package com.happypet.animal.Entity.Freeboard;

import java.util.Date;

public class FreeboardVo {

	int no;
	String category;
	String title;
	String content;
	String writer;
	Date writedate;
	String fbKey;
	int hit;
	String pw;
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFbKey() {
		return fbKey;
	}
	public void setFbKey(String fbKey) {
		this.fbKey = fbKey;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	@Override
	public String toString() {
		return "FreeboardVo [no=" + no + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", writedate=" + writedate + ", fbKey=" + fbKey + ", hit=" + hit + ", pw=" + pw
				+ "]";
	}
	
	
}
