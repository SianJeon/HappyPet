<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

.img-fluid {

	height: 15rem;
}
.d-flex{
	display: flex;
	justify-content: space-evenly
}

</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="row" >
	
	
</div>

	
	</div>
		
		<c:forEach var="i" begin="1" end="10">
		
		<a id="ths" href="javascript:anList(${i})">${i}</a>	
		
		
		</c:forEach>
		
	
	
	
<script type="text/javascript">

	
		

		
		function anList(no){
			var tag = "";
	
			$.ajax({
		 		 	url:"/animal/list",
		 		 	
		 		 	data :{
		 		 		
		 		 		"pageNo" : no
		 		 		}
		 		 	
		 			 	
			  }).done(function(rst){
		  			 
			
					
				  for(var i=0; i<rst.length;i++) {
	          
					 
					  tag += "<div class='col-lg-3 p-3'>"	
					  tag += "<div class='card '>"
					  tag += "<a href='/detail'><img class='card-img-top img-fluid' src="+rst[i].popfile+"><a>"
					  tag += "<div class='card-body'>"
					  tag += "<h5 class='card-title'>"+rst[i].kindCd+"</h4>"
					  tag += "<h5 class='card-title'>"+rst[i].age+"</h4>"
					  tag += "<h5 class='card-title'>"+rst[i].weight+"</h4>"
					  tag += "<p class='card-text'>"+rst[i].specialMark+"</p>"
					  tag += "</div>"
					  tag += "</div>"
					  tag += "</div>"
					  
	                }
				
					  

					  
				  
				
				  $(".row").html(tag);
	 	 })	
		  
		}	
	
	anList(1);
	
	
	
	
	

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>