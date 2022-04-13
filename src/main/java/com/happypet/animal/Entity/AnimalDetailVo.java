package com.happypet.animal.Entity;

public class AnimalDetailVo {

	String no;
	String title;
	String content;
	String writer;
	String writedate;
	String owner;
	
	
	@Override
	public String toString() {
		return "AnimalDetailVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writedate=" + writedate + ", owner=" + owner + "]";
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	
	
}
