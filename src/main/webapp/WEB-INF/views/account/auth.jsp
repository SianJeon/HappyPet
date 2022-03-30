<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<h5>이메일 인증 <small>| ${loginUser.email }</small></h5>

<c:choose>
	<c:when test="${empty loginUser.email }">
		<div class="alert alert-danger">
			<strong>인증불가!</strong> 먼저 당신의 계정에 이메일 주소를 등록해주십시요.
		</div>
	</c:when>
	<c:when test="${loginUser.auth eq 'Y'}">
		<div class="alert alert-info">
			<strong>인증불가!</strong> 당신의 이메일 계정은 이미 인증을 받았습니다.
		</div>
	</c:when>
	<c:otherwise>
		<button type="button" class="btn btn-secondary mb-2" id="req">인증키 발송</button>
		<label id="req_result"></label>
		<form action="/settings/verify" method="post" autocomplete="off">
			<div class="form-group">
				<label for="zipcode">인증코드</label> <input type="text"
					class="form-control" name="key" placeholder="전송받은 인증키 입력"
					id="email" />
			</div>
			<div class="form-group">
				<select class="form-control" id="sel1" name="sellist1"
					style="display: none;">
				</select>
			</div>
			<button type="submit" class="btn btn-primary btn-block mt-2"
				id="bt" >인증</button>
		</form>
		<script>
			$("#req").on("click", function(){
				$("#req").prop("disabled", true);
				$.ajax({
					url : "/settings/reqAuth",
					async : false
				}).done(function(obj){
					if(obj.rst) {
						$("#req_result").html("등록된 이메일로 인증키가 발송되었습니다.");
						$("#req_result").addClass("text-success");
					}else {
						$("#req_result").html("인증키 발송에 문제가 발생하였습니다. 다시 시도해주세요.");
						$("#req_result").addClass("text-danger");
						$("#req").prop("disabled", false);
					}
					
				});
				
			});
		
		
		</script>
	</c:otherwise>
</c:choose>
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />