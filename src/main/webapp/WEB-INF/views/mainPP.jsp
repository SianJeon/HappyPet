<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/top.jsp" />
<style>
.background-main
{
	background-color: rgba(248, 196, 53, 0.2);
	height: 100%;
}
.bannerImage
{
	/* width: 1040px; */
	height: 300px;
	background-color : rgba(245,196,90, 0.6);
	border-top-left-radius: 300px;
	border-bottom-left-radius: 300px;
	animation: fadeInLeft 1s;
}
.background-animal
{
	bottom: 50px;
	z-index: 1;
}

</style>
<div class="container-fluid position-absolute background-main">
	<div class = "container w-25 position-relative m-0">
		<div class = "">
			<a href="#"><img src="images/animal-logo.png" alt=""></a>
		</div>
	</div>
	<div class = "fixed-bottom background-animal">
		<img class="" src="images/main.png" alt="">
	</div>
</div>
<div class="container-banner row d-flex align-content-center" style = "height : 100%; z-index : 5">
	<div class="col-2"></div>
	<div class="col-10">
		<div class = "bannerImage center-block"></div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/bottom.jsp" />
