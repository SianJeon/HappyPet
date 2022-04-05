 <%@ page contentType="text/html; charset=UTF-8"%>
 <div class = "row text-center" style = "padding-top : 30px">
        <div class = "col-6">
            <div class = "nav-item nav-link active bg-action" data-mode = "market/insert">
                상품 등록
            </div>
        </div>
    <div class = "col-6">
        <div class = "nav-item nav-link modi" data-mode = "market/modify">
            상품 수정
        </div>
    </div>
        
<script>
    $(".nav-item").on("click", function(e){
        
        $(".nav-item").each(function() {
            if(e.target == this) {
                $(this).css("background-color", "khaki");
                $(this).css("border", "1px solid thistle");
            }else {
                $(this).css("background-color", "white");
                $(this).css("border", "0px");
            }
        });
         
		$.ajax("/"+$(this).data("mode")).done(function(inner){

			$("#mView").html(inner)
		});

       
    });
</script>