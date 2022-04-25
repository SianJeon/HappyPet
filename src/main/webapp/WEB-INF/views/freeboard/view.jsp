<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>HAPPY PET FREEBOARD WRITING</title>
<style type="text/css">
a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

.btn_wrap {
	margin-top: 10px;
}

#btn_mot, #btn_del, #btn_lis, #btn_registration, #btn_cancle {
	padding: 5px;
	background-color: #B78D65;
	color: #FFFFFF;
}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}

.h3 {
	margin-top: 10px;
	margin-bottom: 0px;
}
.board_btn:hover{color:#786450;}
.board_btn{
	background-color:#FFFFFF;
	color:#B78D65;
	border: 1px solid #FFFFFF;
} 

.view_sm {
	border-bottom: 1px solid;
	margin-bottom: 30px;
	background-color: #f9f9f9;
	text-align: center;
}

.board_tb {
	margin-left: 20px;
	width: 80%;
}

.cmt_wrap {
	padding: 12px 12px 12px;
	background: #fafafa;
	border-top: 1px solid;
	border-bottom: 1px solid;
	margin-top: 30px;
}

.user_info_input {
	padding-bottom: 5px;
	line-height: 29px;
	border: none;
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Malgun Gothic", "맑은 고딕", arial, 굴림, Gulim, sans-serif;
	font-size: 12px;
	vertical-align: top;
	magin-bottom: 5px;
}

.cmt_textarea {
	width: 400px;
	height: 78px;
	border: 1px solid #cecdce;
	background: #fff;
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Malgun Gothic", "맑은 고딕", arial, 굴림, Gulim, sans-serif;
	font-size: 13px;
	color: #333;
	line-height: 18px;
}

#name, #pw {
	border: 1px solid #cecdce;
}

.cmt_list {
	border-top: 2px solid;
	border-bottom: 1px solid;
	display: grid;
	grid-template-columns: 1fr;
	text-align: center;
	/* 	align-items: center; Vertical */
	/* 	justify-content: center; Horizontal */
}

ul li {
	list-style: none;
	margin-left: 5px;
	float: left;
}

ul {
	margin-bottom: 0px;
	padding: 9px 3px 7px 3px;
	border-bottom: 1px solid #eee;
	background: #fafafa;
}

.cmt_delModify_btn {
	float: right;
	height: 15px;
	width: 4px;
}

.filebox {
	text-align: right;
	padding-top: 2px;
	padding-right: 10px;
}

.btn_cmt_delete {
	background: url(https://nstatic.dcinside.com/dc/w/images/sp/sp_img.png);
	background-position: -268px -200px;
	font-size: 0;
	line-height: 0;
	width: 13px;
	height: 13px;
	vertical-align: top;
}

#btn_ok {
	padding: 0;
	float: right
}
.pageInfo{
      list-style : none;
      display: inline-block;
      margin: 30px 0 0 0;
      padding:0;      
  }
  .pageInfo li{
    float: left;
    font-size: 12px;
    margin-left:0;
    padding: 7px;
    font-weight: 500;
  }
  .pageInfo_area{text-align:center;}
  
  
 .page-item  > a:link {color:black; text-decoration: none;}
 .page-item > a:visited {color:black; text-decoration: none;}
.page-item > a:hover {color:#b78d65; text-decoration: underline;}
.page-item > a:active{color:#b78d65;}


.cmt_bottom *:hover {
	background:linear-gradient(to bottom, #c49f7c 10%, #c49f7c 100%);
	background-color:#c49f7c;
}
.cmt_bottom *:active {
	position:relative;
	top:1px;
}
.btn_wrap *:hover {
	background:linear-gradient(to bottom, #c49f7c 10%, #c49f7c 100%);
	background-color:#c49f7c;
}
.btn_wrap *:active {
	position:relative;
	top:1px;
}
</style>
<div class="container">
	<div class="h3" style="margin:5px;">
		<button class="board_btn" type="button"  style="padding:10px;" onclick="button_click1();">자유게시판</button>
	</div>
	<script>
	function button_click1(){
		history.go(-1);
	}
</script>
	<div class="view_sm">
		<h4 style="border-top: 2px solid;" class="one_title">${one.title }</h4>
		<p style="font-size: small; width:100%">
			작성자: ${one.writer } | &nbsp; &nbsp; 등록일:
			<fmt:formatDate value="${one.writedate }"
				pattern="yyyy.MM.dd hh:mm:ss" />
			| &nbsp; &nbsp; 조회수: ${one.hit }
		</p>
	</div>
	<div class="board_tb">

		<p style="min-height: 300px; white-space: break-spaces;">
			<c:out value="${one.content}" />
		</p>
	</div>
	<div class="filebox">
		<div style="margin-bottom: 10px;">
			<%-- <span>첨부파일 
			<c:set var="fileNo" value="#{fileNo }"/>
			<c:if test="${fileNo eq '#{fileNo}'}">
				<c:forEach var="f" items="${all }">
				</c:forEach>	
			</c:if>개</span> --%>
			<label id="attach"><small>첨부파일 </small> ${fn:length(list) }개</label>
			<!-- 여기에 파일 갯수 세는걸 넣고 싶음 -->
			<div id="fileView" style="display: none">
				<c:forEach var="map" items="${list }">
					<div>
						<a href="/freeboard/download?no=${map.fileNo }">${map.fileName}</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		$("#attach").click(function() {
			$("#fileView").slideToggle(200);
		});
	</script>
	<div class="cmt_list">
		<c:forEach var="cmt" items="${all }" >
			<ul>
				<li class="cmt_nickbox" style="width: 20%">${cmt.nickname}</li>
				<li class="cmt_txtbox" style="width: 60%">${cmt.text}</li>
				<li class="fr" style="width: 17%;">
					<div style="font-size: small;">
						<fmt:formatDate value="${cmt.writedate }" pattern="yyyy.MM.dd" />
						<button type="button" data-toggle="collapse"
							class="btn_cmt_delete" data-target="#collapseCmt_${cmt.no }">x</button>
					</div>
					<form id="pw_form_${cmt.no }" method="post" action="/comment/delete">
						<input type="hidden" name="fbNo" value="${cmt.fbNo }" /> <input
							type="hidden" name="no" value="${cmt.no }" />
						<div class="collapse" id="collapseCmt_${cmt.no }">
							<input style="width: 100%" name="pw" type="password" title="비밀번호"
								placeholder="비밀번호" id="cmt_password" class="cmt_delpw">
							<button type="button" onclick="deleteConfirm('pw_form_${cmt.no }');">확인</button>
						</div>
					</form>
				</li>
			</ul>
		</c:forEach>
		</div>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo paging">
					<c:if test="${pageMaker2.prev }">
						<li class="page_btn previous"><a
							href="/freeboard/view?no=${pageMaker2.cri.fbNo }&pageNum=${pageMaker2.startPage -1 }"><
								Prev</a></li>
					</c:if>
					<c:forEach var="cmt_num" begin="${pageMaker2.startPage }"
						end="${pageMaker2.endPage }">
						<li class="page-item"><a
							href="/freeboard/view?no=${pageMaker2.cri.fbNo }&pageNum=${cmt_num }">${cmt_num }</a></li>
					</c:forEach>
					<c:if test="${pageMaker2.next }">
						<li class="page_btn next"><a class="num"
							href="/freeboard/view?no=${pageMaker2.cri.fbNo }&pageNum=${pageMaker2.endPage +1 }">Next
								></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		
		<form action="moveForm" method="get">
			<input type="hidden" name="pageNum"
				value="${pageMaker2.cri.pageNum }"> <input type="hidden"
				name="amount" value="${pageMaker2.cri.amount }">
		</form>
		<script>
		
		function deleteConfirm(form_id) {
			if (confirm("정말 삭제하시겠습니까?")) {
				document.getElementById(form_id).submit();
			} else {

			}
		}
		</script>


		<div class="cmt_wrap">
			<form action="/comment/add" method="post">
				<input type="hidden" name="fbNo" value="${one.no}" />
				<div class="user_info_input">
					<input type="text" id="name" name="nickname" placeholder="닉네임"
						maxlength="20" required>&nbsp&nbsp&nbsp <input
						type="password" id="pw" name="pw" placeholder="비밀번호"
						maxlength="20" required>
				</div>
				<div class="cmt_text_cont">
					<div class="cmt_write">
						<textarea class="cmt_textarea" name="text"
							style="width: 100%; resize: none;" required></textarea>
					</div>
					<div class="cmt_bottom" style="text-align: right;">
						<button class="btn" id="btn_registration" type="submit">등록</button>
						<button class="btn" id="btn_cancle" type="submit"
							location.href="/freeboard/view?no=${one.no }">취소</button>
						<%-- required 속성을 이용하려면 button의 type이 submit일때만 가능하다
					 <a  class="btn" id="btn_registration" href="javascript:$('form').submit();">등록</a>
					<a  class="btn" id="btn_cancle" href="/freeboard/view?no=${one.no }">취소</a> --%>
					</div>
				</div>
			</form>
		</div>
		<div class="btn_wrap" style="text-align: right;">
			<a class="btn" id="btn_mot"
				href="/freeboard/detail/modify?no=${one.no }">수정</a> <a class="btn"
				id="btn_del" href="/freeboard/detail/delete?no=${one.no }">삭제</a> <button
				class="btn" type="button" id="btn_lis" onclick="button_click1();">목록</button>
		</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />