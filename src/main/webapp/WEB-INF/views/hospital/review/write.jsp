<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>



    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">후기작성</h1>
        </div>
    </div>
	    
    <div class="container">
	    <form action="/hospital/write" onsubmit="return valid_form();">	    
			<input type="hidden" name="no" value="${data.no }"> 
			<label>제목 : &nbsp; </label><input type="text" name="title" class="w-50" id="title">
			
			<textarea class="form-control" id="p_content" name="content"></textarea>
	    	<br>
	    	<input type="submit" value="저장" class="btn btn-primary w-100 py-6">
	    </form>
	</div>
	
	<script>
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
	
	function valid_form() {
		if($("#title").val() == ""){
			$("#title").addClass("is-valid"); 
		}
		
		if($("#p_content").val()==""){
			$("#p_content").addClass("is-valid"); 
			$("#pwd_confirm").focus();
			return false;
		}
	}
	</script>



<jsp:include page="/WEB-INF/views/include/footer.jsp" />