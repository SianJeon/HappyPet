<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">아이디 찾기</h1>
        </div>
    </div>
 <div class="container">
	<div class="col-12 col-sm-3">
                            <label for="name">이름</label> <input type="text" class="form-control"
							name="name" placeholder="등록한 이름" id="name" onkeydown="if(event.keyCode==13) javascript:focusNext()" />
	</div>
	<br>
	<div class="col-12 col-sm-3">
                            <label for="email">이메일</label> <input type="text" class="form-control"
							name="email" placeholder="등록한 이메일" id="email" onkeydown="if(event.keyCode==13) javascript:findId()"/>
	</div>
	<br>
	<button type="button" class="btn btn-primary w-30 py-8" id="find" onclick="findId()">아이디 찾기</button>
	
	<br>
	<div class="dd" style="display:none;">
		<div class="showId" style=" padding: 5%;"></div>
		<div id="buttons">
			<a type="button" class="btn btn-primary w-30 py-8" href="/login">로그인화면</a>
			<a type="button" class="btn btn-primary w-30 py-8" href="/forgetPw">비밀번호 찾기</a>
		</div>
	</div>
</div>
<script>
	function focusNext(){
		$('#email').focus();
	}
			function findId(){
				var name = $('#name').val();
				var email = $('#email').val();
				var tag = "";
				if(name != "" && email != ""){
					$.ajax({
						url : "/login/findId",
						data :{ name: name, email: email},
						success: function(rst){
							if(rst != ""){
								tag += "<div>" + name + "님의 아이디는<br><div style=' font-weight:900; padding: 5%; width:25px; height: 25px;'>"+ rst + "</div><br>입니다</div>";
								$('#buttons').css('display','inline');
							}else{
								$('#buttons').css('display','none');
								tag += "입력한 정보로 등록된 아이디가 없습니다.";
							}
							$('.dd').css('display','inline');
							$('.showId').html(tag);
						}
					});
				}else{
					alert('이름 혹은 이메일이 입력되지않았습니다.');
				}
				
			}
		
		
		</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />