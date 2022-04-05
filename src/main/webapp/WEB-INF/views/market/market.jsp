<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.searchOption
{
    margin-top: 10px;
    margin-bottom: 10px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgb(168, 168, 168);
}
</style>

    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">마켓</h1>
            <nav aria-label="breadcrumb animated slideInDown">
               <%-- <h4 class="btn btn-primary py-3 px-5 animated slideInLeft">안쓰고싶으면 쓰지마세요</h4> --%>
            </nav>
        </div>
    </div>
    
    <%-- 메인 컨텐트 --%>
    <!-- side Bar -->
     <div class="container-fluid py-5 row">
        <div class = "col-2 d-flex flex-column">
            <div class = "searchOption dropdown">
                <button class="btn bt-primary dropdown-toggle" data-toggle = "dropdown">브랜드</button>
            </div>
            <div class = "searchOption">
                <button class="btn bt-primary dropdown-toggle" data-toggle = "dropdown">사료</button>
            </div>
            <div class = "searchOption">
                <button class="btn bt-primary dropdown-toggle" data-toggle = "dropdown">간식</button>
            </div>
            <div class = "searchOption">
                <button class="btn bt-primary dropdown-toggle" data-toggle = "dropdown">위생</button>
            </div>
            <div class = "searchOption">
                <button class="btn bt-primary dropdown-toggle" data-toggle = "dropdown">의류 / 악세서리</button>
            </div>
        </div>
        <div class = "col-10">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title">애완동물 상품</h4>
            </div>
            <div class="row g-0 team-items">
                <%-- 반복 --%>
                <c:forEach items="${vo}" var="vo">
                <div class="col-lg-3 col-md-6 wow" data-wow-delay="0.1s">
                    <div class="team-item position-relative" style=" cursor: pointer;" 
                            onclick="location.href='market/product?no=${vo.no}'">
                        <div class="position-relative">
                            <img class="img-fluid" src="${vo.mainPath}" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <h5 class="mt-2">${vo.productName}</h5>
                            <span class="text-primary float-left">${vo.productPrice} 원</span><br>
                            <span class="text-primary">${vo.company}</span>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        </div>
        
    </div>
    <!-- Team End -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />