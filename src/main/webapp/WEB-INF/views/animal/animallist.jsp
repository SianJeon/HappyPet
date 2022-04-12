<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.img-fluid {
	height: 15rem;
}

.d-flex {
	display: flex;
	justify-content: space-evenly
}

#fo {
	
}

.category{
	text-align: right;
	padding-right: 80px;

}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<div class="col category">
		<select id="category" name="category">
			<option value=417000>강아지</option>
			<option value=422400>고양이</option>
			<option value=429900>기타</option>


		</select>

	</div>


	<div class="container">
		<div class="row" id="anView">
		
		</div>
	</div>




	<script type="text/javascript">
		function anList(no) {
			var tag = "";

			$
					.ajax({
						url : "/animal/list",

						data : {

							"pageNo" : no
						}

					})
					.done(
							function(rst) {

								for (var i = 0; i < rst.length; i++) {

									if (rst[i].processState == "보호중") {

										tag += "<div class='col-lg-3 p-3'>"
										tag += "<div class='card '>"
										tag += "<a href='/animal/detail?desertionNo="
												+ rst[i].desertionNo
												+ "'><img class='card-img-top img-fluid' src="+rst[i].popfile+"><a>"
										tag += "<div class='card-body'>"
										tag += "<h5 class='card-title' >"
												+ rst[i].kindCd + "</h4>"
										tag += "<h5 class='card-title' >"
												+ rst[i].age + "</h4>"
										tag += "<h5 class='card-title' >"
												+ rst[i].weight + "</h4>"
										tag += "<p class='card-text' >"
												+ rst[i].specialMark + "</p>"
										tag += "</div>"
										tag += "</div>"
										tag += "</div>"

									}
								}

								$("#anView").html(tag);
							})

		}

		anList(1);
		
		
		$(document).on('change','#category',function(){
			
			$('#col-lg-3').remove();
			var upkind = $("#category").val();
					
			
			$.ajax({
				
				url: "/animal/cho",
				
				data:{
					"upkind" : upkind
					
				}
				
				
				
			}).done(function(rst){
				
				var tag="";
				
				for (var i = 0; i < rst.length; i++) {

					if (rst[i].processState == "보호중") {
				
						tag += "<div class='col-lg-3 p-3'>"
						tag += "<div class='card '>"
						tag += "<a href='/animal/detail?desertionNo="
								+ rst[i].desertionNo
								+ "'><img class='card-img-top img-fluid' src="+rst[i].popfile+"><a>"
						tag += "<div class='card-body'>"
						tag += "<h5 class='card-title' >"
								+ rst[i].kindCd + "</h4>"
						tag += "<h5 class='card-title' >"
								+ rst[i].age + "</h4>"
						tag += "<h5 class='card-title' >"
								+ rst[i].weight + "</h4>"
						tag += "<p class='card-text' >"
								+ rst[i].specialMark + "</p>"
						tag += "</div>"
						tag += "</div>"
						tag += "</div>"


					}
				}
				
				$("#anView").html(tag);
				
			})
			
			
		});
		
	</script>


	<div class="container">
		<div class="row">
			<div class="col text-center" id=fo>
				<c:forEach var="i" begin="1" end="10">
					<a id="ths" href="javascript:anList(${i})">${i}</a>
				</c:forEach>

			</div>



		</div>

	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>