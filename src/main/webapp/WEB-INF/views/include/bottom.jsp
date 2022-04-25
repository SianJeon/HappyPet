<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <div>
	   <div class="toast" data-autohide="false">
		    <div class="toast-header">
		      <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		    </div>
		    <div class="toast-body">
		      	메시지가 도착했습니다.
		    </div>
	  </div>
  </div>
    
<script>
	var servername = location.host;
	var ws = new WebSocket("ws://"+servername +"/ws/alert");
	
	ws.onmessage = function(recv){
		//console.log(recv.data);
		
		var obj = JSON.parse(recv.data);
		
		$('.toast').toast('show');
	}
</script>

</body>
</html>
