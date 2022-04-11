<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.buy-btn
{
    height: 40px;
    border-radius: 6px;
    border : 1px solid salmon;  
    outline: 0; background-color: crimson;
    width: 30%;
    color: white;
}
.express-container
{
    padding-left: 80px;
}
.input-text
{
    /* padding-top: 15px; */
    margin-right: 80px;
    /* margin-left: ; */
}
.buy-input
{
    height: 55px;
    border: 1px solid rgb(173, 173, 173);
    border-radius: 10px;
}
.btn-adress
{
    margin-left: 30px;
    height: 55px;
    border-radius: 6px;
    border : 1px solid salmon;  
    width: 100%; outline: 0; background-color: white;
    color: crimson;  
}
table tr 
{ 
    border-bottom : 1px solid rgb(217, 217, 217);
    height: 7vh;
}
table tr th {background-color: rgb(231, 231, 231); font-weight: bold; padding-left: 30px;}
table tr td {padding-left: 30px;}
.top-line { border-top: 2px solid black;}
</style>

<div class="container-fluid mb-3" style="border-top: 1px solid rgb(135, 135, 135);"></div>
<div class="d-flex justify-content-between" style="margin-left: 50px; margin-right: 50px;">
    <div><h3>주문결제</h3></div>
    <div>02.주문결제</div>
</div>
<div class = "" style = "border: 1px solid rgb(172, 172, 172); margin-left: 50px; margin-right: 50px;">
    <div class = "container ml-4 mr-4">
        <div style="border-bottom: 2px solid; margin-top : 40px;"><h3>배송정보</h3></div>
        <div>
            <div class="mt-5 express-container">
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">받는사람</span>
                    <span><input type="text" class="form-control buy-input" placeholder="받는 사람"
                            style="margin-left: 31px;" value="${loginUser.userName}"></span>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">휴대전화</span>
                    <span><input type="text" class="form-control buy-input" placeholder="전화번호"
                            style="margin-left: 31px;"></span>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text" style="padding-top : 30px;">배송지 주소</span>
                    <span class = "">
                        <div class = "d-flex flex-row">
                            <input type="text" class="form-control buy-input" placeholder="우편번호"
                                style="margin-left: 12.5px; width: 128px;" value="${loginUser.zipcode}">
                            <button type = "submit" class="btn-adress">우편번호검색</button>
                        </div>
                    </span>
                </div>
                <div class = "d-flex flex-column">
                    <div class = "col-4 mt-3">
                        <div><input type="text" class="form-control buy-input" 
                            style="margin-left: 168px; width: 257px;" placeholder="상세주소를 입력하세요"
                            value="${loginUser.address}"></div>
                    </div>
                    <div class="mt-3">
                        <div><input type="text" class="form-control buy-input" 
                            style="margin-left: 168px; width: 257px;" placeholder="주소를 입력하세요"
                            ></div>
                    </div>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">배송 요청사항</span>
                    <span><input type="text" class="form-control buy-input" placeholder="요청사항"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div><h3>주문상품</h3></div>
        <div class="top-line" style="background-color: rgb(223, 223, 223);
            border-bottom: 1px solid rgb(172, 172, 172);">
            <div class="mt-3" style="color: black; margin-left: 20px;">배송 상품</div>
            <div class="mt-3 mb-3" style="color: tomato; margin-left: 20px;">
                발송일 : <script type="text/javascript">
                    var dates = new Date();
                    var date = dates.getHours();
                    if(date > 18 || date < 9) document.write("내일 발송");
                    else if(date > 9 && date < 18) document.write("오늘 발송");
                </script>
            </div>
        </div>
    </div>
    <div class="container d-flex flex-row mt-2">
        <div>
            <img src="${order.mainPath}" alt="" style="width: 120px;">
        </div>
        <div class="container row">
            <div class="col-10 d-flex flex-column mr-3 mt-3">
                <div class="m-2" style="font-size: 22px;">
                    ${order.productName}
                </div>
                <div class="m-2 d-flex flex-row">
                    <div>수량  : </div>
                    <div style="padding-left: 10px;">${buyAmount} 개</div>
                </div>
            </div>
            <div class="col-2 text-center pt-3 mt-3">
                <div class="d-flex flex-row">
                    <span>정가 :</span>
                    <h4 style="padding-left: 10px;"><fmt:formatNumber value="${order.productPrice}" pattern="#,###" /></h4>
                </div>
                <div class="d-flex flex-row">
                    <span>할인가 :</span>
                     <h4 style="color: tomato; padding-left: 10px;">
                        <fmt:formatNumber value="${order.productPrice - order.discount}" pattern="#,###" />
                    </h4>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div><h3>최종결제 금액</h3></div>
        <table class="container mr-0" style="margin-left: 0; border-top: 2px solid black;">
            <tr class="mt-3">
                <th style="width: 3%;">총 상품 금액</th>
                <td style="width: 17%;">
                    <fmt:formatNumber value="${order.productPrice - order.discount}" pattern="#,###" /> 원
                </td>
            </tr>
            <tr class="mt-3">
                <th>배송비</th>
                <td>
                    <c:choose>
                        <c:when test="${order.productPrice - order.discount >= 30000}">
                        무료배송
                        <input type="hidden" name="deliveryMoney" value="0">
                       </c:when>
                       <c:otherwise>
                       3000 원
                       <input type="hidden" name="deliveryMoney" value="3000">
                       </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>쿠폰</th>
                <td>
                    0 원
                </td>
            </tr>
            <tr>
                <th>보유 현금</th>
                <td>
                    0 원
                </td>
            </tr>
            <tr>
                <th>총 결제 금액</th>
                <td>
                    <input type="hidden" name="productPrice" 
                        value="${(order.productPrice - order.discount) *  buyAmount}">
                    <h5 style="margin-top: 6px; margin-bottom: 0;"><script type="text/javascript">
                        var money = Number($("[name=productPrice]").val()) + Number($("[name=deliveryMoney]").val());
                        document.write(Number(money).toLocaleString() + " 원");
                    </script></h5>
                    <!-- <fmt:formatNumber value="${order.productPrice - order.discount}" pattern="#,###" /> -->
                </td>
            </tr>
        </table>
    </div>
    <div class="container mt-5 mb-5">
        <div><h3>결제방법</h3></div>
        <div class="top-line" style="border-bottom: 1px solid rgb(172, 172, 172);">
            <div class="d-flex flex-column">
                <div class="m-2">
                    <input type="radio" name="pay" id="kakaopay" value="kakaopay">
                    <label for="kakaopay">kakaoPay</label>    
                </div>
                <div class="m-2">
                    <input type="radio" name="pay" id="naver" value="naver">
                    <label for="naver">네이버페이</label>
                </div>
                <div class="m-2">
                    <input type="radio" name="pay" id="card" value="card">
                    <label for="card">신용카드</label>
                </div>
                <div class="m-2">
                    <input type="radio" name="pay" id="trans" value="trans">
                    <label for="trans">계좌이체</label>
                </div>
            </div>      
        </div>
    </div>
    <input type="hidden">
