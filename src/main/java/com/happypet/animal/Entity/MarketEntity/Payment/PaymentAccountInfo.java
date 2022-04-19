package com.happypet.animal.Entity.MarketEntity.Payment;

public class PaymentAccountInfo {
    
    String accountNo;
    String impUid;
    String merchantUid;
    int paidAmount;

    public String getAccountNo() {
        return this.accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getImpUid() {
        return this.impUid;
    }

    public void setImpUid(String impUid) {
        this.impUid = impUid;
    }

    public String getMerchantUid() {
        return this.merchantUid;
    }

    public void setMerchantUid(String merchantuid) {
        this.merchantUid = merchantuid;
    }

    public int getPaidAmount() {
        return this.paidAmount;
    }

    public void setPaidamount(int paidamount) {
        this.paidAmount = paidamount;
    }

    
}
