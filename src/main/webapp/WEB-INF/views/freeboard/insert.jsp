<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
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
.board_btn{
	background-color:#FFFFFF;
	color:#B78D65;
	border: 1px solid #FFFFFF;
}
.board_btn:hover{color:#786450;}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}

.btn_add, .btn_turn {
	background-color: #B78D65;
	color: #FFFFFF;
	padding: 5px;
	border: 1px solid #cecdce;
}

.h3 {
	margin-top: 10px;
	margin-bottom: 10px;
}

.bottom_btn *:hover {
	background:linear-gradient(to bottom, #c49f7c 10%, #c49f7c 100%);
	background-color:#c49f7c;
}
.bottom_btn *:active {
	position:relative;
	top:1px;
}
</style>
<meta charset="UTF-8">
<div class="container">
	<div style="border-bottom: 1px solid; margin-bottom: 30px;">
		<div class="h3">
		<button class="board_btn" type="button" onclick="button_click1();">자유게시판</button>
	</div>
	</div>
<script>
	function button_click1(){
		history.go(-1);
	}
</script>
	<div style="margin-left: 20px;">
		<form method="post" enctype="multipart/form-data">
			<div style="margin-top: 10px;">
				<input type="text" name="writer" placeholder="작성자"
					style="width: 25%; height:30px " required /> &nbsp&nbsp&nbsp<input type="text" name="pw"
					placeholder="비밀번호" style="width:25%; height:30px;" required />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="title" class="form-control"
					placeholder="제목을 입력해 주세요" style="width: 80%; height:30px;" required />
			</div>
			
			
			<div style="margin-top: 10px;">
				<textarea rows="10" name="content" placeholder="글내용"
					style="width: 100%; resize: none;" required></textarea>
			</div>
			<!-- 지금 짜고 있는 코드 사이드바 메뉴(사진첨부/파일첨부 등등..) -->
			<div style="margin-top: 10px;">
				<input type="file" class="file_border" name="file" multiple="multiple">			
			</div>
			<div class="bottom_btn" style="margin-top: 10px; text-align: right;">
				<button class="btn_add" type="submit">등록</button>
				<button class="btn_turn" type="button"
					onClick="location.href='/freeboard/list'">취소</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />