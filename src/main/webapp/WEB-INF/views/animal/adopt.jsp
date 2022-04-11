<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#write {

	text-align: right;
	padding-right: 100px;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>








<div id="write"><button type="button" class="btn btn-secondary" onclick="location.href='/write'">글쓰기</button></div>



<script>
	

</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>