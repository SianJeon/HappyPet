<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.searchOption
{
    margin-top: 10px;
    margin-bottom: 10px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgb(168, 168, 168);
}
.container-paging { margin-top : 40px; }
.reset-Category 
{
    margin : 5px;  border: 1px solid rgb(255, 255, 255); 
    border-radius: 15px; padding: 5px 10px 5px 10px;
    background-color: #FFF3F6; color: rgb(255, 66, 92);
    /* width: ; */
    
}
.searchbox {}
.refresh-img {width: 18px; height: 18px; margin-bottom: 3px; padding-left: 5px;}
</style>

    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">마켓</h1>
            <nav aria-label="breadcrumb animated slideInDown">
               <%-- <h4 class="btn btn-primary py-3 px-5 animated slideInLeft">안쓰고싶으면 쓰지마세요</h4> --%>
            </nav>
        </div>
    </div>
    </form>
    <%-- 메인 컨텐트 --%>
    <!-- side Bar -->
    <div class="container-fluid py-5 row">
        <div class = "col-2 d-flex flex-column">
            <form action="/market" id = "brandFrom">
                <input type="hidden" name="page" value="${param.page}">
                <div class="searchOption-nav d-flex justify-content-between">
                    <div class="mt-2" style="font-size : 1.4em; font-weight: bold;">검색 옵션</div>
                    <a class="reset-Category" href="/market?page=1">초기화<img class="refresh-img" src="/images/refresh.png" alt=""></a>
                </div>
            <div class="container p-0 pb-2 pt-2" style="border-bottom: 1px solid rgb(168, 168, 168);">
                <button type="button" class="btn bt-primary dropdown-toggle" 
                        data-toggle="collapse" data-target="#company">브랜드</button>
                <div id="company" class="collapse">
                <input type="hidden" id="companylen" value = "${fn:length(company)}">
                <c:forEach items="${company}" var="vo" varStatus = "i">
                    <div class="d-flex mt-3">
                    <c:choose>
                        <c:when test="${i.index < 5}">
                        <div class = "company_check_container_${i.index}">
                            <input type="checkbox" value="${vo.company}" ${brand.contains(vo.company) ? 'checked' : ''}
                                name="brand" id="company_${i.index}" style = "margin : 5px;">
                            <label for="company_${i.index}">${vo.company}</label>(${vo.count})
                        </div>
                        </c:when>
    
                        <c:otherwise>
                        <div class = "company_check_container_${i.index}" style = "display : none;">
                            <input type="checkbox" name="brand" value="${vo.company}" ${brand.contains(vo.company) ? 'checked' : ''}
                            id="company_${i.index}" style = "margin : 5px;">
                            <label for="company_${i.index}">${vo.company}</label>(${vo.count})
                        </div>
                        </c:otherwise>
                    </c:choose>
                    </div>
                </c:forEach>
                <button type="button" class="btn bt-primary dropdown-toggle" onclick = "viewMore()">더보기</button>
                </div>
            </div>
            </form>
            <c:forEach begin = "0" end = "3" varStatus = "i">
            <form action="/market" id = "category_${i.index}">
            <input type="hidden" name="page" value="${param.page}">
            <div class="container p-0 pb-2 pt-2 category_${i.index}" style="border-bottom: 1px solid rgb(175, 159, 159);">
                <button type="button" class="btn">
                <input type="hidden" value=
                            "${i.index == 0 ?'feed' : 
                              i.index == 1 ?'snack' : 
                              i.index == 2 ?'hygiene' : 
                              i.index == 3 ?'clothing' : ''}" name = "category">
                <script>
                var value = "";
                    switch (${i.index}) {
                        case 0: value = "사료"; break;
                        case 1: value = "간식"; break;
                        case 2: value = "위생"; break;
                        case 3: value = "의류 / 악세서리"; break;
                    }    
                    document.write(value);
                </script>
                </button>
            </div>
            </form>
            </c:forEach>
        </div>
        <div class = "col-10">
        <div class="container">
            <div class="mb-5 wow fadeInUp d-flex justify-content-between" data-wow-delay="0.1s">
            <h2 class="section-title">애완동물 상품</h2>
            <div class="searchbox">
                <form>
                    <input type="text" name="" id="">
                    <button><i class="fa fa-search"></i></button>
                </form>
            </div>
            </div>
            <div class="row g-0 team-items">
                <%-- 반복 --%>
                <c:forEach items="${vo}" var= "vo">
                <div class="col-lg-3 col-md-6 wow" data-wow-delay="0.1s">
                    <div class="team-item position-relative" style=" cursor: pointer;" 
                            onclick="location.href='/market/product?no=${vo.no}'">
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
        <div class="container container-paging d-flex justify-content-center">
          <div class="row">
				<div class="col">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">이전</a></li>
                        <c:forEach begin = "0" end = "${pageCount}" varStatus = "i">
    						<li class="page-item ">
                                <a class="page-link pagingNumber_${i.count}" 
                                href="javascript:paging(${i.count})">${i.count}</a>
                            </li>
                        </c:forEach>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</div>
			</div>
		</div>
    </div>
    </div>
<script>
    $(document).ready(function () {
        var page = $("[name=page]").val();
        $(".pagingNumber_" + page).parent().addClass("active");

        
    });

    function paging(i)
    {
        var params = location.search.substring(location.search.indexOf('&', 0), location.search.length);
        location.href = "/market?page=" + i + (location.search.indexOf('&', 0) == -1 ? '' : params);
    }

    $("[name=brand]").click(function(){
        $("#brandFrom").submit();
    });

    $(".category_0").click(function (e) { 
        $("#category_0").submit();
    });
    $(".category_1").click(function (e) { 
        $("#category_1").submit();
    });
    $(".category_2").click(function (e) { 
        $("#category_2").submit();                        
    });
    $(".category_3").click(function (e) { 
        $("#category_3").submit();
    });

    function viewMore()
    {
        var display = 0;
        var len = $("#companylen").val();
        for(var i = 0; i < len; i++)
        {
            var brand = $(".company_check_container_" + i).css("display");
            if(brand != "block") 
            {
                display++;
                $(".company_check_container_" + i).css("display", "block");
                if(display == 5) return;
            }
        }
    }
    

</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />