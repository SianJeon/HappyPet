<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-3 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">myPage</p></h1>
            <nav aria-label="breadcrumb animated slideInDown">
               <h4 class="btn btn-primary py-2 px-3 animated slideInLeft"><a href="/settings/profiles" style="color: white;">프로필 사진 변경</a></h4>
               <h4 class="btn btn-primary py-2 px-3 animated slideInLeft"><a href="/settings/privacy" style="color: white;">개인정보 변경</a></h4>
               <h4 class="btn btn-primary py-2 px-3 animated slideInLeft"><a href="/settings/password" style="color: white;">비밀번호 변경</a></h4>
               <h4 class="btn btn-primary py-2 px-3 animated slideInLeft"><a href="/settings/auth" style="color: white;">메일인증</a></h4>
               <h4 class="btn btn-danger py-2 px-3 animated slideInLeft"><a href="/settings/deleteView" style="color: white;">회원탈퇴</a></h4>
            </nav>
        </div>
    </div>
			