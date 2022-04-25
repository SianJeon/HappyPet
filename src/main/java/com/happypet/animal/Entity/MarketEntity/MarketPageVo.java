package com.happypet.animal.Entity.MarketEntity;

public class MarketPageVo {
    
    int totalPage;      // 전체 게시물
    int curPage;        // 현재 페이지
    int pageRows;       // 페이지당 개수
    int startPage;      // 시작 페이지
    int endPage;        // 마지막 페이지
    int displayPage;    // 표시할 페이지갯수

    public MarketPageVo() 
    {
        this.startPage = 1;
        this.curPage = 1;
        this.pageRows = 8;
        this.endPage = totalPage / 8;
        this.displayPage = 10;
    }
    public MarketPageVo(int totalPage)
    {
        this.totalPage = totalPage;
        this.startPage = 1;
        this.curPage = 1;
        this.pageRows = 8;
        this.endPage = totalPage / 8;
        this.displayPage = 10;
    }

    public MarketPageVo(int totalPage, int curpage)
    {
        this.totalPage = totalPage;
        this.startPage = 1;
        this.curPage = curpage;
        this.pageRows = 8;
        this.endPage = totalPage / 8;
        this.displayPage = 10;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurPage() {
        return this.curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPageRows() {
        return this.pageRows;
    }

    public void setPageRows(int pageRows) {
        this.pageRows = pageRows;
    }

    public int getStartPage() {
        return this.startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return this.endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getDisplayPage() {
        return this.displayPage;
    }

    public void setDisplayPage(int displayPage) {
        this.displayPage = displayPage;
    }

    
}
