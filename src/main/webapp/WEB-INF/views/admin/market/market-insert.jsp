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
         style = "background-color : beige">쇼핑몰 관리</div>
        <div class="nav-div p-2" data-mode = "">xxxx 관리</div>
        <div class="nav-div p-2" data-mode = "">zzzz 관리</div>
        <div class="nav-div p-2" data-mode = "">yyyy 관리</div>
    </div>
    
    <!-- 마켓 관리페이지 -->
    <div class="col-10" id="mView">
        <div class = "row text-center" style = "padding-top : 30px">
            <div class = "col-6">
            <a href="insert">상품 등록</a>
        </div>
        <div class = "col-6"><a href="modify">상품 수정</a></div>
        <div class="p-5">
            <div class="text-center"><h1>상품 등록</h1></div>
            <form action="/admin/market/insertProduct" enctype = "multipart/form-data" method="post" onsubmit="init()">
            <div class="row">
                <div class = "col-2" style="padding-top : 25px;">
                    <select class="form-select" style="height :33px; text-align: center;"
                     name = "marketVo.category">
                        <option value="feed">사료</option>
                        <option value="snack">간식</option>
                        <option value="hygiene">위생</option>
                        <option value="clothing">의류 / 악세서리</option>
                    </select>
                </div>
                <div class = "col-10">
                    제목    <input type="text" class="form-control" name="marketVo.productName"
                                placeholder="제품 이름을 입력해 주세요" 
                                required oninvalid="this.setCustomValidity('제품 이름을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    회사    <input type="text" class="form-control" name="marketVo.company" 
                                placeholder="제품 회사를 입력해주세요" 
                                required oninvalid="this.setCustomValidity('제품 회사를 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-3">
                    가격    <input type="number" class="form-control" name="marketVo.productPrice"
                                placeholder="제품 가격을 입력해주세요"
                                required oninvalid="this.setCustomValidity('제품 가격을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-3">
                    수량    <input type="number" class="form-control" name="marketVo.productStock"
                                placeholder="제품 수량을 입력해 주세요"
                                required oninvalid="this.setCustomValidity('제품 수량을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-3">
                    할인율    <input type="number" class="form-control" name="marketVo.discount"
                                placeholder="할인율을 입력해 주세요">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    사진    <input multiple type="file" class="form-control" name="marketFileVo.mainImg"
                                required oninvalid="this.setCustomValidity('제품 사진을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-6">
                    상세사진 <input type="file" class="form-control" name="marketVo.detailImg"
                                required oninvalid="this.setCustomValidity('제품 상세 사진을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
            </div>
            <button class="btn btn-primary w-100 py-3 mt-5" type="submit">제품 등록</button>
            </form>
        </div>
        
    </div>
</div>
<script>
    function init()
    {
        var value = $("[name=marketVo.discount]").val();
        if(value == '' || value == undefined) $("[name=marketVo.discount]").val(0);
    }
</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />