<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.cart-container{ border: 1px solid rgb(172, 172, 172); margin-left: 50px; margin-right: 50px;}
.cart-box {border-bottom: 2px solid black; padding-bottom: 15px; margin-top : 20px; margin-left : 88px; margin-right : 88px;}
.btn-count {margin: 0; padding: 0; border: 0; background-color: white; border: 1px solid black; height: 36px;}
.delete-btn{height: 40px;border-radius: 6px;border : 1px solid salmon; outline: 0; background-color: crimson; color: white;}
.buy-btn{height: 40px;border-radius: 6px;border : 1px solid salmon; outline: 0; background-color: salmon; color: white;}
.cartFooter{border-top : 3px solid lightpink; margin-top: 50px; margin-left: 100px; margin-right: 100px; height : 96px; padding: 22px 0px 22px 15px;}
</style>
<div class="container-fluid mb-3" style="border-top: 1px solid rgb(135, 135, 135);"></div>
<div class="d-flex justify-content-between" style="margin-left: 50px; margin-right: 50px;">
    <div><h3>장바구니</h3></div>
    <div>01.장바구니</div>
</div>
<form action = "/market/cartorder" method = "">
<div class="cart-container">
    <div class="cart-box">장바구니 상품</div>
    <c:choose>
    <c:when test="${fn:length(vo) > 0}">
    <c:forEach items="${vo}" var="vo" varStatus = "i">
    <input type = "hidden" name = "productNo_${i.index}" value = "${vo.productNo}" >
    <div class = ""  style = "margin-top: 0; margin-left : 100px; margin-right : 100px;">
    <div class = "row" style="border-bottom: 1px solid rgb(192, 192, 192);">
        <div class = "col-5">
            <div class = "row">
                <div class = "col-3" style = "padding-left : 0px;">
                    <img src="${vo.mainPath}" alt="" style = "width : 110px;"> 
                </div>
                <div class = "col-9 d-flex justify-content-center flex-column pl-2">
                    <div style="padding-left: 20px;">${vo.productName}</div>
                </div>
            </div>     
        </div>
        <div class = "col-3 d-flex justify-content-center flex-column" style="border-left: 1px solid rgb(193,193,193);">
            <div style = "padding-left : 40px;">
                <%-- <span style="padding-right: 12px;"></span> --%>
                <button type ="button" onclick="Amount('minus', '${i.index}')" class="btn-count minus_${i.index}" style="width: 38px;">-</button>
                <input id = "" class="text-center btn-count buy-count buy-count_${i.index}" type="text" value="${vo.buyAmount}" 
                    style="width: 85px;">
                <button type ="button" onclick="Amount('plus', '${i.index}')" class="btn-count plus_${i.index}" style="width: 38px;">+</button>    
            </div>
        </div>
        <div class = "col-3 text-center d-flex justify-content-center flex-column" style="border-left: 1px solid rgb(193,193,193);">
            <c:if test="${vo.discount != 0}" >
            <div  style = "color : rgb(195, 195, 195)">할인 받은 금액 : ${vo.discount}%</div>
            </c:if>
            <div class="purchase-Price_${i.index}">${vo.productPrice * vo.buyAmount}</div>
            <input type="hidden" class="price_${i.index}" value="${vo.productPrice}">
        </div>
        <div class = "col-1 d-flex justify-content-center flex-column" style="border-left: 1px solid rgb(193,193,193);">
            <button class = "delete-btn" type = "button" onclick = "deleteItem(${i.index})">삭제</button>
        </div>
    </div>
    </div>
    </c:forEach>
    </c:when>
       <c:otherwise>
        <div class = 'd-flex justify-content-center flex-column'>
            <div class = "m-5" style = "padding-left : 300px;">
                <h1>현재 장바구니 정보가 존재하지 않습니다.</h1>
            </div>
        </div>
       </c:otherwise>
    </c:choose>
    
    <c:if test="${fn:length(vo) > 0}" >
    <div class="row d-flex cartFooter" >
        <div class="col-2">
            <div>총 상품금액</div>
            <div id ="allPrice">
            </div>
        </div>
        <div class="col-2">
            <div>할인받은 금액</div>
            <div>0원</div>
        </div>
        <div class="col-2">
            <div>배송비</div>
            <div id = "expressCost"></div>
        </div>
        <div class="col-6 d-flex" style = "padding-top : 10px; padding-left : 90px;">
            <div class = "d-flex " style = "padding-top : 10px;">
                <span><h4 style = "color : #ff425c">결제예상금액&nbsp;&nbsp;</h4></span>
                <span id = "cost">
                    <h4></h4>
                </span>    
            </div>
            <div style = "margin-left : 30px;">
                <button class = "buy-btn" style = "width : 160px;">구매하기</button>
            </div>
        </div>
    </div>
    </c:if>
    </form>
</div>

<input type = "hidden" value = "${loginUser.userId}" id = "userID">
<script>
    $(function () {
        var len = ${fn:length(vo)};
        var allPrice = 0;
        for (let i = 0; i < len; i++) 
        {
            const element = $(".purchase-Price_" + i).text();
            allPrice += parseInt(element);
        }
        $("#allPrice").text(allPrice);

        $("#expressCost").text(allPrice > 30000 ? 0 + '원' : 3000 + '원');

        var express = parseInt($("#expressCost").text());
        $("#cost > h4").text((allPrice + express) + '원' );
    });

    function Amount(calcul, i)
    {
        var currentVal = $(".buy-count_" + i).val();
        if(currentVal == 0 && calcul == "minus") return;
        
        switch (calcul) {
            case "plus": ++currentVal; break;
            case "minus": --currentVal; break;
        }
        $(".buy-count_" + i).val(currentVal);

        var price = $(".price_" + i).val();

        $(".purchase-Price_" + i).text(price * currentVal);

        allPrice();

        var userId = $("#userID").val() == "" ? "qwer" : $("#userID").val();
        $.ajax({
            url: "/market/cart" + calcul,
            data: {
                accountNo : userId,
                productNo : $("[name=productNo_" + i + "]").val()
            },
            success: function (response) {
                console.log('response :>> ', response);
            }
        });
    }
   
    function allPrice()
    {
        var len = ${fn:length(vo)};
        var allPrice = 0;
        console.log('parseInt($("#allPrice").text()) :>> ', ($("#allPrice").text()));
        
        for (let i = 0; i < len; i++) 
        {
            const element = $(".purchase-Price_" + i).text();
            allPrice += parseInt(element);
        }   
        $("#allPrice").text(allPrice);
    }

    function deleteItem(i)
    {
        var userId = $("#userID").val() == "" ? "qwer" : $("#userID").val();
        $.ajax({
            url: "/market/cartDelete",
            data: {
             accountNo : userId,
             productNo : $("[name=productNo_" + i + "]").val()
            },
            success: function (response) {
                window.location.reload();
            }
        });
    }
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />