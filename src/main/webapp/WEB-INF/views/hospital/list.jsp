<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">제휴병원</h1>
        </div>
    </div>
    <div class="row g-12" style="margin: 0 25%;">
    <h3>제휴 병원리스트</h3>
    <hr>	
    <table class="table table-striped hospital" >
	    <thead>
		      <tr>
		        <th>상호명</th>
		        <th>주소</th>
		        <th>전화번호</th>
		      </tr>
		</thead>
		<tbody id="hospital_list">
		</tbody>
	  </table>
		<div class='bteSet'>
			<div class='page-list container'></div>
		</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
		$(function(){
			hospital_list(1);
		});
		
		function hospital_list(page){
			$.ajax({
				url : "/hospital/list",
				data: {page: page},
				success:function(obj){
					var _html = "";
					for(var i = 0 ; i <obj.item.length ; i++){
						_html += "<tr><td><a href='hospital/detail?no=" + obj.item[i].no + "'>" + obj.item[i].bsn_nm + "</a></td><td>"+ obj.item[i].road_nm_addr +"</td><td>"+ obj.item[i].tel_no + "</td></tr>"
					}
					
					$("#hospital_list").html(_html);
					
					makePage(obj.total, page, 10, 5);
				},error:function(){
					alert("에러");
				}
			});
		}
		
		
		$(document).on('click', '.page-list a', function(){
			if( $('.hospital').length > 0 )
				hospital_list( $(this).data('page') );
			
		});
	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />