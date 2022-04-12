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
									console.log(rst);
								
								for (var i = 0; i < rst.datas.length; i++) {
									tag += '<div class="col">';
									tag += "<div class='col-lg-3 p-3'>";
									tag += "<div class='card' style='width:400px'>";
									tag += "<a href='animal/reviewdetail?no="
											+ rst.datas[i].no
											+ "'><img class='card-img-top' src='/download?no="
											+ rst.datas[i].no
											+ "' alt='Card image'><a>";
									tag += "<div class='card-body'>";
									tag += "<p class='card-title'>"
											+ rst.datas[i].title + "</p>";
									tag += "</div>";
									tag += "</div>";
									tag += "</div>";
									tag += "</div>";
									
								}
								
								for(var i =rst.paging.beginBlock; i<=rst.paging.endBlock ;i++){
									
									
									
										
										dex += "<a href='#' onclick='review("+i+")'>"+i+"</a>"
										
									
								}

									
									
								$("#sub1").html(dex);
								$("#sub").html(tag);

							});

		}
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>