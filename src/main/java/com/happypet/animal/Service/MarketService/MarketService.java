package com.happypet.animal.Service.MarketService;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import com.happypet.animal.Entity.MarketEntity.ConbineMarket;
import com.happypet.animal.Entity.MarketEntity.Market;
import com.happypet.animal.Entity.MarketEntity.MarketCart;
import com.happypet.animal.Entity.MarketEntity.MarketCartOrderVo;
import com.happypet.animal.Entity.MarketEntity.MarketCartView;
import com.happypet.animal.Entity.MarketEntity.MarketFileVo;
import com.happypet.animal.Entity.MarketEntity.MarketVo;
import com.happypet.animal.Repository.MarketRepository.MarketDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MarketService {
      
    @Autowired
    MarketDAO marketDAO;

    @Autowired
    ServletContext servletContext;

    // 오더 리스트 및 수량
    public ConbineMarket orderList(int no)
    {
        ConbineMarket conbineMarket = marketDAO.selectOrderlist(no);
        
        // 할인율을 할인할 가격으로 변환해 변수값 변경
        int discountMoney =  conbineMarket.getProductPrice() * (int)((conbineMarket.getDiscount() * 0.01) * 100) / 100;
        conbineMarket.setDiscount((int)Math.round((conbineMarket.getProductPrice() - discountMoney) / 100.0) * 100);

        return conbineMarket;
    }

    public List<MarketCart> orderAmount(MarketCart cart)
    {
        return marketDAO.selectOrderAmount(cart);
    }

    public MarketCart buyBtn(int no)
    {
        return marketDAO.selectBuyBtn(no);
    }
    // 마켓 홈화면 리스트
    public List<ConbineMarket> marketHomeList()
    {
        return marketDAO.selectMarketList();
    }

    // 마켓 디테일
    public ConbineMarket marketDetail(int no)
    {
        ConbineMarket conbineMarket = marketDAO.selectMarketDetail(no);
        conbineMarket.setArrPath(marketDAO.selectMarketFileDetail(no));

        // 할인율을 할인할 가격으로 변환해 변수값 변경
        int discountMoney =  conbineMarket.getProductPrice() * conbineMarket.getDiscount() / 100;
        System.out.println(discountMoney);
        conbineMarket.setDiscount((int)Math.round(discountMoney / 100.0) * 100);
        // (int)Math.round((conbineMarket.getProductPrice() - discountMoney) / 100.0) * 100
        return conbineMarket;
    }


    // 마켓파일 등록
    public boolean insertProductDetail(MarketVo marketVo, MarketFileVo marketFileVo) throws IllegalStateException, IOException
    {
        if(marketVo.getDetailImg() == null || marketVo.getDetailImg().isEmpty()) return false;
        if(!marketVo.getDetailImg().getContentType().startsWith("image")) return false;
        

        boolean result =  insertProductInfo(marketVo);
        
        
        if(!result) return false;

        String realPath = servletContext.getRealPath("/resources/img/market/cover/");

        File file = new File(realPath);
        if(!file.exists()) file.mkdir();

        MultipartFile[] attach = marketFileVo.getMainImg();
        for(int i = 0; i < attach.length; i++)
        {
            if(attach == null || attach[i].isEmpty()) continue;

            int number = i + 1;
            String fileName = UUID.randomUUID().toString() 
            + (number < 10 ? "_0" + number : "_" + number);
            
            file = new File(realPath, fileName);
            
            attach[i].transferTo(file);

            marketFileVo.setMainPath("/img/market/cover/" + fileName);
            
            marketDAO.insertFile(marketFileVo);
        }

        return true;

    }


    // 마켓 등록
    public boolean insertProductInfo(MarketVo marketVo) throws IllegalStateException, IOException
    {
        if(marketVo.getDetailImg() == null || marketVo.getDetailImg().isEmpty())
            return false;
        if(!marketVo.getDetailImg().getContentType().startsWith("image"))
            return false;
    
        String path = servletContext.getRealPath("/resources/img/market/detail");
        File fPath = new File(path);
        if(!fPath.exists())
            fPath.mkdirs();

        String fileName = UUID.randomUUID().toString();
        File dest = new File(path, fileName);
        try {
            marketVo.getDetailImg().transferTo(dest);
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }

        marketVo.setdetailImgPath("/img/market/detail/" + fileName);
        

        int result =  marketDAO.insertMarket(marketVo);
        
        
        return true;
    }

    public List<MarketVo> modifyList()
    {
        return marketDAO.selectModifyList();
    }

    public boolean updateProduct(MarketVo vo)
    {
    	return 1 == marketDAO.updateMarketProduct(vo) ? true : false;
    }

    public boolean deleteProduct(MarketVo vo)
    {
        return 1 == marketDAO.updateMarketProduct(vo) ? true : false;
    }

    public boolean insertMarketCart(MarketCart cart)
    {
        // 이미 장바구니에 담은 아이템이 있는지 확인
        boolean result = marketDAO.selectAddMarketCart(cart);
        if(result)
        {
            //장바구니 추가
            marketDAO.insertMarketCart(cart);
        }
        else 
        { 
            // 장바구니 담은 갯수만 증가
            marketDAO.updateMartketCartAmount(cart);
        }
        
        // bool 1 == marketDAO.insertMarketCart(cart);
        return result;
    }

    // 장바구니 

    // 장바구니에 담은 물건 전부 가져오기
    public List<MarketCartView> selectAllCart(String account_id)
    {
        List<MarketCartView> marketCart = marketDAO.selectAllCart(account_id);

        // 할인율을 할인할 가격으로 변환해 변수값 변경
        for (MarketCartView mc : marketCart) {
            int discountMoney =  mc.getProductPrice() * (int)((mc.getDiscount() * 0.01) * 100) / 100;
            
            mc.setProductPrice((int)Math.round((mc.getProductPrice() - discountMoney) / 100.0) * 100);
        }
        return marketCart;
    }

    public int minusMarketCart(MarketCart cart)
    {
        return marketDAO.updateMarketCartMinus(cart);
    }

    public int plusMarketCart(MarketCart cart)
    {
        
        return marketDAO.updateMartketCartAmount(cart);
    }

    // 카트 삭제
    public int deleteMarketCart(MarketCart cart)
    {
        int result = marketDAO.deleteMarketCart(cart);
        return result;
    }

    // 장바구니 상품 리스트 주문 화면으로 출력
    public List<MarketCartOrderVo> cartListOrder(String accountId)
    {
        List<MarketCartOrderVo> list = marketDAO.selectOrderCartList(accountId);

        for (MarketCartOrderVo vo : list) {
            System.out.println(vo.getBuyAmount());
            int discount = vo.getProductPrice() *  (int)((vo.getDiscount() * 0.01) * 100) / 100;
            vo.setDiscountPrice((int)Math.round((vo.getProductPrice() - discount) / 100.0) * 100);
        }

        return list;
    }
}
