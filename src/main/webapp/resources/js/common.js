/**
 * 
 */
function makePage(totalList, curPage, pageList, blockPage){
	
			var totalPage = Math.ceil(totalList/pageList);
			var totalBlock = Math.ceil(totalList/blockPage);
			var curBlock = Math.ceil(curPage/blockPage);
			var endPage = curBlock * blockPage;
			var beginPage = endPage - (blockPage-1);
			if( endPage > totalPage ) endPage = totalPage;
			
			var tag = '';
			
			if(curBlock > 1){
				tag = "<a title='처음' data-page='1'>"
				+"<i class='fas fa-angle-double-left'></i>"
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