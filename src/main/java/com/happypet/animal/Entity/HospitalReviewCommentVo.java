package com.happypet.animal.Entity;

import java.sql.Date;

public class HospitalReviewCommentVo {
	int no, owner;
	String writer, content;
	Date writedate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "HospitalReviewCommentVo [no=" + no + ", owner=" + owner + ", writer=" + writer + ", content=" + content
				+ ", writedate=" + writedate + "]";
	}
	
	
	
}
