<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container py-5">
		<h1 class="display-1 text-white animated slideInDown">
			대제목
			<p>소제목</p>
		</h1>
		<nav aria-label="breadcrumb animated slideInDown">
			<h4 class="btn btn-primary py-3 px-5 animated slideInLeft">안쓰고싶으면
				쓰지마세요</h4>
		</nav>
	</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<style>
.img-fluid {
	height: 15rem;
}

.d-flex {
	display: flex;
	justify-content: space-evenly
}


</style>
<%-- 메인 컨텐트 --%>
<div>
	<div class="container">
		<div class="row" id="anView"></div>
	</div>
	<script type="text/javascript">
		function anList(no) {
			var tag = "";
			$.ajax({
				url : "/animal/list",
				data : {
							"pageNo" : no
						}

					})
					.done(
							function(rst) {

								for (var i = 0; i < rst.length; i++) {

									tag += "<div class='col-lg-3 p-3'>"
									tag += "<div class='card '>"
									tag += "<a href='/detail'><img class='card-img-top img-fluid' src="+rst[i].popfile+"><a>"
									tag += "<div class='card-body'>"
									tag += "<h5 class='card-title'>"
											+ rst[i].kindCd + "</h4>"
									tag += "<h5 class='card-title'>"
											+ rst[i].age + "</h4>"
									tag += "<h5 class='card-title'>"
											+ rst[i].weight + "</h4>"
									tag += "<p class='card-text'>"
											+ rst[i].specialMark + "</p>"
									tag += "</div>"
									tag += "</div>"
									tag += "</div>"

									console.log(i);
								}

								$("#anView").html(tag);
							})

		}
		anList(1);
	</script>
	<div class="container">
  <div class="row">
    <div class="col">
    
    </div>
    <div class="col" id="font">
    	<c:forEach var="i" begin="1" end="10">
		<a id="ths" href="javascript:anList(${i})">${i}</a>
	</c:forEach>
    
    </div>
    <div class="col">
     
    </div>
  </div>
</div>

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />