<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">비밀번호 찾기</h1>
        </div>
    </div>
    <div class="container">
		<div class="col-12 col-sm-3">
	                            <label for="name">이름</label> <input type="text" class="form-control"
								name="name" placeholder="등록한 이름" id="name"/>
		</div>
		<br>
		<div class="col-12 col-sm-3">
	                            <label for="id">아이디</label> <input type="text" class="form-control"
								name="아이디" placeholder="아이디" id="id" />
		</div>
		<br>
		<div class="col-12 col-sm-3">
	                            <label for="email">이메일</label> <input type="text" class="form-control"
								name="email" placeholder="등록한 이메일" id="email" onkeydown="if(event.keyCode==13) javascript:chkData()" />
		</div>
		<br>
		<button type="button" class="btn btn-primary w-30 py-8" onclick="chkData()">비밀번호 변경</button>
		</div>
		
		<div class="container">
			<div class="newPass" style="display:none;">
			<hr>
				<label for="password">변경할 비밀번호</label>
				<div class="col-3">
					<input type="password" class="form-control" placeholder="변경할 비밀번호" id="newPass"/>
					<br>
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="newPass_confirm"
					 onkeydown="if(event.keyCode==13) javascript:changePass()"/>
				</div>
				<br>
					<button type="button" onclick="changePass()" class="btn btn-primary w-50 py-6" id="bt">변경</button>
			</div>
			<div class=".show" style="display:none;"></div>
		</div>
<script>

var account = {};

	function chkData() {
		var name = $('#name').val();
		var id = $('#id').val();
		var email = $('#email').val();

		if (name != "" && email != "" && id != "") {
			$.ajax({
				url : "/login/findData",
				data : {
					name : name,
					id : id,
					email : email
				},
				success : function(rst) {
					if (rst) {
						account = rst;
						$('.newPass').css('display', 'inline');
					} else {
						alert("입력한 값에 일치하는 정보가 없습니다.");
					}
				}
			});
		} else {
			alert('이름, 아이디 혹은 이메일이 입력되지않았습니다.');
		}
	}
	
	function changePass(){
		if ($("#newPass").val() != $("#newPass_confirm").val()) {
			alert("비밀번호 불일치");
			$("#newPass_confirm").focus();
			return false;
		}
		
		var userPass = $("#newPass").val();
		console.log(account.userId);
		$.ajax({
			url : "/login/changePass",
			data : {
				userPass : userPass,
				userId : account.userId
			},
			success: function(rst){
				if(rst == 1){
					alert("비밀번호변경완료");
					document.location.href="/login";
				}else{
					alert("비밀번호변경실패");
				}
			},error:function(){
				alert("에러입니다.");
			}
		});
		
	}
</script>
    
<jsp:include page="/WEB-INF/views/include/footer.jsp" />