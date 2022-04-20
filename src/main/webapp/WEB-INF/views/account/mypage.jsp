<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/account/include/top.jsp" />
구매 내역
<c:forEach begin = "0" end = "5" varStatus = "i">
    <div>
        ${i.index} 글쓰기
    </div>
</c:forEach>
<jsp:include page="/WEB-INF/views/account/include/bottom.jsp" />