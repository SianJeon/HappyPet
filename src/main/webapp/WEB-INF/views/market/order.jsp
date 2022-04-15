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
<div style = "border: 1px solid rgb(172, 172, 172); margin-left: 50px; margin-right: 50px;">
    <div class = "container ml-4 mr-4 row" style = "margin-left : 60px;">
        <div style="border-bottom: 2px solid; margin-top : 40px;"><h3>배송정보</h3></div>
        <div class="col-6">
            <div class="mt-5 express-container">
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">받는사람</span>
                    <span><input type="text" class="form-control buy-input buyer-name" placeholder="받는 사람"
                            style="margin-left: 31px;" value="${loginUser.userName}"></span>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">휴대전화</span>
                    <span><input type="text" class="form-control buy-input buyer-phone" placeholder="전화번호"
                            style="margin-left: 31px;"></span>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text" style="padding-top : 30px;">배송지 주소</span>
                    <span class = "">
                        <div class = "d-flex flex-row">
                            <input type="text" class="form-control buy-input buyer-zipcode" placeholder="우편번호" id ="zipcode"
                                style="margin-left: 12.5px; width: 128px;" value="${loginUser.zipcode}">
                            <button type = "button" onclick ="DaumPostcode()"  class="btn-adress">우편번호검색</button>
                        </div>
                    </span>
                </div>
                <div class = "d-flex flex-column">
                    <div class = "col-4 mt-3">
                        <div><input type="text" class="form-control buy-input buyer-addr" id = "address"
                            style="margin-left: 168px; width: 257px;" placeholder="주소를 입력하세요"
                            value="${loginUser.address}"></div>
                    </div>
                    <div class="mt-3">
                        <div><input type="text" class="form-control buy-input buyer-detailAddr" 
                            style="margin-left: 168px; width: 257px;" placeholder="상세 주소를 입력하세요">
                        </div>
                    </div>
                </div>
                <div class = "d-flex flex-row mt-3">
                    <span class="input-text">배송 요청사항</span>
                    <span><input type="text" class="form-control buy-input" placeholder="요청사항"
                            style="width: 257px;"></span>
                </div>
            </div>
        </div>
        <div class="col-6" style="padding-left: 50px;">
            <div class="mt-5 text-center" style="width: 400px;"><h2>${order.productName}</h2></div>
            <img src="${order.mainPath}" alt="" style="width : 400px;">
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
    <c:choose>
        <c:when test="${!empty vo}">
        <div class="container d-flex flex-column mt-2">
            <c:forEach items="${vo}" var="vo">
            <div class = "d-flex flex-row">
            <div>
                <img src="${vo.mainPath}" alt="" style = "width : 120px">
            </div>
            <div class = "container row">
                <div class="col-10 d-flex flex-column mr-3 mt-3">
                     <div class="m-2" style="font-size: 22px;">
                        ${vo.productName}
                    </div>
                    <div class = "m-2 d-flex flex-row">
                        <div>수량 : </div>
                        <div style = "padding-left : 10px;">${vo.buyAmount} 개</div>
                    </div>
                </div>                
            </div>
                <div class = "col-2 text-center pt-3 mt-3">
                    <div class = "d-flex flex-row">
                        <span>정가 : </span>
                        <h4 style="padding-left: 10px;"><fmt:formatNumber value="${vo.productPrice}" pattern="#,###" /></h4>
                    </div> 
                    <c:if test="${vo.discount != 0}" >
                    <div class="d-flex flex-row">
                        <span>할인가 :</span>
                        <h4 style="color: tomato; padding-left: 10px;"><fmt:formatNumber value="${vo.discountPrice}" pattern="#,###" /></h4>
                    </div>
                    </c:if>
                </div>
            </div>
            </c:forEach>
        </div>
        </c:when>
        
        <c:otherwise>
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
                <c:if test="${order.discount != 0}" >
                <div class="d-flex flex-row">
                    <span>할인가 :</span>
                     <h4 style="color: tomato; padding-left: 10px;">
                        <fmt:formatNumber value="${order.productPrice - order.discount}" pattern="#,###" />
                    </h4>
                </div>
                </c:if>
            </div>
        </div>
        </c:otherwise>
    </c:choose>
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
                    <img src="/img/icons/kakaopayCI.png" alt="" style="width: 60px;">
                    <label for="kakaopay">kakaoPay</label>    
                </div>
                <div class="m-2">
                    <input type="radio" name="pay" id="naver" value="naver">
                    <img src="/img/icons/naverpayCI.png" alt="" style="width: 60px;">
                    <label for="naver">네이버페이</label>
                </div>
                <div class="m-2">
                    <input type="radio" name="pay" id="card" value="card">
                    <img src="/img/icons/card.png" alt="" style="width: 40px;">
                    <label for="card">신용카드</label>
                </div>
                <div class="m-2">
                    <i`put type="radio" name="pay" id="trans" value="trans">
                    <img src="/img/icons/vbank.png" alt="" style="width: 40px;">
                    <label for="trans">계좌이체</label>
                </div>
            </div>      
        </div>
    </div>
    <input type="hidden">
</div>
<div class="d-flex justify-content-center flex-column mt-5 text-center" style="margin: 0px 400px;">
    <div>위 주문 내용을 확인하였으며 결제에 동의합니다.</div>
    <button class="buy-btn mt-3" onclick = "requestPay()"  style="width: 40%; margin-left: 180px;">결제하기</button>
    <!-- <button class="buy-btn mt-3" onclick = "()"  style="width: 40%; margin-left: 180px;">결제하기</button> -->
</div>

<input type = "hidden" id = "productName" value = "${order.productName}">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<%-- daum 우편번호찾기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var response;
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
        var buyerEmail = "<c:out value ='${loginUser.email}' />";
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: checked_pay,
            merchant_uid: "mexrchant_" + new Date().getTime(),
            name: productName,
            amount: 100,
            buyer_email: buyerEmail,
            buyer_name: $(".buyer-name").val(),
            buyer_tel: "010-5056-1757",
            buyer_addr: $(".buyer-addr").val() + " " + $(".buyer-detailAddr").val(),
            buyer_postcode: $(".buyer-zipcode").val(),
            custom_data : test()
        }, 
        function (rsp) { 
            $.ajax({
                type: "post",
                url: "/market/Checkedvaild/" + rsp.imp_uid,
                success: function (data) {
                    console.log('data :>> ', data);
                    
                    if(rsp.paid_amount == data.response.amount)
                    {
                        alert("결제 및 결제검증 완료");
                    }
                    else
                    {
                        alert("결제 실패");
                    }
                },
                error : function(req, text)
                {
                    console.log(req + " : " + text);
                }
            });
            console.log('rsp :>> ', rsp);
            // callback
            if (rsp.success) {
                
                console.log('rsp.status :>> ', rsp.status);
                // 결제 성공 시 로직,
                 $.ajax({
                    type: "post",
                    url: "/market/orderSuccess",
                    data: rsp,
                    success: function (response) {
                        console.log('response :>> ', response);
                    }
                });

            } else {
                // 결제 실패 시 로직,
                console.log('fail :>> 결제 실패 ');
            }
      });
    }

    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = roadAddr;
            }
        }).open();
	}

    function SetCustom_data(){
        var temp =  new Array();
        for (let i = 0; i < 10; i++) {
            var data =  new Object();

            data.no = i;
            data.name = ("애견패드" + i);

            temp.push(data);
        }
        var json = JSON.stringify(temp);
        return json;
    }
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />