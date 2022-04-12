<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container py-5">
		<h2 class="display-1 text-white animated slideInDown">
			${data.title }</h2>
		${data.writer } <br>
		<fmt:formatDate value="${data.writedate }"
			pattern="yyyy.MM.dd hh:mm:ss" />
	</div>
</div>
<div class="container">
	<div style="min-height: 300px; white-space: break-spaces" class="pt-5">${data.content}</div>
	<c:choose>
		<c:when test="${loginUser.userId == data.writer }">
			<a class="btn btn-primary py-2 px-3"
				href="/hospital/reviewUpdate?no=${data.no }">수정</a>
			<a class="btn btn-danger py-2 px-3"
				href="/hospital/deleteReview?no=${data.no }">삭제</a>
		</c:when>
	</c:choose>

	<hr>
	<div class="comment">
		<div id="comment_regist">
			<div class='head'>
				<span><strong>댓글작성</strong></span>
			</div>
			<textarea id="comment" cols="50" rows="4"></textarea>
			<div>
				<a class='btn btn-primary py-1 px-2' onclick="comment_regist()">저장</a>
			</div>
		</div>
		<div id='comment_list' class='text-left'></div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	   comment_list();
	});

//댓글저장
function comment_regist(){
	if( JSON.parse('${empty loginUser}') ){
		alert('댓글을 저장하려면 로그인하세요!');
		return;
	}else if( $('#comment').val()=='' ){
		alert('댓글을 입력하세요!');
		$('#comment').focus();
		return;
	}
	$.ajax({
		url: '/hospital/reviewComment/insert',
		data : { owner:'${data.no}', content:$('#comment').val() },
		success: function( response ){
			if( JSON.parse(response) ){
				alert('댓글이 저장되었습니다');
				$('#comment').val('');
				comment_list();
			}else{
				alert('댓글 등록 실패!');
			}
			
		},error: function(req,text){
			alert(text+':'+req.status);
		}
	});
	
}
	function comment_list(){
		   $.ajax({
		      url:'/hospital/reviewComment/list?owner=' + ${data.no} ,
		      success: function(response){
		    	  console.log(response);
		         $('#comment_list').html(response);
		         
		      },error:function(req,text){
		         alert(text+':'+req.status);
		      }
		   });
		}
	

</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />