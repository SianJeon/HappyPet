<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<title>insert 페이지</title>
<style>
input, textarea, button {
	padding: 5px;
}

a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}

.btn_add,.btn_turn{
	background-color:#B78D65;
	color:#FFFFFF;
	padding: 5px;
}
.h3{ 
	margin-top:10px; 
	margin-bottom:10px;
	border-bottom: 1px solid;
	margin-bottom: 30px;
}
.text_tb{margin-top: 10px; margin-left: 20px;}
</style>
<meta charset="UTF-8">
	<div class="container">
			<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
			</div>
			<form method="post" action="/freeboard/detail/update">
				<div class="text_tb" >
					<input type="text" name="writer" placeholder="작성자"
						style="width: 40%" required value="${dbVo.writer }"/>
				</div>
				<div class="text_tb" >
					<input type="text" name="title" class="form-control"
						placeholder="글제목" style="width: 82%" required value="${dbVo.title }"/>
				</div>
				<div class="text_tb">
					<textarea rows="10" name="content" placeholder="글내용"
						style="width: 100%; resize:none" required>${dbVo.content }</textarea>
				</div>
				<div class="text_tb">
					<input type="hidden" name="no" value="${dbVo.no}">
					<button class="btn_add" type="submit">수정</button>
					<button class="btn_turn" type="button" onClick="location.href='/freeboard/list'">취소</button>
				</div>
			</form>
	</div>
	<script>
	
	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>