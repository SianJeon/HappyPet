<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
textarea {
	width: 100%;
	height: 500px;
	padding: 10px 0px 10px 10px;
	border: 1px solid #00f2ee;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

#content {
	resize: none;
}

#post_subject {
	font-size: 20px;
	border: none;
	border-bottom: 1px solid #00f2ee;
	background-color: rgba(0, 0, 0, 0);
	border-radius: 0;	color: skyblue;
	padding: 8px 80px 30px 0;
	line-height: 1.2;
}

#test_btn2 {
	
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#btn_group button {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

#btn_group button:hover {
	color: white;
	background-color: skyblue;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: skyblue;
	cursor: pointer;
	border: 1px solid #4cae4c;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox {
	text-align: center;
}
.filebox label:hover {
	color:white;
	background-color: skyblue;
}

.filebox label:active {
	background-color: skyblue;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/add" enctype="multipart/form-data">
		<div class="container">
			<div class="row">

				<div class="col-sm-12 col-xs-12 right write-body"
					style="padding: 50px;">

					<input id="post_subject" class="no-margin" type="text"
						name="writer" placeholder="작성자"> <input id="post_subject"
						name="title" class="no-margin" type="text" placeholder="제목">

				</div>
				<div class="col-sm-12 col-xs-12" style="padding: 30px;">

					

					<textarea name="content" id="content">

★ 아이 이름 : 

★ 견종 or 묘종 : 

★ 입양 반려묘 일상 및 후기 :

★[해피펫몰은 현재 무료입소 제공 유기동물지원사업 등 동물을 위한 캠페인을 함께하고 있습니다.]

이미지 필수로 넣으셔야 됩니다.



양식조건 미충족 사유로 반려처리될 수 있으므로 참고 부탁드리겠습니다.

또는 리뷰 글 삭제, 비공개 시 혜택이 제한될 수 있습니다.
					
		
						</textarea>
				</div>
			</div>
		</div>


		<div class="filebox" id="btn_group">
			<label for="ex_file">업로드</label> 
			<input type="file" id="ex_file">
			<input type="file" id="ex_file">
			<input type="file" id="ex_file">
			<button type="submit" id="test_btn2">등록</button>
		</div>


	</form>












	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>