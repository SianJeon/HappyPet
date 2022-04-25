package com.happypet.animal.Entity.MarketEntity;

import java.util.List;

public class ConbineMarket extends MarketVo{

    int no;
    String mainPath;

    List<String> arrPath;

    public List<String> getArrPath() {
        return this.arrPath;
    }

    public void setArrPath(List<String> arrPath) {
        this.arrPath = arrPath;
    }

    public int getNo() {
        return this.no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getMainPath() {
        return this.mainPath;
    }

    public void setMainPath(String MainPath) {
        this.mainPath = MainPath;
    }

}
