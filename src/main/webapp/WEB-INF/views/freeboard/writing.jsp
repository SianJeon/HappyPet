<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAPPY PET FREEBOARD WRITING</title>
<style type="text/css">
a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

button {
	padding: 5px;
}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="container">
		<div style="border-bottom: 1px solid; margin-bottom: 30px;">
			<h2>
				자유게시판 <small>| 글보기</small>
			</h2>
			<p style="margin-left: 20px;">
				<a href="/freeboard/list">글목록</a> | <a href="/freeboard/insert">글작성</a>
			</p>
		</div>
		
		<div style="margin-left: 20px; width: 80%">
			<h4>${one.title }</h4>
			<p style="font-size: small;">
				${one.writer } |
				<fmt:formatDate value="${one.writedate }"
					pattern="yyyy.MM.dd hh:mm:ss" />
			</p>
			<p style="min-height: 300px; white-space: break-spaces"><c:out value="${one.content}" /></p>
			<div style="margin-top: 10px;">
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>
