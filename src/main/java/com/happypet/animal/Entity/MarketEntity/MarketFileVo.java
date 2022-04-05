package com.happypet.animal.Entity.MarketEntity;

import org.springframework.web.multipart.MultipartFile;

public class MarketFileVo {
    
    int no;
    int productNo;
    
    MultipartFile[] mainImg;
    
    String mainPath;

    public String getMainPath() {
        return this.mainPath;
    }

    public void setMainPath(String mainPath) {
        this.mainPath = mainPath;
    }

    public MultipartFile[] getMainImg() {
        return this.mainImg;
    }

    public void setMainImg(MultipartFile[] mainImg) {
        this.mainImg = mainImg;
    }

    public int getProductNo() {
        return this.productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }


    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }
}