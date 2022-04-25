<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <div class="row g-12" style="margin: 0 25%;">
	<h5>비밀번호 변경</h5>
	<div>
		<label for="password">현재 비밀번호 확인</label>
		<div class="col-12 col-sm-6">
			<input type="password" class="form-control" placeholder="현재 비밀번호" id="userPass"/>
			<br>
			<input type="button"class="btn btn-primary w-50 py-6" onclick="passChk()" value="비밀번호 확인">
		</div>
	<div class="newPass" style="display:none;">
		<hr>
			<label for="password">변경할 비밀번호</label>
			<div class="col-3">
				<input type="password" class="form-control" placeholder="변경할 비밀번호" id="newPass"/>
				<br>
				<input type="password" class="form-control" placeholder="비밀번호 확인" id="newPass_confirm"/>
			</div>
			<br>
				<button type="button" onclick="changePass()" class="btn btn-primary w-50 py-6" id="bt">변경</button>
		</div>
	</div>
</div> 
<script >
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
				$('.newPass').css('display','inline');
			}else{
				alert("비밀번호 불일치");
			}
		},error:function(){
			alert("에러입니다.");
		}
	});
}

function changePass(){
	if ($("#newPass").val() != $("#newPass_confirm").val()) {
		alert("비밀번호 불일치");
		$("#newPass_confirm").focus();
		return false;
	}
	
	var userPass = $("#newPass").val();
	
	$.ajax({
		url : "/settings/changePass",
		type : "POST",
		data : {
			userPass : userPass
		},
		success: function(rst){
			if(rst == 1){
				alert("비밀번호변경완료");
				$('.newPass').css('display','none');
			}else{
				alert("비밀번호변경실패");
			}
		},error:function(){
			alert("에러입니다.");
		}
	});
	
}
</script>
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />