<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.container-box {border : 1px solid rgb(203, 203, 203); margin : 10px 60px 10px 60px;}
.items-order
{
    border : 1px solid rgb(203, 203, 203); border-radius : 10px; margin : 10px 60px 10px 60px; 
    padding: 30px 20px 30px 20px;
}
.orderInfo {padding-left: 40px;}
.btn-itmes 
{
    margin: 0; padding: 0; border: 0;
    border-radius : 7px;
    background-color: white;
    border: 1px solid black;
    height: 42px;
}
.btn-itmes:first-child
{
    border-color: #346AFF;
}
</style>

<div class = "container d-flex justify-content-between" style = "margin-left : 60px; margin-right : 60px; padding : 0">
    <div class="section-title" style = "font-size : 24px; margin-top: 30px;">주문 목록</div>
</div>
<div class = "container-box">
    <div style = "margin : 20px 60px 0px 60px"><h3>2002. 4. 15 주문</h3></div>
    <c:forEach items = "${vo}" var = "vo">
    <div class = "d-flex flex-column">
        <div class = "container-itembox">
            <div class = "row items-order">
                <div class = "col-9">
                    <div><h3>배송중</h3></div>
                    <div class = "d-flex">
                        <img src="${vo.mainPath}" alt="" style = "width : 128px;">
                        <div class = "d-flex flex-column orderInfo">
                            <div class = "pt-4" style = "font-size : 21px;">${vo.productName}</div>
                            <div class = "d-flex pt-2" style = "color : rgb(203, 203, 203)">
                                <div>${vo.productPrice}</div>
                                <div style = "margin-left : 30px;">${vo.buyAmount}개</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "col-3 d-flex flex-column">
                    <button class = "btn-itmes mt-3" type = "button">배송조회</button>
                    <button class = "btn-itmes mt-3" type = "submit">교환, 반품신청</button>
                    <button class = "btn-itmes mt-3" type = "submit">리뷰 작성하기</button>
                </div>
            </div>
        </div>
        </div>
    </c:forEach>
    </div>

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />