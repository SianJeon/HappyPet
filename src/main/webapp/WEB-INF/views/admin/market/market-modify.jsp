<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/market/market-nav.jsp" />
<style>
.wrapper .tableBox{position: relative; top: 50px; left: 50px; width: 90%; height: 550px; overflow-y: scroll; border-top: 2px solid dodgerblue;}
.tableData{width: 100%; border-collapse: collapse; text-align: center;}
.tableData thead tr th{position: sticky; top: 0; background: #ebeaea;}
.tableData thead tr th,
.tableData tbody tr td{padding: 15px 0; box-sizing: border-box; border-bottom: 1px solid #dedede; 
                        border-right: 1px solid #ddd; word-break: break-all;}
</style>
<form action = "/market-modifySubmit" method = "">
 <div class="container-fluid wrapper">
        <div class="text-center"><h1>상품 수정</h1></div>
        <div class="tableBox">
            <table class="tableData">
                <colgroup>
                    <col width="40%">
                    <col width="14%">
                    <col width="9%">
                    <col width="9%">
                    <col width="8%">
                    <col width="8%">
                    <col width="6%">
                    <col width="6%">
                </colgroup>
                <thead>
                    <tr>
                        <th>제품명</th>
                        <th>카테고리</th>
                        <th>회사</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>할인율</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vo}" var="vo" varStatus = "status">
                    <tr>
                        <td><input class = "rownum_name_${status.count}" type = "text" value = "${vo.productName}" style = "width : 100%"></td>
                        <td>
                            <select class="form-select rownum_category_${status.count}" style="height :33px; text-align: center; width : 100%;">
                                <option value="feed">사료</option>
                                <option value="snack">간식</option>
                                <option value="hygiene">위생</option>
                                <option value="clothing">의류 / 악세서리</option>
                            </select>
                        </td>
                        <td><input class = "rownum_company_${status.count}" type = "text" value = "${vo.company}"></td>
                        <td><input class = "rownum_price_${status.count}" type = "number" value = "${vo.productPrice}"></td>
                        <td><input class = "rownum_stock_${status.count}" type = "number" value = "${vo.productStock}" ></td>
                        <td><input class = "rownum_discount_${status.count}" type = "number" value = "${vo.discount}"></td>
                        <td><input class = "rownum_${status.count}" type = "button" onclick="modify('${status.count}')" class = "modify" value="수정"></td>
                        <td><input class = "rownum_${status.count}" type = "button" onclick="del()" class = "delete" value="삭제"></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</form>
        
<script>
    // var data = $("#tabledata").find("td:eq(1)").children().val();
    
    function modify(number)
    {
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
        $("." + obj.stock).attr("name", "productStock");
        $("." + obj.discount).attr("name", "discount");
        $("form").submit();
    }
</script>