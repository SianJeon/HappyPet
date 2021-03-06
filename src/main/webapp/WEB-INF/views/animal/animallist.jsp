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

.selectBox{
	
	text-align: right;
	padding-right: 75px;
}
.selectBox .select {
	width : 60px;
	text-align:center;
	border-radius:5px;
   -webkit-appearance:none; /* for chrome */

   -moz-appearance:none; /*for firefox*/
   
   appearance:none;

}

.selectBox::-ms-expand{

   display:none;/*for IE10,11*/

}

</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js">
</script>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div id="cho" class="selectBox">
		<select class="select" name="category" id="category" >
			<option value="-">전체</option>
			<option value="417000" >🐶강아지</option>
			<option value="422400">🐈고양이</option>
			<option value="429900">🐥기타</option>

		</select>
	</div>



	<div class="container co">
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
					
					makePage(rst.paging.totalCount,no,10,10)
				
					
					$("#anView").html(tag);
				});
		}

		anList(1);

		$(document).on("change", "#category", function() {
			anList(1);
		})
		
		$(document).on('click', '.page-list a', function(){
	if( $('#anView').length > 0 )
		anList( $(this).data('page') );
	
});
	</script>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class='page-list container' style="text-align: center;">
			</div>
			<div class="col"></div>
		</div>

	</div>


<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>