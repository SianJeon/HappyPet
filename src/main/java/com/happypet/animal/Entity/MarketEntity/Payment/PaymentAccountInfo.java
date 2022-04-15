package com.happypet.animal.Entity.MarketEntity.Payment;

public class PaymentAccountInfo {
    
    String accountNo;
    String impuid;
    String merchantuid;
    int paidamount;

    public String getAccountNo() {
        return this.accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getImpuid() {
        return this.impuid;
    }

    public void setImpuid(String impuid) {
        this.impuid = impuid;
    }

    public String getMerchantuid() {
        return this.merchantuid;
    }

    public void setMerchantuid(String merchantuid) {
        this.merchantuid = merchantuid;
    }

    public int getPaidamount() {
        return this.paidamount;
    }

    public void setPaidamount(int paidamount) {
        this.paidamount = paidamount;
    }

    
}
