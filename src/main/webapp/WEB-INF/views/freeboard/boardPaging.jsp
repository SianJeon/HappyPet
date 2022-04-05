<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/freeboard/include/header.jsp"/>
<style>
th, td {
	
	padding: 4px;
	text-align: left;
	order-top: 1px solid #CCC;
    border-bottom: 1px solid #BBB;
    border-top: 1px solid #BBB;
    box-shadow: inset 0 -1px 0 #fff;
    color: #555
}


tr, td{
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow:hidden;
}

thead th {
	border-bottom: 2px solid;
}

.btn_a {
	
	background:linear-gradient(to bottom, #debc9b 10%, #B78D65 100%);
	background-color:#B78D65;
	border-radius:6px;
	border:1px solid #c99667;
	display:inline-block;
	cursor:pointer;
	color:#FFFFFF;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:9px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #29190b;
}
.btn_a:hover {
	background:linear-gradient(to bottom, #f59536 10%, #cf8032 100%);
	background-color:#f59536;
}
.btn_a:active {
	position:relative;
	top:1px;
}
.btnboxR{margin-top:10px; }

.btn-small{
	border-radius:5px;
	background-color:#B78D65;
	color:#FFFFFF;
	text-shadow:0px 1px 0px #29190b;
}
.btn-small:hover {
	background:linear-gradient(to bottom, #f59536 10%, #cf8032 100%);
	background-color:#f59536;
}
.btn-small:active {
	position:relative;
	top:1px;
}

#real_body {
    font-family: 'NanumS','나눔고딕','NanumGothicWeb','Nanum Gothic','돋움',"Arial","Helvetica","AppleGothic","Sans-serif";
    font-size: 14px;
    color: #555;
    line-height: 1.5em;
    
justify-content: center;
  	align-items: center;
  	min-height: 100vh;
}

.h3{ margin-top:10px; margin-bottom:10px;}
.bod_search{margin-top:10px; margin-bottom:10px;}

.bg_f{background: #edde9d;}
.prev_next {
    background-color: #f9f9f9;
    margin-top: 32px;
    height: 40px;
    padding-top: 16px;
    text-align: center;
}
</style>
		<div id="real_body" class="container" >
			<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
			</div>
				<form id="listSearch" name="list" >
				<div class="bod_head">
					<fieldset class="bod_search">
						<label for="searchType" class="hidden">검색구분 선택 :</label>
						<select id="searchType" name="searchType" title="검색유형 선택">
							<option value="b-title">제목</option>
							<option value="b_write">작성자</option>
							<option value="b_content">내용</option>
						</select>
						<label for="searchTxt" class="hidden">검색어 입력:</label>
						<input id="searchTxt" name="searchTxt" title="검색어 입력" 
							type="text" value="">
						<input type="submit" value="검색" name="searchBt" title="검색"
							onclick="" class="btn-small">
					</fieldset>
				</div>
				</form>
				<form action="/freeboard/insert" id="list" >
				<table class="bod_list"  style="width: 100%">
				<thead class="bg_f">
					<tr><th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="one" items="${all }">
						<tr>
							<td>${one.no }</td>
							<td><a href="/freeboard/view?no=${one.no }">${one.title }</a></td>
							<td>${one.writer }</td>
							<td><fmt:formatDate value="${one.writedate }"
									pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${one.hit }"/> </td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				</form>
				<div class="btnboxR">
					<a href="insert" class="btn_a" title="자유게시판 게시글 작성하기">글쓰기</a>
				</div>
				<div class="prev_next">
					<c:if test="{paging.startPage != 1 }">
					<a href="/feeboard/boardPaging?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/freeboard/boardPaging?nowPage=${ p}&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
					<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/freeboard/boardPaging?nowPage=${paging.endPage+1 }&cntPerPage=${paging}">&gt;</a>
			</c:if>
				</c:forEach>
			</div>
	</div>			

<jsp:include page="/WEB-INF/views/freeboard/include/footer.jsp"/>