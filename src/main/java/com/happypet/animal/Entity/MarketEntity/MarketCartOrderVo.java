package com.happypet.animal.Entity.MarketEntity;

public class MarketCartOrderVo {
    
    int productNo;
    int productPrice;
    int buyAmount;
    int discount;

    String mainPath;
    String productName;

    String userId;
    String zipcode;
    String address;
    String userName;

    int discountPrice;

    public int getDiscountPrice() {
        return this.discountPrice;
    }

    public void setDiscountPrice(int discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getProductNo() {
        return this.productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
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

    public String getMainPath() {
        return this.mainPath;
    }

    public void setMainPath(String mainPath) {
        this.mainPath = mainPath;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getZipcode() {
        return this.zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
