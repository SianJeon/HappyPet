<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>

.col {
	padding-top: 50px;
}

#table tr:nth-child(1) {
	padding-top: 10px;
}

#content {
	text-align: center;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container table-responsive">

		<table id="table" class="table table-bordered">
			<tbody>
				<tr>
					<td class="table-info text-dark">품종</td>
					<td style="width: 35%">${detail.kindCd}</td>
					<td class="table-info text-dark">색</td>
					<td style="width: 35%">${detail.colorCd}</td>
				</tr>
				<tr>
					<td class="table-info text-dark">성별</td>
					<td>${detail.sexCd}</td>
					<td class="table-info text-dark">나이</td>
					<td>${detail.age}</td>
				</tr>
				<tr>
					<td class="table-info text-dark">무게</td>
					<td>${detail.weight}</td>
					<td class="table-info text-dark">중성화여부</td>
					<td>${detail.neuterYn}</td>
				</tr>
				<tr>
					<td class="table-info text-dark">공고일</td>
					<td>${detail.noticeSdt}</td>
					<td class="table-info text-dark">공고만료일</td>
					<td>${detail.noticeEdt }</td>
				</tr>
				<tr>
					<td class="table-info text-dark">접수일</td>
					<td>${detail.happenDt}</td>
					<td class="table-info text-dark">발견장소</td>
					<td>${detail.happenPlace}</td>
				</tr>
				<tr>
					<td colspan="4">
					<div class="card">
						<img class="card-img-top img-fluid" src="${detail.popfile}"
							alt="Card image">
					</div>
					
					</td>
				</tr>
			</tbody>
		</table>


		<div id="content">${detail.specialMark }</div>

		

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>