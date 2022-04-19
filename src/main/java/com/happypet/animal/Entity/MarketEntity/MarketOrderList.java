package com.happypet.animal.Entity.MarketEntity;

public class MarketOrderList {
    
    int no;
    int productPrice;
    int buyAmount;
    int discount;

    String productName;
    String mainPath;
    
    String buyTime;

    public String getBuyTime() {
        return this.buyTime;
    }
    
    public void setBuyTime(String buyTime) {
        this.buyTime = buyTime;
    }

    public String getMainPath() {
        return this.mainPath;
    }

    public void setMainPath(String mainPath) {
        this.mainPath = mainPath;
    }

    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getProductPrice() {
        return this.productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getBuyAmount() {
        return this.buyAmount;
    }

    public void setBuyAmount(int buyAmount) {
        this.buyAmount = buyAmount;
    }

    public int getDiscount() {
        return this.discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }


}
