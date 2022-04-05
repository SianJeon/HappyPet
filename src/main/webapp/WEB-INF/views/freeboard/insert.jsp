<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/freeboard/include/header.jsp"/>
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

.btn_add{
	background-color:#B78D65;
	color:#FFFFFF;
	padding: 5px;
}
.h3{ margin-top:10px; margin-bottom:10px;}
</style>
<meta charset="UTF-8">
	<div class="container">
		<div style="border-bottom: 1px solid; margin-bottom: 30px;">
			<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
			</div>
			<p style="margin-left: 20px;">
				<a href="/freeboard/list">글목록</a>
			</p>
		</div>
		<div style="margin-left: 20px;">
			<form method="post">
				<div style="margin-top: 10px;">
					<input type="text" name="writer" placeholder="작성자"
						style="width: 40%" required />
				</div>
				<div style="margin-top: 10px;">
					<input type="text" name="title" class="form-control"
						placeholder="글제목" style="width: 82%" required/>
				</div>
				<div style="margin-top: 10px;">
					<textarea rows="10" name="content" placeholder="글내용"
						style="width: 82%;" required></textarea>
				</div>
				<div style="margin-top: 10px;">
					<button class="btn_add" type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/freeboard/include/footer.jsp"/>