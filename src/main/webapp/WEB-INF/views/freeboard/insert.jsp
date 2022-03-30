<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
<meta charset="UTF-8">
<body>
	<div class="container">
		<div style="border-bottom: 1px solid; margin-bottom: 30px;">
			<h2>
				자유게시판 <small>| 글쓰기</small>
			</h2>
			<p style="margin-left: 20px;">
				<a href="/freeboard/list">글목록</a>
			</p>
		</div>
		<div style="margin-left: 20px;">
			<form method="post">
				<div style="margin-top: 10px;">
					<input type="text" name="writer" placeholder="작성자"
						style="width: 40%" />
						<label for="searchType"  class="hidden">카테고리 선택:</label>
						<select id="searchType" name="category" title="검색유형 선택">
							<option value="b-1">자유게시판</option>
							<option value="b_2">자유게시판2</option>
							<option value="b_3">자유게시판3</option>
						</select>
				</div>
				<div style="margin-top: 10px;">
					<input type="text" name="title" class="form-control"
						placeholder="글제목" style="width: 82%" />
				</div>
				<div style="margin-top: 10px;">
					<textarea rows="10" name="content" placeholder="글내용"
						style="width: 82%;"></textarea>
				</div>
				<div style="margin-top: 10px;">
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>