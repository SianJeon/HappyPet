<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/views/include/top.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<h1>회원가입페이지</h1>

<form:form action="/signup" method="post" autocomplete="off"
				onsubmit="return valid_form();" modelAttribute="accountVo">
				<div class="form-group">
					<label for="id">아이디</label>
					<form:input type="text" class="form-control" path="userId"
						placeholder="사용할 아이디" id="id" />
					<b> <form:errors path="userId" />
					</b>
					<input type="button" onclick="chkId()" value="중복확인">
				</div>
				<div class="form-group">
					<label for="pwd">비밀번호</label>
					<form:input type="password" class="form-control"
						placeholder="사용할 비밀번호" id="pwd" path="userPass" />
				</div>
				<div class="form-group">
					<label for="pwd_confirm">비밀번호 재확인</label> <input type="password"
						class="form-control" placeholder="비밀번호 재확인" id="pwd_confirm">
				</div>
				<div class="form-group">
					<label for="name">사용자 이름</label>
					<form:input type="text" class="form-control" placeholder="사용자 이름"
						id="name" path="userName" />
					<b> <form:errors path="userName" />
					</b>
				</div>
				<div class="form-group">
					<label for="zipcode">주소</label>
					<div class="form-row">
						<div class="col-3">
							<form:input type="text" class="form-control" placeholder="우편번호"
								id="zipcode" path="zipcode" />
						</div>
						<div><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></div>
						<div class="col-9">
							<form:input type="text" class="form-control" placeholder="상세주소"
								path="address" id="address" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<form:input type="email" class="form-control" path="email"
						placeholder="등록할 이메일" id="email" />
				</div>
				<button type="submit" class="btn btn-primary btn-block mt-5">가입</button>
			</form:form>
			
<script>
	function valid_form() {
		if ($("#id").val().length >= 4) {
			$("#id").addClass("is-valid"); // removeClass
		}
		if ($("#pwd").val() != $("#pwd_confirm").val()) {
			$("#pwd_confirm").addClass("is-invalid");
			$("#pwd_confirm").focus();
			return false;
		}
	}
	
	function chkId(){
		var id = $('#id').val();
		
		$.ajax({
			url : 'signup/chkId',
			type : 'POST',
			data : {id:id},
			success : function(cnt){
				if(cnt != 1){
					alert("사용가능한 아이디입니다.");
				}else{
					alert("이미 사용중인 아이디입니다.");
				}
			},error : function(){
				alert("에러입니다.");
			}
		});
	}
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = roadAddr;
            }
        }).open();
	}

</script>
<jsp:include page="/WEB-INF/views/include/bottom.jsp" />