<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/freeboard/include/header.jsp"/>
<title>HAPPY PET FREEBOARD WRITING</title>
<style type="text/css">
a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

.btn_wrap{
	margin-top: 10px;
}
#btn_mot,#btn_del,#btn_lis{
	padding: 5px;
	background-color:#B78D65;
	color:#FFFFFF;
}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}
.h3{
	margin-top:10px;
	margin-bottom:0px;
	border-bottom: 2px solid;
}


.view_sm{
	border-bottom: 1px solid; 
	margin-bottom: 30px;
	background-color: #f9f9f9;
	text-align: center;
}
.board_tb{
	margin-left: 20px; width: 80%;
}
</style>
	<div class="container">
		<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
		</div>
		<div class="view_sm" >
			
			<h4 class="one_title">${one.title }</h4>
			<p style="font-size: small;">
				작성자: ${one.writer } | &nbsp; &nbsp;
				등록일: <fmt:formatDate value="${one.writedate }"
					pattern="yyyy.MM.dd hh:mm:ss" /> | &nbsp; &nbsp; 
				조회수: ${one.hit } 
			</p>
		</div>
		<div class="board_tb">
			
			<p style="min-height: 300px; white-space: break-spaces"><c:out value="${one.content}" /></p>
			</div>
		<div class="btn_wrap">
			<a class="btn" id="btn_mot" href="/freeboard/detail/modify">수정</a>
			<a class="btn" id="btn_del" href="/freeboard/detail/delete">삭제</a>
			<a class="btn" id="btn_lis" href="/freeboard/list">목록</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/freeboard/include/footer.jsp"/>