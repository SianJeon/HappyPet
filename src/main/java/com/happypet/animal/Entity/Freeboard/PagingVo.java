package com.happypet.animal.Entity.Freeboard;

public class PagingVo {
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	int nowPage, startPage, endPage, totals, cntPerPages, lastPages, starts, ends;
	int cntPages = 5;
	
	
	
	@Override
	public String toString() {
		return "PagingVo [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", totals="
				+ totals + ", cntPerPages=" + cntPerPages + ", lastPages=" + lastPages + ", starts=" + starts
				+ ", ends=" + ends + ", cntPages=" + cntPages + "]";
	}

	public PagingVo(){

	}
	
	public PagingVo(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPages(cntPerPage);
		setTotals(total);
		calcLastPage(getTotals(), getCntPerPages());
		calcStartEndPage(getNowPage(), cntPages);
		calcStartEnd(getNowPage(), getCntPerPages());
	}
	
	//제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPages((int)Math.ceil((double)total/(double)cntPerPage));
	}
	
	//시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage((int)Math.ceil((double)nowPage / (double)cntPage));
		if(getLastPages() < getEndPage()) {
			setEndPage(getLastPages());
		}
		setStartPage(getEndPage()- cntPage + 1);
		if(getStartPage() <1) {
			setStartPage(1);
		}
	}
	
	//DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnds(nowPage * cntPerPage);
		setStarts(getEnds()- cntPerPage + 1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotals() {
		return totals;
	}

	public void setTotals(int totals) {
		this.totals = totals;
	}

	public int getCntPerPages() {
		return cntPerPages;
	}

	public void setCntPerPages(int cntPerPages) {
		this.cntPerPages = cntPerPages;
	}

	public int getLastPages() {
		return lastPages;
	}

	public void setLastPages(int lastPages) {
		this.lastPages = lastPages;
	}

	public int getStarts() {
		return starts;
	}

	public void setStarts(int starts) {
		this.starts = starts;
	}

	public int getEnds() {
		return ends;
	}

	public void setEnds(int ends) {
		this.ends = ends;
	}

	public int getCntPages() {
		return cntPages;
	}

	public void setCntPages(int cntPages) {
		this.cntPages = cntPages;
	}
	
	
	
}