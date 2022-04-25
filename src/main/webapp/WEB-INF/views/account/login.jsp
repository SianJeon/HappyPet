<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">로그인</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            
            </nav>
        </div>
    </div> 
    <div class="container">
    
				<form action="/session" method="post" autocomplete="off">
					<c:if test="${not empty err }">
						<div class = "alert alert-danger">
							아이디나 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<div class="col-12 col-sm-6">
                            <label for="id">아이디</label> <input type="text" class="form-control"
							name="loginId" placeholder="계정 아이디" id="id" />
                    </div>
                    <div class="col-12 col-sm-6">
                           <label for="pwd">비밀번호</label> <input type="password"
							class="form-control" placeholder="계정 비밀번호" id="pwd"
							name="loginPass" />
                    </div>
                    <hr class="col-12 col-sm-6">
                    <p><a href="/signup" class="text-info">계정이 없습니다</a></p>
                    <p class="text-info"><a href="/forgetId">아이디가 생각나지 않습니다?</a></p>
					<p class="text-info"><a href="/forgetPw">비밀번호가 생각나지 않습니다?</a></p>
				
					<hr class="col-12 col-sm-6">
				
					<button class="btn btn-primary w-50 py-6"type="submit" style="margin: 0 25%;">로그인</button>
				</form>
            </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
