<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<title>HAPPY PET FREEBOARD WRITING</title>
<style type="text/css">
a {
	text-decoration: none;
}

a:link {
	color: #000000;
}

.btn_wrap{
	margin-top: 10px;
}
#btn_mot,#btn_del,#btn_lis,#btn_registration,#btn_cancle{
	padding: 5px;
	background-color:#B78D65;
	color:#FFFFFF;
	
}

.container {
	width: 100%;
	max-width: 720px;
	margin-left: auto;
	margin-right: auto;
}
.h3{
	margin-top:10px;
	margin-bottom:0px;
	border-bottom: 2px solid;
}


.view_sm{
	border-bottom: 1px solid; 
	margin-bottom: 30px;
	background-color: #f9f9f9;
	text-align: center;
}
.board_tb{
	margin-left: 20px; width: 80%;
}
.cmt_wrap {
    padding: 12px 12px 12px;
    background: #fafafa;
    border-top: 1px solid;
    border-bottom: 1px solid;
    margin-top:30px;
}
.user_info_input{
   padding-bottom:5px;
    line-height: 29px;
    border: none;
    font-family: -apple-system,BlinkMacSystemFont,"Apple SD Gothic Neo","Malgun Gothic","맑은 고딕",arial,굴림,Gulim,sans-serif;
    font-size: 12px;
    vertical-align: top;
    magin-bottom:5px;
}

.cmt_textarea  {
    width: 400px;
    height: 78px;
    border: 1px solid #cecdce;
    background: #fff;
    font-family: -apple-system,BlinkMacSystemFont,"Apple SD Gothic Neo","Malgun Gothic","맑은 고딕",arial,굴림,Gulim,sans-serif;
    font-size: 13px;
    color: #333;
    line-height: 18px;
}
#name,#pw{border: 1px solid #cecdce;}
.cmt_list{
	border-top: 2px solid;
	border-bottom: 1px solid;
	display: grid;
	grid-template-columns: 1fr;
	text-align: center;
  /* 	align-items: center; Vertical */
  /* 	justify-content: center; Horizontal */
	
}
ul li {
	list-style:none;
	margin-left:5px;
	float:left;
}
ul {
	margin-bottom:0px;
	padding:9px 3px 7px 3px;
	border-bottom:1px solid #eee;
	background: #fafafa;
}
</style>
	<div class="container">
		<div class="h3">
			<a href="/freeboard/list">자유게시판</a>
		</div>
		<div class="view_sm" >
			
			<h4 class="one_title">${one.title }</h4>
			<p style="font-size: small;">
				작성자: ${one.writer } | &nbsp; &nbsp;
				등록일: <fmt:formatDate value="${one.writedate }"
					pattern="yyyy.MM.dd hh:mm:ss" /> | &nbsp; &nbsp; 
				조회수: ${one.hit } 
			</p>
		</div>
		<div class="board_tb">
			
			<p style="min-height: 300px; white-space: break-spaces;"><c:out value="${one.content}" /></p>
			</div>
			
		<div class="cmt_list">
		<c:forEach var="cmt" items="${all }">
			<ul>
				<li class="cmt_nickbox" style="width:20%">${cmt.nickname}</li>
				<li class="cmt_txtbox"   style="width:60%">${cmt.text}</li> 
				<li class="fr"  style="width:17%; font-size:small"><fmt:formatDate value="${cmt.writedate }"
									pattern="yyyy.MM.dd" /></li>
			</ul>
			
		</c:forEach>
		</div>	
		<div class="cmt_wrap" >
		<form action="/comment/add" method="post">
			<input type="hidden"  name="fbNo" value="${one.no}"/>
			<div class="user_info_input">
				<input type="text" id="name" name="nickname" placeholder="닉네임" maxlength="20" required>&nbsp&nbsp&nbsp
				<input type="password" id="pw" name="pw" placeholder="비밀번호" maxlength="20" required>
			</div>
			<div class="cmt_text_cont">
				<div class="cmt_write">
				<textarea class="cmt_textarea" name="text" style="width: 100%; resize :none;" required></textarea>
				</div>
				<div class="cmt_bottom" style="text-align: right;">
					<button class="btn" id="btn_registration" type="submit">등록</button>
					<button class="btn" id="btn_cancle" 	  type="submit" location.href="/freeboard/view?no=${one.no }">취소</button>
					<%-- required 속성을 이용하려면 button의 type이 submit일때만 가능하다
					 <a  class="btn" id="btn_registration" href="javascript:$('form').submit();">등록</a>
					<a  class="btn" id="btn_cancle" href="/freeboard/view?no=${one.no }">취소</a> --%>
				</div>
			</div>
		</form>
		</div>
		<div class="btn_wrap" style="text-align: right;">
			<a class="btn" id="btn_mot" href="/freeboard/detail/modify?no=${one.no }">수정</a>
			<a class="btn" id="btn_del" href="/freeboard/detail/delete?no=${one.no }">삭제</a>
			<a class="btn" id="btn_lis" href="/freeboard/list">목록</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>