package com.happypet.animal;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.Gson;
import com.happypet.animal.Entity.MarketEntity.Payment.PaymentVo;

public class fewqfwq {
    public static void main(String[] args) {

        long time = 4323123l;
        SimpleDateFormat sdf = new SimpleDateFormat("YYMMddHHmmss");
        Date date = new Date();
        date.setTime(time);

        String temp = sdf.format(date);
        
        System.out.println(temp);
        
        
        String string ="{\"success\":true,\"imp_uid\":\"imp_314079627175\",\"pay_method\":\"point\",\"merchant_uid\":\"mexrchant_1650248079457\",\"name\":\"\",\"paid_amount\":100,\"currency\":\"KRW\",\"pg_provider\":\"html5_inicis\",\"pg_type\":\"payment\",\"pg_tid\":\"StdpayCARDINIpayTest20220418111507027762\",\"apply_num\":\"\",\"buyer_name\":\"\",\"buyer_email\":\"\",\"buyer_tel\":\"010-5056-1757\",\"buyer_addr\":\" \",\"buyer_postcode\":\"\",\"custom_data\":\"[{\\\"no\\\":\\\"43\\\",\\\"price\\\":60000,\\\"discount\\\":\\\"0\\\",\\\"buyAmount\\\":\\\"1\\\"},{\\\"no\\\":\\\"42\\\",\\\"price\\\":42800,\\\"discount\\\":\\\"38\\\",\\\"buyAmount\\\":\\\"1\\\"},{\\\"no\\\":\\\"48\\\",\\\"price\\\":51000,\\\"discount\\\":\\\"0\\\",\\\"buyAmount\\\":\\\"1\\\"},{\\\"no\\\":\\\"66\\\",\\\"price\\\":5600,\\\"discount\\\":\\\"53\\\",\\\"buyAmount\\\":\\\"1\\\"},{\\\"no\\\":\\\"67\\\",\\\"price\\\":4000,\\\"discount\\\":\\\"20\\\",\\\"buyAmount\\\":\\\"1\\\"}]\",\"status\":\"paid\",\"paid_at\":1650248107,\"receipt_url\":\"https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid=StdpayCARDINIpayTest20220418111507027762&noMethod=1\",\"card_name\":null,\"bank_name\":null,\"card_quota\":0,\"card_number\":\"*********\"}";
        System.out.println(string);
        
        Gson gson = new Gson();
        
        PaymentVo vo = gson.fromJson(string, PaymentVo.class);
        
        System.out.println(gson.toJson(vo));
    }
}
