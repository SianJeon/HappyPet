package com.happypet.animal.Entity;

import org.springframework.beans.factory.annotation.Autowired;

import com.happypet.animal.Repository.PagingDao;

public class PagingVo {

	int totalCount; // 데이터 전체개 (DAO로 받아와야되고)
	int lastPage; // 전체 페이지 개수 : 자쳬계산

	int page; // 현재 페이지 번호 : modelAttribute 로( request Param)
	int offset; // 건너띌 데이터 개수 : 자체계산

	int beginBlock; // 페이지블락의 첫: 자체계산
	int endBlock; // 페이지블락의 끝: 자체계산

	
	public void update() {
		
		lastPage = totalCount / 10 + (totalCount % 10 > 0 ? 1 : 0);

		offset = (page - 1) * 10;
		
		beginBlock = ((page - 1) / 10) * 10 + 1;
		endBlock = (page + 9) / 10 * 10;
		
		endBlock = endBlock > lastPage ? lastPage : endBlock; 
		
		
		
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
	
		this.totalCount = totalCount;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getBeginBlock() {
		return beginBlock;
	}

	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	@Override
	public String toString() {
		return "PagingVo [totalCount=" + totalCount + ", lastPage=" + lastPage + ", page=" + page + ", offset=" + offset
				+ ", beginBlock=" + beginBlock + ", endBlock=" + endBlock + "]";
	}
	
	

}
