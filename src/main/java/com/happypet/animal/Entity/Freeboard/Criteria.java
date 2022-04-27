package com.happypet.animal.Entity.Freeboard;

public class Criteria {

	private int fbNo;
	
	public int getFbNo() {
		return fbNo;
	}

	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}

	/* 현재 페이지 */
	private int pageNum;
	
	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;
	
	/* 검색 키워드 */
	private String keyword;
	
	/* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 10 */
	public Criteria() {
		this(1,10);
	}
	
	/* 생성자 -> 원하는 pageNum, 원하는 amount */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [fbNo=" + fbNo + ", pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
	}

	

	
	
}