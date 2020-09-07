<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약하기</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

/* pc 화면 */
@media ( min-width : 768px) {
	#button {
		position: fixed;
		z-index: 999;
		right: 30px; /* 화면 오른쪽으로부터의 거리 */
		bottom: 90px; /* 화면 아래쪽으로부터의 거리 */
	}
}
/* 모바일 화면 */
@media ( max-width :767px) {
	#button {
		position: fixed;
		z-index: 999;
		right: 15px; /* 화면 오른쪽으로부터의 거리 */
		bottom: 45px; /* 화면 아래쪽으로부터의 거리 */
	}
}

#button{
	cursor:pointer;
}

</style>
</head>
<body>
	<div>
		<img id="button" src="../display?fileName=예약하기.png" width=120>
	</div>
</body>
<script>

$("#button").on("click",function(){
    location.href="/reservation/calendar";
});
</script>
</html>