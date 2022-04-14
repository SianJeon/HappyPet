<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<style>
.modify {margin-top: 6px;}
/* .modify textarea{width: calc(100% - 20px); height: 110%; resize: none;} */

.modify textarea{width: 50%;
    height: 130%;
    border: none;
    resize: none;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<c:forEach items="${comments }" var="comments" varStatus="status">
${status.index eq 0 ? '<hr>' : ''}
	<div data-id="${comments.no }">
		<div>
			<span>${comments.writer } [ ${comments.writedate } ]</span>
			<span>
				<c:if test="${loginUser.userId eq comments.writer }">
				<button type="button" class='btn btn-primary py-1 px-2 btn-modify-save'>수정</button>
				<button type="button" class='btn btn-danger py-1 px-2 btn-delete-cancel'>삭제</button>
				</c:if>
			</span>
		</div>
		<div class='original'>${fn: replace(fn: replace(comments.content, lf, '<br>'), crlf, '<br>') }</div>
		<div class='modify'></div>
	</div>
	<hr>
</c:forEach>
</div>
<script>

$('.btn-delete-cancel').on('click', function(){
	var $div = $(this).closest('div').parent('div');
	var no = $div.data('id');
	if($(this).text()=='취소'){
		display($div, true);
	}else{
		if(confirm('정말 삭제합니까?')){
			$.ajax({
				//'comment/delete.bo/'+$div.data('id')
				url: '/hospital/reviewComment/delete?no=' + no,
				success: function(){
					comment_list();
				}, error:function(req,text){
			         alert(text+':'+req.status);
			    }
			});
		}
	}
});

$('.btn-modify-save').on('click', function(){
	
	var $div = $(this).closest('div').parent('div');
	var no = $div.data('id');
	
	if($(this).text()=='수정'){
		$div.children('.modify').css('height', $div.children('.original').height()-6);
		
		var tag = '<textarea>' + $div.children('.original').html().replace(/<br>/g,'\n') + '</textarea>';
		
		$div.children('.modify').html( tag );
		$div.children('.modify').children('textarea').focus();
		
		display($div, false);	
	}else{
		var content = $div.children('.modify').children('textarea').val();
		/* var comment = new Object();
		comment.id =  $div.data('id');
		comment.content = $div.children('.modify').children('textarea').val(); */
		$.ajax({
			url: '/hospital/reviewComment/modify?no=' + no + '&content=' + content,
			success: function( response){
				alert("변경저장");
				comment_list();
			}, error:function(req,text){
		         alert(text+':'+req.status);
		    }
		});
	}
});

function display(div, status){
	div.find('.btn-modify-save').text(status ? '수정' : '저장');
	div.find('.btn-delete-cancel').text(status ? '삭제' : '취소');
	div.children('.original').css('display', status ? 'block' : 'none');
	div.children('.modify').css('display', status ? 'none' : 'block');
}

</script>

</body>
</html>