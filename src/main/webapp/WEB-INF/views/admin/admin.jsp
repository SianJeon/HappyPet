<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.bg-action { background-color: khaki; border: 1px solid thistle; color : black;}
.nav-bar
{
    height: 100vh;
    padding-top: 30px;
    padding-right: 0px;
    background-color: bisque;   
}
.nav-div
{
    background-color: #f8f8f8;
    border: 1px solid rgb(177, 177, 177);
    
}
.stop-dragging
{
    -ms-user-select: none; 
    -moz-user-select: -moz-none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    user-select: none;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0; 
}
            
input[type=number] {
	-moz-appearance:textfield;
}

</style>
<body>
<div class="row">
    <div class="nav-bar col-2 text-center stop-dragging">
        <div><h1>관리 페이지</h1></div>
        <div class="nav-div p-2" data-mode="market-admin"
            onclick = "location.href='admin/market/insert'"
         style = "background-color : beige">쇼핑몰 관리</div>
        <div class="nav-div p-2" data-mode = "">xxxx 관리</div>
        <div class="nav-div p-2" data-mode = "">zzzz 관리</div>
        <div class="nav-div p-2" data-mode = "">yyyy 관리</div>
    </div>
    
    
    <!-- 마켓 관리페이지 -->
    <div class="col-10" id="mView">
        
        <div style = "border : 1px solid black">
            <div>
                관리자 로그인
            </div>
            <div>
                id : <input type = "text" >
            </div>
            <div>
                password : <input type="password" name="" id="">
            </div>
        </div>
    </div>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />

<script>

    $(".nav-div").on("click", function(e){

        $(".nav-div").each(function() {
            if(e.target == this) {
                $(this).css("background-color", "beige");
            }else {
                $(this).css("background-color", "#f8f8f8");
            }
        })
		// $.ajax("/"+$(this).data("mode")).done(function(inner){
        //     $("#mView").html();
		// 	$("#mView").html(inner);
		// });
    });
</script>