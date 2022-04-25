package com.happypet.animal.Entity.Freeboard;

public class FileVo {
	int file_no;
	String path;
	int size;
	int no;
	String type;
	
	
	
	@Override
	public String toString() {
		return "FileVo [file_no=" + file_no + ", path=" + path + ", size=" + size + ", no=" + no + ", type=" + type
				+ "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
