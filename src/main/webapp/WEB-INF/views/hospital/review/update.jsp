<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container py-5">
		<h1 class="display-1 text-white animated slideInDown">
			후기 수정
		</h1>
	</div>
</div>

 <div class="container">
	    <form:form action="/hospital/reviewModify">	    
			<input type="hidden" name="no" value="${data.no }"> 
			<label>제목 : &nbsp; </label><input type="text" name="title" class="w-50" value="${data.title }">
			
			<textarea class="form-control" id="p_content" name="content">${data.content }</textarea>
	    	<br>
	    	<input type="submit" value="저장" class="btn btn-primary w-100 py-6">
	    </form:form>
	</div>
	
	<script>
	function valid_form() {
		if($("#title").val() == ""){
			$("#title").addClass("is-valid"); 
			alert('제목을 입력하세요!');
			return false;
		}
		
		

		if(editor.getData() == ""){
			$("#p_content").addClass("is-valid"); 
			alert('내용을 입력하세요!');
			return false;
		}
	}
	
	ClassicEditor
    .create(document.querySelector("#p_content"),
        {
            language: "ko",
            simpleUpload:
            {
                uploadUrl: "/hospital/review/upload",
                withCredentials: true,
            }
        })
    .then(newEditor => {
        editor = newEditor;
    })
    .catch(error => {
        console.error(error);
    });
	</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />