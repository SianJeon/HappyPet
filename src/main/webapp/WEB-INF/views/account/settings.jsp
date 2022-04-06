<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<h5>프로필 사진 변경</h5>
<form action="/settings/profile" method="post" autocomplete="off" enctype="multipart/form-data">
	<div>
		<c:choose>
			<c:when test="${empty loginUser.profile }">
				<img src="/profiles/default-profile.png"
					class="mx-auto rounded d-block" style="width: 180px; height:180px" id="profile"/>
				<label class="text-info">권장 이미지 파일의 크기는 180 X 180 px 입니다.</label>
			</c:when>
			<c:otherwise>
				<img src="/profiles/${loginUser.profile }"
					class="mx-auto rounded d-block" style="width: 180px; height:180px" id="profile"/>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="custom-file">
		<input type="file" class="custom-file-input" id="customFile"
			accept="image/*" name="attach"> <label class="custom-file-label"
			for="customFile">파일 선택</label>
	</div>
	<button type="submit" class="btn btn-secondary btn-block mt-2" id="bt">변경</button>
</form>
<script>
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profile").attr("src", e.target.result);
				}
		
				reader.readAsDataURL(this.files[0]);
			});
	$("#profile").on("click", function(){
		$("#customFile").click();
	})
</script>
<h5>개인정보 변경</h5>
<form action="/settings/modify" method="post" autocomplete="off">
	<div class="form-group">
		<label for="zipcode">주소</label>
		<div class="form-row">
			<div class="col-3">
				<input type="text" class="form-control" placeholder="우편번호"
					id="zipcode" name="zipcode" value="${loginUser.zipcode }" />
			</div>
			<div><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></div>
			<div class="col-9">
				<input type="text" class="form-control" placeholder="상세주소"
					name="address" id="address" value="${loginUser.address }" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="email">이메일</label> <input type="email"
			class="form-control" name="email" value="${loginUser.email }"
			placeholder="등록할 이메일" id="email" />
	</div>
	<button type="submit" class="btn btn-secondary btn-block mt-2" id="bt">변경</button>
</form>
<h5>비밀번호 변경</h5>
<div>
	<label for="password">현재 비밀번호 확인</label>
	<div class="col-3">
		<input type="password" class="form-control" placeholder="현재 비밀번호" id="userPass"/>
		<input type="button" onclick="passChk()" value="비밀번호 확인">
	</div>
	<div class="newPass" style="display:none;">
	<hr>
		<label for="password">변경할 비밀번호</label>
		<div class="col-3">
			<input type="password" class="form-control" placeholder="변경할 비밀번호" id="newPass"/>
			<input type="password" class="form-control" placeholder="비밀번호 확인" id="newPass_confirm"/>
		</div>
			<button type="button" onclick="changePass()" class="btn btn-secondary btn-block mt-2" id="bt">변경</button>
	</div>
</div>

<script>
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
						alert("비밀번호확인");
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