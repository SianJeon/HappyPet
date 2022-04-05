<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">Adopt Animals<p>Adopt Family</p></h1>
            <nav aria-label="breadcrumb animated slideInDown">
               <h4 class="btn btn-primary py-3 px-5 animated slideInLeft">Animal & Pet은 사지 않고 입양하는 문화를 만듭니다.</h4>
            </nav>
        </div>
    </div>

    <!-- Facts Start -->
    <div class="container-xxl py-5">
        <div class="container pt-5">
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/img/icons/icon-2.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">입양이 어쩌고저쩌고</h3>
                        <p class="mb-0">내용을 막 적고</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/img/icons/icon-3.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">하고싶은말 막 적은뒤에</h3>
                        <p class="mb-0">뭐라고 막적으면됨</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/img/icons/icon-4.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">아시겠죠 </h3>
                        <p class="mb-0">개 쉽졍?</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Facts End -->


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img">
                        <img class="img-fluid" src="/img/about-1.jpg" alt="">
                        <img class="img-fluid" src="/img/about-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h4 class="section-title">입양 절차를 막 적어도됨</h4>
                    <h1 class="display-5 mb-4">이렇게 이렇게 하시구오</h1>
                    <p>많은 내용을 막 길게 적으면 ~~~~~~~~~~~~</p>
                    <p class="mb-4">여기에 본문이 들어가게 됩니다</p>
                    <div class="d-flex align-items-center mb-5">
                        <div class="d-flex flex-shrink-0 align-items-center justify-content-center border border-5 border-primary" style="width: 140px; height: 120px;">
                            <%-- 유기동물 카운트 el작성 --%>
                            <h1 class="display-1 mb-n2" data-toggle="counter-up">1234</h1>
                        </div>
                        <div class="ps-4">
                            <h3>마리</h3>
                            <h3 class="mb-0">입양 준비중 입니다.</h3>
                        </div>
                    </div>
                    <a class="btn btn-primary py-3 px-5" href="">입양 보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />