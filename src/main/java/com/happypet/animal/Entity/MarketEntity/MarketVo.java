package com.happypet.animal.Entity.MarketEntity;

import org.springframework.web.multipart.MultipartFile;

public class MarketVo {

    int no;
    String category;
    String company;
    String productName;
    int productPrice;
    int productStock;
    String detailImgPath;

    int discount;
    
    MultipartFile detailImg;
    
    public String getdetailImgPath() {
        return this.detailImgPath;
    }

    public void setdetailImgPath(String detailImgPath) {
        this.detailImgPath = detailImgPath;
    }
    
    public MultipartFile getDetailImg() {
        return this.detailImg;
    }

    public void setDetailImg(MultipartFile detailImg) {
        this.detailImg = detailImg;
    }

    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCompany() {
        return this.company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return this.productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductStock() {
        return this.productStock;
    }

    public int getDiscount() {
        return this.discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setProductStock(int productStock) {
        this.productStock = productStock;
    }

	@Override
	public String toString() {
		return "MarketVo [no=" + no + ", category=" + category + ", company=" + company + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productStock=" + productStock + ", detailImg=" + detailImg
				+ "]";
	}
    
    
}
