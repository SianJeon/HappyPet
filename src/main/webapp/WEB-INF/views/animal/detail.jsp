<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.subbu {
	background: #bebebe !important;
	border: 0px solid #00d255 !important;
	color: #ffffff !important;
}

.member input {
	border-radius: 3px;
	box-shadow: none;
	border: 1px solid rgba(128, 128, 128, 0.2);
	outline: none;
	background: transparent;
	padding: 8px 16px;
	border-radius: 3px;
	width: 150px;
	vertical-align: top;
}

.member textarea {
	border-radius: 3px;
	box-shadow: none;
	border: 1px solid rgba(128, 128, 128, 0.2);
	outline: none;
	resize: none;
	background: transparent;
	padding: 8px 16px;
	border-radius: 3px;
	vertical-align: top;
	background: transparent;
}

table tr td:#sub {
	border-left: 1px solid black;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div>
			<a href="/animal/decomdelete?no=${detail.owner }">삭제</a>
			<a href="/animal/deupdate?no=${detail.owner }">수정</a>	
		</div>
		



	<div class="container row" style="margin: auto;">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table" style="margin-left: auto; margin-right: auto;">
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">${detail.title}</th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">작성자</th>
						<td>${detail.writer }</td>
						<td></td>
						<td id="sub">작성일</td>
						<td>${detail.writedate}</td>
					</tr>
				</tbody>
			</table>
			<div class="text-center" style="white-space: pre;">${detail.content }</div>
			<img src="/download?no=${detail.owner}"
				class="rounded mx-auto d-block mt-2" alt="...">

			<div id="comment"></div>
	
				<div class="container">
					<div class="row align-items-start" id="sub1" style="text-align: center;"></div>
				</div>



			<form action="comment">

				<div class="member mb-3">
					<label for="exampleFormControlInput1" class="form-label">작성자
					</label> <input type="text" class="form-control" name="writer"
						id="exampleFormControlInput1" placeholder="작성자">
				</div>


				<div class="member mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">
					</label>

					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3" name="content">
				</textarea>
					<input type="hidden" name="no" value="${detail.owner}">
				</div>
				

				<button type="submit" class="subbu" style="float: right;">작성</button>

			</form>

		</div>
		<div class="col-sm-2"></div>
	</div>




	<script type="text/javascript">
		commentall();

		function commentall(page) {

			if (page == null) {

				page = 1;

			}
			page = page;

			var no = $("input[name=no]").val();

			$
					.ajax({

						url : "/animal/commentall",

						data : {
							"owner" : no,
							"page" : page

						}

					})
					.done(
							function(rst) {
								var tag = "";
								var dex = "";
								console.log(rst);

								for (var i = 0; i < rst.datas.length; i++) {

									tag += "<div style='padding:10px 0px;'>";
									tag += "<input id='no' type='hidden' value='"+rst.datas[i].no+"'>";
									tag += "<div id='wirter'> " + rst.datas[i].writer
											+ "<span style='padding:0 5px;'>"
											+ rst.datas[i].writedate
											+ "</span> </div>"
									tag += "<div>" + rst.datas[i].content + "</div>"
									tag += "<div class='modi' id='modi_"+i+"'></div>"
									tag += "<div id='sub'><a href='/animal/commentdele?no="
											+ rst.datas[i].no
											+ "&owner="
											+ rst.datas[i].owner
											+ "'>삭제</a><a data-target='#modi_"+ i +"' class='modify'>수정</a>"
									tag += "<div> </div>"
									tag += "</div>";

								}

								for (var i = rst.paging.beginBlock; i <= rst.paging.endBlock; i++) {

									dex += "<a href='#' onclick='review(" + i
											+ ")'>" + i + "</a>"

								}

								$("#sub1").html(dex);

								$("#comment").html(tag);

							});

		}

		$(document)
				.on(
						"click",
						".modify",
						function() {
							console.log($(this).data("target"));

							$($(this).data("target"))
									.html(
											"<textarea id='content'></textarea><button id='ud'>수정완료</button>");

						});

		
		$(document).on("click", "#ud", function() {

			var no = $("#no").val();
			var content = $("#content").val();

			$.ajax({
				url : "/animal/commentupdate",
				data : {

					"no" : no,
					"content" : content

				}

			}).done(function() {

				location.reload();

			})

		})
	</script>







	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>