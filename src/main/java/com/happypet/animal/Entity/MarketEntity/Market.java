package com.happypet.animal.Entity.MarketEntity;


public class Market 
{
    MarketVo marketVo;
    MarketFileVo marketFileVo;

    public MarketFileVo getMarketFileVo() {
        return this.marketFileVo;
    }

    public void setMarketFileVo(MarketFileVo marketFileVo) {
        this.marketFileVo = marketFileVo;
    }
        
    public MarketVo getMarketVo() {
        return this.marketVo;
    }

    public void setMarketVo(MarketVo marketVoList) {
        this.marketVo = marketVoList;
    }


}
