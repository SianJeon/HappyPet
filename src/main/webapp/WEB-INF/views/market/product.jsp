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
.btn-detail 
{
    padding-top: 8px;
    text-align: center;
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
.QnABoard
{
    width: 93%;
    margin-left: 60px;
    margin-right: 60px;
}

</style>

<div style="border-bottom: 2px solid crimson;"></div>
<form action = "/market/order" method = "">
<div class = "container-fluid row">
<input type="hidden" name="no" value="${vo.no}">
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
                            <button type ="button" class="btn-count minus">-</button>
                            <input class="text-center btn-count buy-count" type="text" 
                                    value="1" name = "buyAmount" style="width: 85px; ">
                            <button type ="button" class="btn-count plus">+</button>
                            <span class="purchase-Price" style="float:right; font-size : 22px;">
                               <fmt:formatNumber value="${vo.productPrice - vo.discount}" pattern="#,###" />
                                </span>
                        </div>
                    </div>
                    <%-- 카트 --%>
                    <input type = "hidden" value = "${loginUser.userId}" name = "accountId">
                    <input type = "hidden" value = "${vo.no}" name = "productNo">
                    <div class="container-fluid row stop-dragging mt-3 p-0" 
                        style="margin-left: 0; margin-right: 0;">
                        <div class="btn-cart col-6">
                            <button type="button" onclick="addCart()" 
                            data-toggle = "modal" data-target="#cartModal">장바구니 담기</button>
                        </div>
                        <input type = "hidden" value = "" name = "">
                        <div class="btn-buy col-6">
                            <button>바로 구매</button>
                        </div>
                    </form>
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
    
    <!-- <canvas id = "canvas"></canvas> -->
    <div class = "d-flex justify-content-center detailImg">
        <!-- <div style="height: 600px;"> -->
        <img src="${vo.detailImgPath}" alt="" class = "" style="width : 500px; overflow: hidden;">
        </div>
    </div>
    <!-- <div class="d-flex justify-content-center stop-dragging">
        <div class = "btn-detail">상품 상세 더보기</div>                                                                                                                                                                        
    </div> -->
    
    <%-- Q & A --%>
    <div class = "QnABoard container-fluid mr-5 ml-5">
        <div class = "d-flex justify-content-between">
            <div><h3>질문 / 답변</h3></div>
            <div><Button>더 보기</Button></div>
        </div>
        <%-- market QnA  --%>
        <%-- <c:if test="${marketQnA ne null}" > --%>
            <div class="" style = "border: 1px solid #d1d1d1; border-top: 3px solid black;">
                <ul style="padding-top: 20px; padding-bottom: 20px;">
                    <li>질문</li>
                    <li>이거 개봉후 언제까지 먹어요?</li>
                    <li>답변</li>
                    <li>보관 상태에 따라 다르며, 정해져 있는 기간은 없습니다, 개봉 후에는 가급적 빠른 시일 내에 급여해주시고, 밀봉....</li>
                </ul>
            </div>
        <%-- </c:if> --%>
    </div>

    <%-- 구매후기 --%>
    <div class = "QnABoard container-fluid mr-5 ml-5 mt-5">
       <div class = "d-flex justify-content-between">
            <div><h3>구매 후기</h3></div>
            <div><a href = "/market/review">더 보기</a></div>
        </div>
        
        <div class="" style = "border-bottom: 1px solid #d1d1d1; border-top: 3px solid black;">
            <div class = "row">
                
            </div>
            <div class = "">
                
            </div>
        </div>
    </div>
    
    <div class = "QnABoard container-fluid mr-5 ml-5 mt-5">
       <div class = "d-flex justify-content-between">
            <div><h3>구매 후기</h3></div>
            <div><Button>더 보기</Button></div>
        </div>
        
        <div class="" style = "border-bottom: 1px solid #d1d1d1; border-top: 3px solid black;">
            <div class = "col-10">
                        <div class = "d-flex">
                            <div><img src="/img/logo.png" alt=""></div>
                            <div class="d-flex flex-column">
                                <div>
                                    <span>별점</span>
                                    <span>날짜</span>
                                    <span>날짜</span>
                                </div>
                                <div>
                                    <span>이름</span>
                                    <span>이름</span>
                                    <span>이름</span>
                                    <span>이름</span>
                                </div>
                            </div>
                        </div>
                        <div>
                            text-Comment
                        </div>
                    </div>
                <div class = "col-2">
                    <div style = "cursor: pointer;">
                        <i class="fa-thin fa-thumbs-up">좋아용</i>
                    </div>
                </div>
            </div>
            <div class = "">
                ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
            </div>
        </div>
    </div>

    <div class = "QnABoard container-fluid mr-5 ml-5 mt-5">
        <div class = "d-flex justify-content-between" >
            <div><h3>취소/교환/반품 안내</h3></div>
            <div><Button>더 보기</Button></div>
        </div>
        <div class = "" data-toggle="modal" data-target="#myModal"
                style = " cursor: pointer; border-bottom: 1px solid #d1d1d1; border-top: 3px solid black;">
            <strong>취소</strong>
            <ul>
                <li> 입금하신 상품은 '입금대기, 입금완료' 단계에서만 취소가 가능합니다.</li>
                <li>전체 주문 중 일부 상품의 부분취소는 불가능합니다.</li>
            </ul>
        </div>
        <div class="cancelInfo">
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">취소 / 교환 / 반품 안내</h4>
                            <button type="button" style = "board : 0px" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="cancelInfo">
                                <strong>취소</strong>
                                <ul>
                                    <li> 입금하신 상품은 '입금대기, 입금완료' 단계에서만 취소가 가능합니다.</li>
                                    <li>전체 주문 중 일부 상품의 부분취소는 불가능합니다.</li>
                                </ul>
                            </div>
                            <div class="swapInfo">
                                <strong>교환/반품</strong>
                                    <ul>
                                        <li>교환 및 반품은 배송완료일 기준으로 7일 이내 가능합니다.</li>
                                        <li>교환하려는 상품은 처음 배송한 택배사에서 수거하므로 다른 택배사 이용은 불가능합니다.
                                        <li>업체배송 상품은 제공 업체와 상품에 따라 배송비가 다르고, 
                                            상품의 도착지가 처음 발송한 주소와 다를 수 있으므로 고객센터(1588-2469)로 
                                            먼저 연락주시기 바랍니다.</li>
                                    </ul>
                                </div>
                            <div class="swapImpossibleInfo">
                                    <strong>교환/반품이 불가능한 경우</strong>
                                    <ul>
                                        <li>반품 요청기간이 지난 경우</li>
                                        <li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
                                        <li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
                                        <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우</li>
                                        <li>상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 현저히 감소한 경우</li>
                                        <li>구성품을 분실하였거나 고객님의 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
                                    </ul>
                                <div class="swapDeliveryInfo">
                                    <strong>교환/반품 배송비</strong>
                                    <ul>
                                        <li>상품의 불량 또는 파손, 오배송의 경우에는 배송비를 강아지대통령에서 부담합니다.</li>
                                        <li>단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
                                        <li>제주, 산간지역은 추가 배송비가 발생할 수 있습니다.</li>
                                        <li>업체배송 상품은 제공업체에 따라 교환/반품 배송비가 다를 수 있으므로 고객센터로 문의하시기 바랍니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




<input type="hidden" name="price" value = "${vo.productPrice - vo.discount}">
<input type="hidden" name="detailImg" value = "${vo.detailImgPath}">
<script>
    
    var oldVal;
    $(".buy-count").on("propertychange change keyup paste input", function() {
        var currentVal = $(this).val();
        if(currentVal == oldVal) {
            return;
        }
        oldVal = currentVal;

        var price = $("[name=price]").val();
        $(".purchase-Price").val(
            Number(Number(price) * $(".buy-count").val()).toLocaleString()
        );
    });
    

    $(".plus").click(function (e) { 
        var currentVal = $(".buy-count").val();

        $(".buy-count").val(++currentVal);
            
        var price = $("[name=price]").val();

        $(".purchase-Price").text(
            Number(Number(price) * currentVal).toLocaleString()
        );
    });
    $(".minus").click(function (e) { 
        var currentVal = $(".buy-count").val();
        if(currentVal == 1) return;

        $(".buy-count").val(--currentVal);

        var price = $("[name=price]").val();
        $(".purchase-Price").text(
            Number(Number(price) * currentVal).toLocaleString()
        );
    }); 
    var scrollHeight; 
    var firstLoad = false;
    $(window).scroll(function(event){ 
        scrollHeight = $(document).scrollTop();
        
        if(scrollHeight < 660) $("#footer-buy").css("position", "relative");
        else $("#footer-buy").css("position", "sticky");
    });

    $(function () {
        $(".customer-buyNotice").click(function (e) { 
            $(".toast").css("display", "inline-block");
            $(".toast").toast("show");            
        });
    });
    $(".closed").click(function (e) { 
        console.log('e :>> ', e);
        $(".toast").css("display", "none");
        $(".toast").toast("hide");            
        
    });

    function addCart()
    {
        if($("[name=accountId]").val() == '' || $("[name=accountId]").val() == null) return;

        var vo = 
        {
            accountNo : $("[name=accountId]").val(),
            productNo : $("[name=productNo]").val(),
            buyAmount : $("[name=buyAmount]").val()
        };

        $.ajax({
            url: "/market/addCart",
            data: vo,
            success: function (response) {
                console.log('response :>> ', response);
                if(response)
                {
                    alert("장바구니에 담겼습니다.");
                }
                else alert("장바구니에 존재합니다 수량을 추가합니다.");

            }
        });

    }
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<%-- sticky --%>
<div id = "footer-buy" class="row d-flex justify-content-center text-center 
                    wow" data-wow-delay="0.1s">
    <div class="col-4">
        <div class="pt-2">
            <span style="padding-right: 12px;">수량</span>
            <button type ="button" class="btn-count minus">-</button>
            <input id = "" class="text-center btn-count buy-count" type="text" 
                    value="1" style="width: 85px; ">
            <button type ="button" class="btn-count plus">+</button>
        </div>
    </div>
    <div class="col-4" style="padding-top: 14px;">
        <span class="purchase-Price" style="font-size : 18px;"> 
            <span style="font-family : inherit;">총 상품금액 : </span>
            <fmt:formatNumber value="${vo.productPrice - vo.discount}" pattern="#,###" />
        </span>
    </div>
    <div class="col-4" style="padding-top: 8px;">
        <span><button type="button" onclick="addCart()" class = "btn-footerCart">장바구니 담기</button></span>
        <span><button class = "btn-footerBuy">바로 구매</button></span>
    </div>
</div>