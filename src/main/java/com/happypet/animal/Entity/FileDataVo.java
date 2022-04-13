package com.happypet.animal.Entity;

public class FileDataVo {

	
	int no;
	String name;
	String path;
	String type;
	long len;
	int owner;
	
	
	@Override
	public String toString() {
		return "FileDataVo [no=" + no + ", name=" + name + ", path=" + path + ", type=" + type + ", len=" + len
				+ ", owner=" + owner + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	
}
