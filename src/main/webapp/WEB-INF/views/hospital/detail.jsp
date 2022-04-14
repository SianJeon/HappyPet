<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAMnt-_Z2cctrzhpar_Cfhl-G9jHfbpcY&callback=initMap"></script>
<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">${data.bsnNm }</h1>
        </div>
    </div>
<div class="container">
   <table class="table table-striped">
    <tbody>
      <tr>
        <th style="width:10%">대표자</th>
        <td style="width:20%">${data.repPerson }</td>
        <td style="width:70%" rowspan="3"><div id="map" style="height:350px;"></div></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${data.roadNmAddr }</td>
      </tr>
      <tr>
       <th>전화번호</th>
       <td>${data.telNo }</td>
      </tr>
    </tbody>
  </table>
</div>

<br>

<div class="container">
<h5>리뷰</h5>	
<form action="/hospital/writeReview" method="post"> 
	<input type="hidden" name="no" value="${data.no }"> 
	<input type="submit" value="후기작성" class="btn btn-primary">
</form>
    <table class="table table-striped reviewList" >
	    <thead>
		      <tr>
		        <th style="width:10%">no</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th style="width:10%">작성일</th>
		      </tr>
		</thead>
		<tbody id="hospital_review_list">
		</tbody>
	  </table>
		<div class='bteSet'>
			<div class='page-list container'></div>
		</div>
	  </div>
<script>

$(function(){
	 initMap();
  	 hospitalReview(1);
});

function hospitalReview(page){
	var no = ${data.no};
	$.ajax({
		url : "/hospital/reviewList",
		data: { no: no},
		success:function(obj){
			var _html = "";
			for(var i = 0 ; i <obj.list.length ; i++){
				_html += "<tr><td>"+ obj.list[i].rownum + "</td><td><a href='/hospital/reviewDetail?no="+ obj.list[i].no +"'>"+ obj.list[i].title +"</a></td><td>"
				+ obj.list[i].writer +"</td><td>"+ obj.list[i].writedate + "</td></tr>"
			}
			
			$("#hospital_review_list").html(_html);
			
			makePage(obj.count, page, 10, 10);
			
		},error:function(){
			alert("에러");
		}
	});
}

$(document).on('click', '.page-list a', function(){
	if( $('.reviewList').length > 0 )
		hospitalReview( $(this).data('page') );
	
});

//Initialize and add the map
function initMap() {
  // The location of Uluru
  const uluru = { lat: ${data.lat}, lng: ${data.lot} };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 16,
    center: uluru,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: uluru,
    map: map,
  });
  
}
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />