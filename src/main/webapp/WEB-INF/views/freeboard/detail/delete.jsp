<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<style>
.h3{
	margin-top:10px;
	margin-bottom:10px;
	border-bottom: 1px solid;
}
#pw_form{
	width: 394px;
    height: 165px;
    padding-top: 48px;
    border: 3px solid #b78d65;
    background: #fff;
}
.inner{
	display: block;
    font-size: 15px;
    
    text-align: center;
}
.pw_input{
	margin-top: 10px;
    background: #f3f3f3;
    border: 1px solid #cecdce;
}
.btn_box{margin-top:10px;}

button{
	background-color:#B78D65;
	color:#FFFFFF;
}
</style>
<title>delete pass certification</title>
<div class="container">
		<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
		</div>
		<form id="pw_form" method="post" action="/freeboard/detail/delete" >
			<input type="hidden" name="no" value="${no }"/>
			<div class="inner">
			<b class="txt">비밀번호를 입력하세요</b><br>
			<input class="pw_input" id="pw" name="pw" type="password" title="비밀번호 입력">
			<div class="btn_box">
				<button type="button" id="btn_del" >확인</button>
				<button type="button" onclick="javascript:history.back();">취소</button>
			</div>
			</div>
		</form>
</div>
<script>

document.getElementById("btn_del").onclick = function() {
	if(confirm("정말 삭제하시겠습니까?")) {
		document.getElementById("pw_form").submit();
	}else {
		
	}

};

</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
