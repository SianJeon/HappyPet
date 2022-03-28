<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/top.jsp" />
<style>
.test_obj {
	position: relative;
	
	animation: fadeInLeft 1s;
}
.bannerImage
{
	width: 1040px;
	height: 300px;
	background-color : rgba(245,196,90, 0.6);
	border-top-left-radius: 300px;
	border-bottom-left-radius: 300px;
}

.background
{
	display: flex;
  	justify-content: center;
  	align-items: center;
}
.menu-btn
{
	padding-top : 25px;
	text-align: center;
	position: relative;
	top: -140px; 
	left: 1300px;
	width : 80px;
	height : 80px;
	background-color : rgba(0, 0, 0, 0.4);
	border-radius: 50%;
}
</style>
<body>
	<div style="background-color: rgba(248, 196, 53, 0.2); position: absolute;
				height: 732px; width: 1440px;">
		<div class="background" style="position: relative; top: 450px; left: -250px">
			<img class="" src="images/main.png" alt="">
		</div>
		<div class="menu-btn">
			메뉴
		</div>
		</div>
		<div style="position: absolute;">
			<div class="logo">
				<a href="#"><img src="images/animal-logo.png" alt=""></a>
			</div>
			<div class = "test_obj">
				<div class = "bannerImage" style = "margin-left : 400px">
	
				</div>
			</div>
		
	</div>
	<input id="modalToggle" class="hide" type="checkbox">
	<section class="modal">
		<!-- <div class="btn btn-open" ="modalToggle">Open modal</div> -->
		<div class="inside">
			<label class="btn-close" for="modalToggle">X</label>
			<p>Text goes here.</p>
		</div>
	</section>
</body>

<style>
.logo > a
{
	position : relative;
	width: 200px;
	height: 200px;
}
</style>
<jsp:include page="/WEB-INF/views/include/bottom.jsp" />
