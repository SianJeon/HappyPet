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
	<nav aria-label="Page navigation example">
		<ul class="pagination page-list">
			<li class="page-item"><a class="page-link" datapage='1'>Start</a></li>
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
			<li class="page-item"><a class="page-link" href="#">End</a></li>
		</ul>
	</nav>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
		$(function(){
			hospital_list(1);
		});
		
		var pageList = 10;
		
		function hospital_list(page){
			$.ajax({
				url : "/hospital/list",
				data: {page: page, rows: pageList},
				success:function(li){
					var _html = "";
					for(var i = 0 ; i <li.length ; i++){
						_html += "<tr><td><a href='hospital/detail?no=" + li[i].no + "'>" + li[i].bsn_nm + "</a></td><td>"+ li[i].road_nm_addr +"</td><td>"+ li[i].tel_no + "</td></tr>"
					}
					
					$("#hospital_list").html(_html);
					
					makePage(li.length, page, pageList, 5);
				},error:function(){
					alert("에러");
				}
			});
		}
		
		
		function makePage(totalList, curPage, pageList, blockPage){
	
			var totalPage = Math.floor(totalList/pageList);
			var totalBlock = Math.ceil(totalList/blockPage);
			var curBlock = Math.ceil(curPage/blockPage);
			var endPage = curBlock * blockPage;
			var beginPage = endPage - (blockPage-1);
			if( endPage > totalPage ) endPage = totalPage;
			
			var tag = '';
			if(curBlock > 1){
				tag = "<li class='page-item'><a class='page-link' datapage='1'>Start</a></li>"
				+"<a title='이전' data-page='"+ (beginPage-blockPage) +"'><i class='fas fa-angle-left'></i></a>";
			}
			
			for(var no = beginPage; no <= endPage; no++){
				if( no == curPage){
					tag += "<span class='page-on'>" + no + "</span>";
				}else{
					tag += "<a data-page='" + no + "'>" + no + "</a>";
				}
			}
			
			if( curBlock < totalBlock){
				tag += "<a title='다음' data-page="+(endPage+1)+"><i class='fas fa-angle-right'></i></a>"
				+ "<a title='마지막' data-page="+totalPage+"><i class='fas fa-angle-double-right'></i></a>";
			}
			$('.page-list').html(tag);
		}
		
		$(document).on('click', '.page-list a', function(){
			if( $('.hospital').length > 0 )
				hospital_list( $(this).data('page') );
			
		}).on('change', '#pageList', function(){
			pageList = $(this).val();

		})
	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />