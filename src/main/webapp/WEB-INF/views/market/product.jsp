<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<style>
.plus, .minus{width: 38px;}
.btn-footerCart, .btn-footerBuy
{
    height: 40px;
    border-radius: 6px;
    border : 1px solid salmon;  
    outline: 0; background-color: white;
    width: 30%;
    color: crimson;  
}
.btn-footerBuy {background-color: crimson; color: white;}
.btn-count
{ 
    margin: 0; padding: 0; border: 0;
    background-color: white;
    border: 1px solid black;
    height: 36px;
}
.btn-buy, .btn-cart
{
    padding: 0;
}
.btn-cart button, .btn-buy button 
{ 
    height: 60px;
    border-radius: 6px;
    border : 1px solid salmon;  
    width: 100%; outline: 0; background-color: white;
    color: crimson;  
}
.btn-cart {padding-right: 10px;}
.btn-buy  {padding-left: 10px;}
.btn-buy button  { background-color: crimson; color: white;}
.text-info {font-size: 18px;}
.text-express {font-size: 12px; margin-left: 30px;}
.text-express i {font-style: normal; color: rgb(167, 167, 167); }

#footer-buy {
  position: sticky;
  bottom: 0; left: 0;
  height: 60px;
  width: 100%;
  background-color: white;
  border-top: 3px solid crimson;
}
</style>

<div style="border-bottom: 2px solid crimson;"></div>

<div class = "container-fluid row">
        <div class = "col-6">
            <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="1s">
                <div class="owl-carousel header-carousel position-relative">
                    <c:forEach items="${vo.arrPath}" var="vo">
                    <div class="owl-carousel-item position-relative" data-dot="<img src='${vo}'>">
                        <img class="/img-fluid" src="${vo}" alt="">
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class = "col-6 pt-4">
            <div class = "container">
                <div style = "color : rgb(0, 115, 233);" class = "mb-1">${vo.company}</div>
                <div class="text-left ml-0 mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h4 class="section-title">${vo.productName}</h4>
                </div>
                <div class = "pr-3 pl-3">
                    <div class = "d-flex justify-content-between">
                        <div>정가</div>
                        <div><fmt:formatNumber value="${vo.productPrice}" pattern="#,###" /></div>
                    </div>
                    <div class = "d-flex justify-content-between mt-2">
                        <div style="padding-top: 12px;">판매가</div>
                        <div style="font-size: 24px; font-weight: bold;"> 
                            <fmt:formatNumber value="${vo.productPrice - vo.discount}" pattern="#,###" />
                        </div>
                    </div>
                    <div class = "d-flex justify-content-between mt-2">
                        <div style="padding-top: 12px;">할인받은 금액</div>
                        <div style=" color : salmon;">
                            <fmt:formatNumber value="${vo.discount}" pattern="#,###" />
                        </div>
                    </div>
                    <div class="mt-4 mb-4" 
                            style="border-top : 1px solid #d1d1d1;
                                border-bottom : 1px solid #d1d1d1" >
                        <div class = "mt-4 mb-4">
                            <span><i class="fa-regular fa-truck-fast"></i>반짝배송</span>
                            <span class="text-express">저녁 8시 전 주문 시 새벽 도착<i>(영업일기준)</i>
                                <p style = "padding-left: 90px;">서비스 지역 : 수도권, 충청권 일부</p></span>
                        </div>
                        <div>
                            <span class = "mt-4 mb-4">로켓배송</span>
                            <span class="text-express">저녁 6시 전 주문 시 오늘 출발<i>(영업일기준)</i></span>
                        </div>
                        <div class = "mt-4 mb-4">
                            <span>무료배송</span>
                            <span class="text-express">30,000원 이상 주문 시 무료배송</span>
                        </div>
                    </div>

                    <div class="mt-5 stop-dragging" 
                        style="background-color: rgba(172, 172, 172, 0.182); height: 100px;
                        padding: 0px 20px 0px 20px;">
                        <div class="d-flex justify-content-between pt-3">
                            <div>수량</div>
                            <div>총 상품금액</div>
                        </div>
                        <div class="pt-2">
                            <button class="btn-count minus">-</button>
                            <input id = "buy-count" class="text-center btn-count" type="text" 
                                    value="1" style="width: 85px; ">
                            <button class="btn-count plus">+</button>
                            <span class="purchase-Price" style="float:right; font-size : 22px;">
                               <fmt:formatNumber value="${vo.productPrice - vo.discount}" pattern="#,###" />
                                </span>
                        </div>
                    </div>

                    <div class="container-fluid row stop-dragging mt-3 p-0" 
                        style="margin-left: 0; margin-right: 0;">
                        <div class="btn-cart col-6">
                            <button>장바구니 담기</button>
                        </div>
                        <div class="btn-buy col-6">
                            <button>바로 구매</button>
                        </div>
                    </div>
                </div>
           </div>
        </div>
    </div>

    <div class = "row text-center mt-3">
        <div class = "col-3 ">
            상품정보
        </div>
        <div class = "col-3">
            질문 / 답변
        </div>
        <div class = "col-3">
            구매 후기
        </div>
        <div class = "col-3">
            취소 / 교환 / 반품 안내
        </div>

    </div>
    <div style = "margin : 10px; border-bottom : 1px solid rgb(195, 185, 185)"></div>
    
    <div class = "d-flex justify-content-center">
        <img src="${vo.detailImgPath}" alt="" style="width : 500px">
    </div>


