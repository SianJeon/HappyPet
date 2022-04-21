package com.happypet.animal.Entity.Freeboard;

import java.util.Date;

public class FileVo {
	int fileNo;
	int no;
	String filePath;
	long fileSize;
	String fileType;
	String fileName;
	Date file_update_date;
	
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getFile_update_date() {
		return file_update_date;
	}
	public void setFile_update_date(Date file_update_date) {
		this.file_update_date = file_update_date;
	}
	
	@Override
	public String toString() {
		return "FileVo [fileNo=" + fileNo + ", no=" + no + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", fileType=" + fileType + ", fileName=" + fileName + ", file_update_date=" + file_update_date + "]";
	}
	
	
	
}
