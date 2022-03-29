<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-fluid p-3 bg-dark text-white">
		<h1 onclick="location.href='/'">프로젝트</h1>
		<p>Spring MVC 기반의 웹 어플리케이션</p>
	</div>
	<c:choose>
		<c:when test="${empty sessionScope.loginUser }">
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<ul class="navbar-nav">
					<li class="nav-item ${empty nav ? 'active' : '' }"><a
						class="nav-link" href="/">홈</a></li>
					<li class="nav-item ${nav eq 'sign' ? 'active' : '' }"><a
						class="nav-link" href="/login">로그인</a></li>
					<li><a class="nav-link" href="/signup">회원가입</a></li>
				</ul>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item ${empty nav ? 'active' : '' }"><a
						class="nav-link" href="/">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/mypage">내정보</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout" style="background-color: red; color: white; border-radius:10px;">로그아웃</a></li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>