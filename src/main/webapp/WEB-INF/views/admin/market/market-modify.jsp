<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
.wrapper .tableBox{ top: 50px; left: 50px; width: 100%; height: 550px; overflow-y: scroll; border-top: 2px solid dodgerblue;}
.tableData{width: 100%; border-collapse: collapse; text-align: center;}
.tableData thead tr th{position: sticky; top: 0; background: #ebeaea;}
.tableData thead tr th,
.tableData tbody tr td{padding: 15px 0; box-sizing: border-box; border-bottom: 1px solid #dedede; 
                        border-right: 1px solid #ddd; word-break: break-all;}
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
    <div class = "col-10">
       <div class = "row text-center" style = "padding-top : 30px">
            <div class = "col-6">
            <a href="insert">상품 등록</a>
        </div>
        <div class = "col-6">
            <a href="modify">상품 수정</a>
            <%-- <div class = "nav-item nav-link modi" onclick = "location.href='admin/market/modify'"> --%>
                
        </div>
    
        <form action = "" method = "">
        <div class="container-fluid wrapper">
                <div class="text-center"><h1>상품 수정</h1></div>
                <div class="tableBox">
                    <table class="tableData">
                        <thead>
                            <tr>
                                <th style = "width : 300px">제품명</th>
                                <th style = "width : 150px">카테고리</th>
                                <th>회사</th>
                                <th style = "width : 12%">가격</th>
                                <th style = "width : 12%">수량</th>
                                <th style = "width : 12%">할인율</th>
                                <th>수정</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${vo}" var="vo" varStatus = "status">
                            <tr><input type = "hidden" name = "no" value = "${vo.no}" >
                                <td><input class = "rownum_name_${status.count}" type = "text" value = "${vo.productName}" style = "width : 100%"></td>
                                <td>
                                    <select class="form-select rownum_category_${status.count}" >
                                        <option value="feed" ${vo.category eq 'feed' ? 'selected' :''}>사료</option>
                                        <option value="snack" ${vo.category eq 'snack' ? 'selected' :''}>간식</option>
                                        <option value="hygiene" ${vo.category eq 'hygiene' ? 'selected' :''}>위생</option>
                                        <option value="clothing" ${vo.category eq 'clothing' ? 'selected' :''}>의류 / 악세서리</option>
                                    </select>
                                </td>
                                <td><input class = "rownum_company_${status.count}" type = "text" value = "${vo.company}"></td>
                                <td><input class = "rownum_price_${status.count}" type = "number" value = "${vo.productPrice}"></td>
                                <td><input class = "rownum_stock_${status.count}" type = "number" value = "${vo.productStock}" ></td>
                                <td><input class = "rownum_discount_${status.count}" type = "number" value = "${vo.discount}"></td>
                                <td><input class = "rownum_${status.count}" type = "button"
                                    onclick="_submit('${status.count}', 'modify')" class = "modify" value="수정"></td>
                                <td><input class = "rownum_${status.count}" type = "button"
                                    onclick="_submit('${status.count}', 'delete')" class = "delete" value="삭제"></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>        
<script>

    function _submit(number, btn)
    {
        var url;
        if(btn == 'modify') url = "/admin/market/market-modifySubmit";
        else if(btn == "delete") url = "/admin/market/market-deleteSubmit";
        var obj = 
        {
            name : "rownum_name_" + number,
            category : "rownum_category_" + number,
            company : "rownum_company_" + number,
            price : "rownum_price_" + number,
            stock : "rownum_stock_" + number,
            discount : "rownum_discount_" + number
        }
        $("." + obj.name).attr("name", "productName");
        $("." + obj.category).attr("name", "category");
        $("." + obj.company).attr("name", "company");
        $("." + obj.price).attr("name", "productPrice");
        $("." + obj.stock).attr("name", "productStock");
        $("." + obj.discount).attr("name", "discount");
        $("form").attr("action", url).submit();
    }

</script>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>