</div>
<div class="d-flex justify-content-center flex-column mt-5 text-center" style="margin: 0px 400px;">
    <div>위 주문 내용을 확인하였으며 결제에 동의합니다.</div>
    <button class="buy-btn mt-3" onclick = "requestPay()"  style="width: 40%; margin-left: 160px;">결제하기</button>
</div>

<input type = "hidden" id = "productName" value = "${order.productName}">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp79379003");

    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        var productName = $("#productName").val(); // 제품이름
        var productPrice = $("[name=productPrice]").val(); // 제품가격
        var pay_method = $('input[name=pay]:checked').val(); // 결제방식 체크 확인
        
        var checked_pay = $("input[name='pay']:checked").val();
        console.log('checked_pay :>> ', checked_pay);
        if(pay_method === undefined)
        {
            alert("결제방법을 선택해 주세요");
            return;
        } 
        
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: checked_pay,
            merchant_uid: "ORD20180131-0000011",
            name: productName,
            amount: productPrice,
            buyer_email: "animal1234@naver.com",
            buyer_name: "Animal & Pet",
            buyer_tel: "1588-9868",
            buyer_addr: "광주 광역시 북구 중흥 1동 경양로 170",
            buyer_postcode: "01181"
        }, 
        function (rsp) { 
            // callback
            if (rsp.success) {
                // 결제 성공 시 로직,
                console.log('rsp.success :>> ', rsp.success);

            } else {
                // 결제 실패 시 로직,
            }
      });
    }
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />