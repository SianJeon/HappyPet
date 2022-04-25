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
                            <img src="./likeimg/gg.jpg" style="width:80px;height: 80px; border-radius: 50%" alt="Icon">
                        </div>
                        <a href="step"><h3 class="mb-3" style="color: black; font-weight: bold; font-size: 50px;">Adopt Step</h3></a>
                        
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                             <img src="./likeimg/ff.jpg	" style="width:80px;height: 80px; border-radius: 50%" alt="Icon">
                        </div>
                        <h3 class="mb-3" style="color: black; font-weight: bold; font-size: 50px; " >Shopping</h3>
                        
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                    	<img src="./likeimg/dd.jpg" style="width:80px;height: 80px; border-radius: 50%" alt="Icon">
                        </div>
                        <a href="/hospital"><h3 class="mb-3 " style="color: black; font-weight: bold; font-size: 50px;">Hospital Location</h3></a>
                        
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
                        <img class="img-fluid" src="./likeimg/ee.jpg" style="width: 370;height: 350;" alt="">
                        <img class="img-fluid" src="./likeimg/zz.jpg" style="width: 370;height: 350;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h4 class="section-title">아이들을 보살펴 주세요.</h4>
                    <h1 class="display-5 mb-4" style="color: black ;"> Promiss </h1>
                    <p>한 번 이상의 이별을 겪은</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이들의 평생을 함께해야 하는 약속</p>
                    <p class="mb-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이들의 손을 잡아주세요</p>
                    <div class="d-flex align-items-center mb-5">
                        <div class="d-flex flex-shrink-0 align-items-center justify-content-center border border-5 border-primary" style="width: 160px; height: 120px;">
                            <%-- 유기동물 카운트 el작성 --%>
                            <h1 class="display-1 mb-n2" data-toggle="counter-up" id="total"></h1>
                        </div>
                        
                        <script type="text/javascript">
                        
                      	  total()
                        
                        	function total(){
                        		
                        		$.ajax({
                        			
                        			url: "/animal/total"
                        			
                        		}).done(function(rst){
                        			
                        			$("#total").text(rst);
                        		})
                        		
                        		
                        	}
                        
                        </script>
                        
                        <div class="ps-4">
                            <h3>마리</h3>
                            <h3 class="mb-0">입양 준비중 입니다.</h3>
                        </div>
                    </div>
                    <a class="btn btn-primary py-3 px-5" href="/animal">입양 보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />