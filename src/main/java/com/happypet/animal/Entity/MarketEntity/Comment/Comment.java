package com.happypet.animal.Entity.MarketEntity.Comment;

import java.util.Date;

public class Comment {
    
    int commentNo;
    String accountNo;
    int marketNo;

    String title;
    String content;
    String comentPath;
    
    Date wirteDate;
    
    int likeCount;
    int productScore;

    public int getProductScore() {
        return this.productScore;
    }

    public void setProductScore(int productScore) {
        this.productScore = productScore;
    }

    public int getLikeCount() {
        return this.likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }
    
    public Date getWirteDate() {
        return this.wirteDate;
    }

    public void setWirteDate(Date wirteDate) {
        this.wirteDate = wirteDate;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComentPath() {
        return this.comentPath;
    }

    public void setComentPath(String comentPath) {
        this.comentPath = comentPath;
    }

    public int getCommentNo() {
        return this.commentNo;
    }

    public void setCommentNo(int commentNo) {
        this.commentNo = commentNo;
    }

    public String getAccountNo() {
        return this.accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public int getMarketNo() {
        return this.marketNo;
    }

    public void setMarketNo(int marketNo) {
        this.marketNo = marketNo;
    }
}
