<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Animal & Pet은 여러분의 유기동물 입양을 최대한 도와드립니다.</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Teko:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <img class="position-absolute top-50 start-50 translate-middle" src="img/icons/icon-1.png" alt="Icon">
    </div>
    <!-- Spinner End -->
    <c:choose>
				<c:when test="${!empty sessionScope.loginUser }">
    <div class="container-fluid bg-dark p-0 wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-3">
                    <a class="text-body px-2" href=""><i class="fa fa-user-alt text-primary me-2"></i>${loginUser.userName } 님</a>
                    <a class="text-body px-2" href=""><i class="fa fa-envelope-open text-primary me-2"></i>${loginUser.email }</a>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center py-3 me-2">
                    <a class="text-body px-2" href="/mypage">myPage</a>
                </div>
            </div>
        </div>
    </div>
    </c:when>
	</c:choose>

    <!-- Navbar Start -->

    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="/" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0"><img class="me-3" src="/img/logo.png" alt="Icon">Animal & Pet</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <%-- 네비게이션  --%>
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/" class="nav-item nav-link active">Home</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">입양</a>
                    <div class="dropdown-menu border-0 m-0">
                        <a href="" class="dropdown-item"></a>
                        <a href="" class="dropdown-item">알아서</a>
                        <a href="" class="dropdown-item">넣으세요</a>
                    </div>
                </div>    
                <a href="" class="nav-item nav-link">자유게시판</a>
                <a href="/hospital" class="nav-item nav-link">주변병원</a>
                <a href="" class="nav-item nav-link">마켓</a>
            </div>
            <c:choose>
				<c:when test="${empty sessionScope.loginUser }">
           			 <a href="/login" class="btn btn-primary py-2 px-4 d-none d-lg-block">로그인</a>
           		</c:when>
				<c:otherwise>
					 <a href="/logout" class="btn btn-primary py-2 px-4 d-none d-lg-block">로그아웃</a>
				</c:otherwise>
			</c:choose>
        </div>
    </nav>
    <!-- Navbar End -->