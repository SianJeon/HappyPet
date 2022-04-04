<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
<div style="margin: 0 25%;">
	<h5>프로필 사진 변경</h5>
<form action="/settings/profile" method="post" autocomplete="off" enctype="multipart/form-data" >
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
	<br>
	<div class="custom-file">
		<input type="file" class="custom-file-input" id="customFile"
			accept="image/*" name="attach" style="margin-left:35%;">
	</div>
		<br>
		<button type="submit" class="btn btn-primary w-100 py-6" id="bt" >변경</button>
</form>
</div>
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
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />