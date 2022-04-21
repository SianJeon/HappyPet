<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
#write {
	text-align: right;
	padding-right: 100px;
}

.col-lg-3{
	 margin-left: 100px;
	 margin-right: 20px;
}
.like{
	width: 30px;
	height: 30px;

}
.jjim{
	text-align: right;
	
}

.card-title{
	text-align: center;
	
}




</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row align-items-start" id="sub"></div>
	</div>
		
		

	<div class="container">
		<div class="row align-items-start" id="sub1">	
		
		</div>
	</div>
	
	
	<c:if test="${loginUser.userId != null  }">
		<div id="write">
			<button type="button" class="btn btn-secondary"
				onclick="location.href='/write'">글쓰기</button>
		</div>
	</c:if>


	<script>
	
	
		review();

		
		function review(page) {
			if(page == null){
				
				page = 1; 
					
			}
			page = page;
			$
					.ajax({

						url : "animal/review",
						data:{
						
							"page" : page
							
							
						}
						
					})
					.done(
							function(rst) {
								
								var tag = "";	
								var dex = "";
								
								
								for (var i = 0; i < rst.datas.length; i++) {
									tag += '<div class="col">';
									tag += "<div class='col-lg-3 p-3'>";
									tag += "<div class='card' style='width:400px'>";
									tag += "<a href='animal/reviewdetail?no="
											+ rst.datas[i].no
											+ "'><img class='card-img-top' src='/download?no="
											+ rst.datas[i].no
											+ "' alt='Card image' style='height:300px'></a>";
									tag += "<div class='card-body' style='padding-bottom:0px '>";
									tag += "<p class='card-title'>"
											+ rst.datas[i].title + "<div class='jjim' id='jjim"+rst.datas[i].no+"'><div id='de"+rst.datas[i].no+"'><a href='javascript:like("+rst.datas[i].no+");'><img class='like' src='./likeimg/3.png'></a></div></div><div id='cnt"+rst.datas[i].no+"' style='text-align: right;'><small></small></div></p>";
											
									
									tag += "</div>";
									tag += "</div>";
									tag += "</div>";
									tag += "</div>";
									
									
									likeselect(rst.datas[i].no);
								}
								
								for(var i =rst.paging.beginBlock; i<=rst.paging.endBlock ;i++){
									
									
									
										
										dex += "<a href='#' onclick='review("+i+")' style='text-align:center;'>"+i+"</a>"
										
									
								}

									
									
								$("#sub1").html(dex);
								$("#sub").html(tag);

							});

		}
		
		
		//좋아
		
		function valid(){
			
			let login = "${loginUser}";
			
			if(login == ""){
				
				alert("로그인 후 사용");
				return false;
			}
			
			
		}
		
		
		function likeupdate(boardno){
			
			if( JSON.parse('${empty loginUser}')){
				
				alert("로그인 후 사용 가능");
				return;
			}
				
			$.ajax({
				url : "likeupdate",
				data:{
					
					"boardno" : boardno
					
				}
				
				
			}).done(function(rst){
			
				console.log(rst);
				refreshMemList();
			})
			
			
			
		}
		
		function refreshMemList(){
			location.reload();
		}
	
		 function likeselect(boardno){
			
			
			$.ajax({
				url:"likeselect",
				data:{
					
					"boardno": boardno
					
				}
			
				
			}).done(function(rst){
				var tag ="";
				
				console.log(rst);
		
				if(rst.likeCheck == 1 && rst.boardno == boardno) {
					
					$('#de'+rst.boardno).remove();
					
						
					tag += "<div id='seq"+rst.boardno+"'><a href='javascript:likeupdate("+rst.boardno+")'><img class='like' src='./likeimg/4.png'></div></a>";
					
					
					
					$("#jjim"+rst.boardno).html(tag);
					$("#cnt"+rst.boardno).text("("+rst.cnt+")");
					
				} 

		
				 	
			})
		}  
		
		
		
		
		
		
		function like(no){
			
				valid()
			
			var boardno = '';
			var memberno ='${loginUser.userId}';
			
			$.ajax({
				
				url :"like",
				data:{
					
					"boardno" : no,
					"memberno" : memberno
					
				}
				
				
			}).done(function(rst){
			
				refreshMemList();
			
			})
			
		}
		
		
		
		
	</script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>