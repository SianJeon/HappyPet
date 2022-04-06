<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<div class="row g-12" style="margin: 0 25%;">
	<h5>회원탈퇴</h5>
	
	<div class="col-12 col-sm-6">
		<input type="password" class="form-control" placeholder="현재 비밀번호" id="userPass"/>
		<br>
		<input type="button"class="btn btn-primary w-50 py-8" onclick="passChk()" value="비밀번호 확인">
	</div>
	<form action="/settings/delete" method="post" autocomplete="off" class="delete" style="display:none;">
	<hr>
		<h6>정말로 회원 탈퇴하시겠습니까?</h6>
		<button type="submit" class="btn btn-danger w-100 py-6" id="bt">회원탈퇴</button>
	</form>	
</div> 

<script>
	function passChk(){
		var userPass = $("#userPass").val();
		$.ajax({
			url : "/settings/passChk",
			type : "POST",
			data : {
				userPass : userPass
			},
			success: function(rst){
				if(rst == 1){
					$('.delete').css('display','inline');
				}else{
					alert("비밀번호 불일치");
				}
			},error:function(){
				alert("에러입니다.");
			}
		});
	}
</script>
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />