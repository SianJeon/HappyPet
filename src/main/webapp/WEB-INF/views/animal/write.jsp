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
	border: none;	
	border-radius: 5px;
	font-size: 16px;
	resize: none;
	
}
#content{
	resize:none;

}

#post_subject {
	font-size: 20px;
	border: none;
	border-bottom: 1px solid;
	border-radius: 0;
	padding: 8px 80px 30px 0;
	line-height: 1.2;
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
						name="title" class="no-margin" type="text" value placeholder="제목">

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
		<div style="text-align:center;">
			<input type="file" name="attach" />
			<input type="file" name="attach" />
			<input type="file" name="attach" />
		<button  type="submit" class="btn btn-secondary">등록</button>
		</div>

	
	</form>

	

	








	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>