package com.happypet.animal.Entity.MarketEntity;

public class MarketCartView extends MarketCart {
    
    String mainPath;
	String productName;
	int productPrice;

	int discount;

	int product_no;

	public int getProduct_no() {
		return this.product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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

	public int getProductPrice() {
		return this.productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getDiscount() {
		return this.discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}


}
