package com.happypet.animal.Entity.MarketEntity;

public class MarketCart {
    
    int cartNo;
    String accountNo;
    int productNo;
    int buyAmount;

    public int getCartNo() {
        return this.cartNo;
    }

    public void setCartNo(int cartNo) {
        this.cartNo = cartNo;
    }

    public String getAccountNo() {
        return this.accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public int getProductNo() {
        return this.productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    public int getBuyAmount() {
        return this.buyAmount;
    }

    public void setBuyAmount(int buyAmount) {
        this.buyAmount = buyAmount;
    }

}
