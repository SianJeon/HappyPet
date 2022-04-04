<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
﻿
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAMnt-_Z2cctrzhpar_Cfhl-G9jHfbpcY&callback=initMap"></script>
<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">${data.bsn_nm }</h1>
        </div>
    </div>
<div class="container" >
   <table class="table table-striped">
    <tbody>
      <tr>
        <th style="width:8%">대표자</th>
        <td style="width:12%">${data.rep_person }</td>
        <td style="width:80%" rowspan="3"><div id="map" style="height:350px;"></div></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${data.road_nm_addr }</td>
      </tr>
      <tr>
       <th>전화번호</th>
       <td>${data.tel_no }</td>
      </tr>
    </tbody>
  </table>

</div>

   
<script>

$(function(){
	 initMap();
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