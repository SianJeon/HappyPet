<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/freeboard/include/header.jsp" />
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
.sidebar{
    display: flex;
  	align-items: center; /* Vertical */
  	justify-content: left; /* Horizontal */
  	background: #f8f8f8;
    border: 1px solid #fff;
    padding: 0 0 0 7px;
    height: 28px;
}
ul li {list-style:none; float:left; margin-left:10px;}
.sidebar_left{
	padding-left:0px;
	margin-bottom:0px;
}
</style>
<meta charset="UTF-8">
<div class="container">
	<div style="border-bottom: 1px solid; margin-bottom: 30px;">
		<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
		</div>
	</div>
	<div style="margin-left: 20px;">
		<form method="post">
			<div style="margin-top: 10px;">
				<input type="text" name="writer" placeholder="작성자"
					style="width: 25%; height:30px " required /> &nbsp&nbsp&nbsp<input type="text" name="pw"
					placeholder="비밀번호" style="width:25%; height:30px;" required />
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="title" class="form-control"
					placeholder="제목을 입력해 주세요" style="width: 80%; height:30px;" required />
			</div>
			
			<!-- 지금 짜고 있는 코드 사이드바 메뉴(사진첨부/파일첨부 등등..) -->
			<div style="margin-top: 10px;">
			<div class="sidebar" style="border: 1px solid">
				<ul class="sidebar_left">
					<li>
						<div unselectable="on" id="tx_file">
						<a href="#" title="파일" class="tx-text">파일</a>
						</div>
					</li>
					<li>하세요</li>
					<li>!!</li>
					<li>?!!</li>
					<li>wow</li>
				</ul>
			</div>
				<textarea rows="10" name="content" placeholder="글내용"
					style="width: 100%; resize: none;" required></textarea>
			</div>
			<div style="margin-top: 10px; text-align: right;">
				<button class="btn_add" type="submit">등록</button>
				<button class="btn_turn" type="button"
					onClick="location.href='/freeboard/list'">취소</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/freeboard/include/footer.jsp" />