package com.happypet.animal.Entity.MarketEntity;

public class MarketCartView extends MarketCart {
    
    String mainPath;
	String productName;
	int productPrice;

	int discount;

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
