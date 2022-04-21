<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
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
	text-align:center;
}

.btn_a {
	
	background:linear-gradient(to bottom, #debc9b 10%, #B78D65 100%);
	background-color:#B78D65;
	border-radius:6px;
	border: 1px solid #cecdce;
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
.btnboxR{margin-top:10px; float:right;}

.btn-small{
	border: 1px solid #cecdce;
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
tbody{background-color:#f9f9f9;}
 .pageInfo{
      list-style : none;
      display: inline-block;
      margin: 50px 0 0 0;
      padding-left:0;      
  }
  .pageInfo li{
    float: left;
    font-size: 17px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
  .pageInfo_area{text-align:center;}
  a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
a:hover {color:#b78d65; text-decoration: underline;}
 a:active{color:#b78d65;}"
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
						<th style="text-align:center;">날짜</th>
						<th style="text-ailgn:center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="one" items="${all }">
						<tr>
							<td style="width:10%; text-align:center;">${one.no }</td>
							<td><a href="/freeboard/view?no=${one.no }">${one.title }</a></td>
							<td style="width:15%; text-align:center;">${one.writer }</td>
							<td style="width:10%; font-size:12px; text-align:center;"><fmt:formatDate value="${one.writedate }"
									pattern="yyyy.MM.dd" /></td>
							<td style="width:10%; text-align:center; font-size:12px"><c:out value="${one.hit }"/> </td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				<div class="btnboxR">
					<button type="submit" class="btn_a" title="자유게시판 게시글 작성하기">글쓰기</button>
				</div>
				</form>
				
				
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">			
  			<ul id="pageInfo" class="pageInfo">  
  				<c:if test="${pageMaker.prev }">
  					<li class="page_btn previous"><a href="/freeboard/list?pageNum=${pageMaker.startPage -1 }">< Prev</a></li>
  				</c:if>
 				 <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
   					<li class="page-item"><a 
 
 href="/freeboard/list?pageNum=${num }&amount=10">${num }</a></li>
   				</c:forEach> 
   				<c:if test="${pageMaker.next }">
   					<li class="page_btn next"><a class="num" href="/freeboard/list?pageNum=${pageMaker.endPage +1 }">Next ></a></li>
   				</c:if>
  			</ul>
  		</div>
	</div>

		<form id="makeForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>