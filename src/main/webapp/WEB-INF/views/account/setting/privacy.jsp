<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <div class="row g-12" style="margin: 0 25%;">
	<h5>개인정보 변경</h5>
	<form action="/settings/modify" method="post" autocomplete="off">
		<div class="col-12 col-sm-8">
			<label for="zipcode">주소</label>
			<div class="form-row">
				<div class="col-12 col-sm-6">
					<input type="text" class="form-control" placeholder="우편번호"
						id="zipcode" name="zipcode" value="${loginUser.zipcode }" />
					<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-primary w-40 py-8" value="우편번호 찾기">
				</div>
				<br>
				<div class="col-12 col-sm-6">
					<input type="text" class="form-control" placeholder="상세주소"
						name="address" id="address" value="${loginUser.address }" />
				</div>
			</div>
		</div>
		<br>
		<div class="col-12 col-sm-6">
			<label for="email">이메일</label> 
			<input type="email" class="form-control" name="email" value="${loginUser.email }"
				placeholder="등록할 이메일" id="email" />
        </div>
		<br>
		<button type="submit" class="btn btn-primary w-100 py-6" id="bt">변경</button>
	</form>
</div> 
<script >
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
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />