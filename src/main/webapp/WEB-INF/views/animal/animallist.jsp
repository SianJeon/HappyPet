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


	<div id="cho">
		<select name="category" id="category">
			<option value="-">전체</option>
			<option value="417000">강아지</option>
			<option value="422400">고양이</option>
			<option value="429900">기타</option>

		</select>

	</div>



	<div class="container">
		<div class="row" id="anView"></div>
	</div>




	<script type="text/javascript">
		function anList(no) {
			var ctg = $("#category").val();
			var tag = "";
			var dex ="";

			$.ajax({
					url : "/animal/list",
					data : {
						"upkind" : ctg,
						"pageNo" : no
					}
				})
				.done(function(rst) {
					console.log(rst);
					for (var i = 0; i < rst.rests.length; i++) {
						if (rst.rests[i].processState == "보호중") {

							tag += "<div class='col-lg-3 p-3'>"
							tag += "<div class='card '>"
							tag += "<a href='/animal/detail?desertionNo="
									+ rst.rests[i].desertionNo
									+ "'><img class='card-img-top img-fluid' src="+rst.rests[i].popfile+"><a>"
							tag += "<div class='card-body'>"
							tag += "<h5 class='card-title' >"
									+ rst.rests[i].kindCd + "</h4>"
							tag += "<h5 class='card-title' >"
									+ rst.rests[i].age + "</h4>"
							tag += "<h5 class='card-title' >"
									+ rst.rests[i].weight + "</h4>"
							tag += "<p class='card-text' >"
									+ rst.rests[i].specialMark + "</p>"
							tag += "</div>"
							tag += "</div>"
							tag += "</div>"
						}
					}
				
					for (var i = rst.paging.beginBlock; i <= rst.paging.endBlock; i++) {

						dex += "<a href='#' onclick='anList(" + i
								+ ")'>" + i + "</a>"

					}

					$("#fo").html(dex);
					
					$("#anView").html(tag);
				});
		}

		anList(1);

		$(document).on("change", "#category", function() {
			anList(1);
		})
	</script>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col text-center" id=fo>


			</div>
			<div class="col"></div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>