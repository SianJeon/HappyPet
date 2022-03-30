<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/top.jsp" />
<style>
* {margin : 0; padding : 0}
body {background-color: rgba(248, 196, 53, 0.2);}
.logo {width: 80px; margin-left : 10px}
.logo-container
{ 
    display: flex; justify-content: space-between; border-bottom: 2px solid white;
    margin-top : 23px;
    padding-bottom : 3px; 
}
.main-content { height : 80vh}
.rounded-circle:hover
{
  	animation: conversionCircle 1s, angledegree 1.5s;
  	animation-fill-mode: forwards;
}

.page-top
{
  	width: 100%;
  	height: 380px;
  	font-weight: bold;
}
.right-bar
{
    /* margin-top: 110px; */
    position: absolute;
    /* top: 0; */
    right: 0;
    width: calc(60% + 300px);
    height: 80vh;
    border-top-left-radius: 150px;
    border-bottom-left-radius: 150px;
    background-image: linear-gradient(270deg, rgba(247, 118, 6, 0.7), rgba(245, 196, 90, 0.55));
  
    animation: fadeInRight 1s, zoomout 2s, height 1s;
    animation-fill-mode: forwards;
}
@keyframes zoomout 
{
    0%
    {
        border-top-left-radius: 150px;
        border-bottom-left-radius: 150px;
    }
    to
    {
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
    }
}
@keyframes height 
{
    0%
    {
        width: 0%;
        height: 30%;
    }
    to
    {
        width: 100%;
        height: 80vh;
    }
}
.right-bar > * {color: white;}
.right-bar > h2 {font-size: 50px; }
.right-bar > h4 {padding-top: 30;}

.background-animal
{
	  position: absolute;
	  padding: 0;
	  z-index: -1;
	  opacity: 0.2;
}
.background-animal > img {height: 100vh; width: 100%;}
.main-ment {display: flex; justify-content: center; align-items: center;}
.menu-btn
{
	
    width: 70px;
    height: 70px;
    margin: 6px;
    margin-right : 16px;
    background-color: rgba(247, 118, 6, 0.9);
}
.board-Name
{
    width: 45%;
    text-align: center;
    text-decoration: line-through;
    
}
</style>
<div class = "background-animal container-fluid">
    <img class="" src="images/mian1.jpg" alt="">
</div>
<div class = "logo-container">
    <a href="#"><img class="logo" src="images/animal-logo.png" alt=""></a>
        <div class="board-Name">자유게시판</div>
		    <div class="rounded-circle menu-btn d-flex justify-content-center align-items-center "
			    style="font-weight: 200; font-size: small;">
			    menu
		    </div>
		<input id="modalToggle" class="hide" type="checkbox">
		<!-- <section class="modal">
		  	<label class="btn btn-open" for="modalToggle">Open modal</label>

			  <div class="inside">
		      	<label class="btn-close" for="modalToggle">X</label>
		      	<p>Text goes here.</p>
			  </div>
		  </section> -->


	  </div>
	  <div class="main-content">
		    <div class="page-top">
			  <div class = "right-bar d-flex flex-column justify-content-center align-items-center">
                    <!-- 주요 내용 입력 부분 -->
			  </div>
		  </div>
	  </div>
	  <div style="border-top: 2px solid white;">
		    <div style = "float : right; margin-right : 40px; color : #737373">현재 입양가능한 동물 12345마리 </div>
	  </div>
<script>

</script>
<style>

.modal {
    position: fixed;
    display: block;
    width: 100%;
    height: 100%;
    background: transparent;
    overflow: hidden;
    border-radius: .2em;
}

.btn {
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
            transform: translate(-50%,-50%);
    display: inline-block;
    height: 3em;
    width: 10em;
    line-height: 3em;
    border-radius: 1.5em;

    font-weight: 700;
    background: #34383c;
    cursor: pointer;
    -webkit-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;

    -webkit-animation-duration: 2s;

            animation-duration: 2s;
    -webkit-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
} 

.modal .inside { 
    opacity: 0;
    display: none;

    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;

    text-align: left;
    padding: 2em;

    -webkit-animation-duration: 2s;

            animation-duration: 2s;
    -webkit-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
}

.inside p { margin: 0 }

.inside .btn-close {
    position: absolute;
    top: 1em;
    right: 1em;

    background: rgba(0,0,0,.5);
    font-size: .8em;
    text-align: center;

    height: 3em;
    width: 3em;
    line-height: 3em;
    border-radius: 3em;
    cursor: pointer;
}

#modalToggle:checked ~ .modal .btn-open {
    -webkit-animation-name: btnExpand;
            animation-name: btnExpand;
}
#modalToggle:checked ~ .modal .inside {
    display: block;
    -webkit-animation-name: delayedFadeIn;
            animation-name: delayedFadeIn;
}


@-webkit-keyframes btnExpand {
    15% {
      color: transparent;
      width: 10em;
    }
    35% {
      width: 3em;
      height: 3em;
      border-radius: 9999px;
      margin: 0;
    }
    to {
      width: 9999px;
      height: 9999px;
      border-radius: 9999px;
      color: transparent;
    }
}


@keyframes btnExpand {
    15% {
        color: transparent;
        width: 10em;
    }
    35% {
        width: 3em;
        height: 3em;
        border-radius: 9999px;
        margin: 0;
    }
    to {
        width: 9999px;
        height: 9999px;
        border-radius: 9999px;
        color: transparent;
    }
}

@-webkit-keyframes delayedFadeIn {
    from {
        opacity: 0
    }
    55% {
        opacity: 0
    }
    65% {
        opacity: 1
    }
    to {
        opacity: 1
    }
}

@keyframes delayedFadeIn {
    from {
        opacity: 0
    }
    55% {
        opacity: 0
    }
    65% {
        opacity: 1
    }
    to {
        opacity: 1
    }
}
</style>
<jsp:include page="/WEB-INF/views/include/bottom.jsp" />