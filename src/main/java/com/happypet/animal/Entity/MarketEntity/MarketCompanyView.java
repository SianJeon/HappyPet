package com.happypet.animal.Entity.MarketEntity;

import java.util.List;

public class MarketCompanyView {

    MarketPageVo marketPageVo;
    List<String> companyList;

    String category;

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getCompanyList() {
        return this.companyList;
    }

    public void setCompanyList(List<String> companyList) {
        this.companyList = companyList;
    }

    public MarketPageVo getMarketPageVo() {
        return this.marketPageVo;
    }

    public void setMarketPageVo(MarketPageVo marketPageVo) {
        this.marketPageVo = marketPageVo;
    }

 
    
}