<div id = "footer-buy" class="row d-flex justify-content-center text-center 
                    wow" data-wow-delay="0.1s">
    <div class="col-4">
        <div class="pt-2">
            <span style="padding-right: 12px;">수량</span>
            <button class="btn-count minus">-</button>
            <input id = "buy-count" class="text-center btn-count" type="text" 
                    value="1" style="width: 85px; ">
            <button class="btn-count plus">+</button>
        </div>
    </div>
    <div class="col-4" style="padding-top: 14px;">
        <span class="purchase-Price" style="font-size : 18px;"> 
            <span style="font-family : inherit;">총 상품금액 : </span>
            <fmt:formatNumber value="${vo.productPrice - vo.discount}" pattern="#,###" />
        </span>
    </div>
    <div class="col-4" style="padding-top: 8px;">
        <span><button class = "btn-footerCart">장바구니 담기</button></span>
        <span><button class = "btn-footerBuy">바로 구매</button></span>
    </div>
</div>


<input type="hidden" name="price" value = "${vo.productPrice - vo.discount}">
<script>
    
    var oldVal;
    $("#buy-count").on("propertychange change keyup paste input", function() {
        var currentVal = $(this).val();
        if(currentVal == oldVal) {
            return;
        }
        oldVal = currentVal;

        var price = $("[name=price]").val();
        $(".purchase-Price").val(
            Number(Number(price) * $("#buy-count").val()).toLocaleString()
        );
    });
    

    $(".plus").click(function (e) { 
        var currentVal = $("#buy-count").val();

        $("#buy-count").val(++currentVal);
            
        var price = $("[name=price]").val();

        $(".purchase-Price").text(
            Number(Number(price) * currentVal).toLocaleString()
        );
    });
    $(".minus").click(function (e) { 
        var currentVal = $("#buy-count").val();
        if(currentVal == 1) return;

        $("#buy-count").val(--currentVal);

        var price = $("[name=price]").val();
        $(".purchase-Price").text(
            Number(Number(price) * currentVal).toLocaleString()
        );
    });
    var scrollHeight; 
    var firstLoad = false;
    $(window).scroll(function(event){ 
        scrollHeight = $(document).scrollTop();
        
        if(scrollHeight < 660)
        {
            $("#footer-buy").css("position", "relative");
        }
        else
        {
            $("#footer-buy").css("position", "sticky");
        }
    });


</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />