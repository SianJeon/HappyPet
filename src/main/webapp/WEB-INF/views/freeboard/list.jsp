<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAPPY PET FREEBOARD</title>
</head>
<style>

table {
	border-collapse: collapse;
}
.bod_list{
 width:400px;
 height:400px;
}

th, td {
	border-bottom: 1px solid;
	padding: 4px;
	text-align: left;
}
tr, td{
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow:hidden;
}

thead th {
	border-bottom: 2px solid;
}

a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

#container {
    overflow: hidden;
    width:600px;
	height:600px; 
    margin: 0 auto;
    padding: 47px 0 100px;
}


body {
    font-family: 'NanumS','나눔고딕','NanumGothicWeb','Nanum Gothic','돋움',"Arial","Helvetica","AppleGothic","Sans-serif";
    font-size: 14px;
    color: #555;
    line-height: 1.5em;
    display: flex;
  	justify-content: center;
  	align-items: center;
  	min-height: 100vh;
}
.btm_mn {
    position: relative;
    margin-top: -1px;
    padding: 10px 10px 0;
    border-top: 1px solid #CCC;
     float: right;
}
#list { 
	padding-top:10px;
	
   
}
}
</style>
<body>
<div id="container">
		<header id="tit_wrap" >
			<h3>자유게시판</h3>
			
				<form id="listSearch" name="list" method="post">
				<div class="bod_head">
					<fieldset class="bod_search">
						<legend class="hidden">게시판 검색</legend>
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
				</header>
				<form action="/freeboard/insert" id="list">
				<table class="bod_list"  style="width: 100%">
				<thead>
					<tr><th>no</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="one" items="${all }">
						<tr>
							<td>${one.no }</td>
							<td>${one.category }</td>
							<td><a href="/freeboard/writing?no=${one.no }">${one.title }</a></td>
							<td>${one.writer }</td>
							<td><fmt:formatDate value="${one.writedate }"
									pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
		<div class="btm_mn">
			<button type="submit" class="btn" title="자유게시판 게시글 작성하기">글쓰기</button>
		</div>
		</form>
		<form action="/" method="get" class="bd_pg clear">
			<fieldset>
				<
			</fieldset>
		</form>
	</div>			
</body>
</html>
