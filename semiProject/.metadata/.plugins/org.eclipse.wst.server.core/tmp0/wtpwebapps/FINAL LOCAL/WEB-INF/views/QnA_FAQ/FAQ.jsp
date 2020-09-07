<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {font-family:'@여기어때 잘난체';}
#page {
	background: white; 
	margin: 15px;
	height: hidden;
}

#content {
	margin-top:none;
	margin-left:70px;
	margin-right:70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
	width:80%;
	margin:auto;
}

.title{
	font-size:50px;
	text-align:center;
	margin:auto;
}

.Q{
	float:left;
	font-size:50px;
	text-align:left;
	cursor: pointer;
}
.Qq{
	font-size:25px;
	text-align:center;
	cursor: pointer;
}

.Qq:hover{
	color: #e360f2;
}

.A{
	float:left;
	margin-left:0%;
	font-size:50px;
	text-align:left;
}

.Aa{
	width:80%;
	height:hidden;
	display: block;
	font-size:20px;
	text-align:center;
	background:#BDBDBD;
	margin:auto;
	padding:20px;
	border-radius:10px 10px 10px 10px;
}
#closeAll{
	text-align:center;
}

#ask,#ask2,#ask3,#ask4,#ask5,#ask6,#ask7,#ask8,#ask9,#ask10{
	margin:50px;
}

#close,#close2,#close3,#close4,#close5,#close6,#close7,#close8,#close9,#close10{
	width: 100px;
	height: 30px;
	font-size: 15px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

#closeAll button{
	width: 200px;
	height: 60px;
	font-size: 30px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

#closeAll button:active,#close:active,#close2:active,#close3:active,#close4:active,#close5:active,#close6:active,#close7:active,#close8:active,#close9:active,#close10:active {
	background: #cca6cf;
}

</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ FAQ ⊙</div>
		<br><br>
		<div id="closeAll"><button>전체 닫기</button></div>
		<div id="content">
			<div id="ask">
			<span class="Q">Q.</span>
				<span class="Qq">회원가입 후에만 예약할 수 있나요??</span>
			</div>
			<div id="reply">
			<span class="A">A.</span>
				<span class="Aa">죄송합니다. 저희 방울방울 스튜디오는 회원제로 이용가능한 사이트입니다.<br>
				현재 비회원 기능으로는 Q&A작성과 갤러리만 볼 수 있으며,<br>
				회원님들의 의견을 충분히 반영하여 비회원 예약이 가능할 수 있도록 노력하겠습니다!<br>
				<br>
				<button id="close">닫기</button></span>
			</div>
			<div id="ask2">
			<span class="Q">Q.</span>
				<span class="Qq">주차장이 따로 있나요? 없다면 스튜디오 근처에 공영주차장을 알 수 있을까요?</span>
			</div>
			<div id="reply2">
			<span class="A">A.</span>
				<span class="Aa">죄송합니다. 저희 스튜디오 내의 주차장은 존재하지 않으나 근처 공영주차장이 여러곳이 있으니 확인 후 주차하시면 되겠습니다~<br>
				<br>
				<button id="close2">닫기</button></span>
			</div>
			<div id="ask3">
			<span class="Q">Q.</span>
				<span class="Qq">제가 원하는 컨셉과 비용이 있는데 메뉴 상에는 없는것 같습니다. </span>
			</div>
			<div id="reply3">
			<span class="A">A.</span>
				<span class="Aa">자세한 답변은 카카오톡 오픈채팅 및 전화상담 이용 부탁드립니다.^^<br>
				<br>
				<button id="close3">닫기</button></span>
			</div>
			<div id="ask4">
			<span class="Q">Q.</span>
				<span class="Qq">출장 촬영에 대하여 문의합니다.</span>
			</div>
			<div id="reply4">
			<span class="A">A.</span>
				<span class="Aa">출장 촬영은 가능하나 예약된 스케줄을 보고 답변을 드릴 수 있습니다.<br>
				스케쥴 및 자세한 비용문의는 카카오톡 오픈 채팅 또는 전화상담 이용 부탁드립니다.^^<br>
				<br>
				<button id="close4">닫기</button></span>
			</div>
			<div id="ask5">
			<span class="Q">Q.</span>
				<span class="Qq">당일날 상품 변경이 가능한가요?</span>
			</div>
			<div id="reply5">
			<span class="A">A.</span>
				<span class="Aa">당일 상품 변경은 불가합니다.<br>
				패키지 안에 야외촬영이 포함되어 있는 경우 일정을 미루시거나 시간 조정후 촬영 가능하십니다~<br>
				<br>
				<button id="close5">닫기</button></span>
			</div>
			<div id="ask6">
			<span class="Q">Q.</span>
				<span class="Qq">촬영시간은 얼마나 걸리나요?</span>
			</div>
			<div id="reply6">
			<span class="A">A.</span>
				<span class="Aa">촬영시간은 정확히 말씀 드릴 수 없으나 패키지에 따라 다른 편이며, <br>
				패키지 촬영의 경우 평균 소요시간은 대략 1-2시간 정도 소용될 수 있습니다!(상품,날씨,변수,상황에 따라 다를 수 있습니다.)<br>
				<br>
				<button id="close6">닫기</button></span>
			</div>
			<div id="ask7">
			<span class="Q">Q.</span>
				<span class="Qq">예약 방법은 어떻게 되나요?</span>
			</div>
			<div id="reply7">
			<span class="A">A.</span>
				<span class="Aa">저희 방울방울 스튜디오는 더 좋은 서비스와 고객님들의 인생사진을 제공해 드리기 위해 예약제로 운영되고 있습니다.<br>
				카카오톡 오픈채팅 또는 해당 사이트 예약 페이지를 이용해 예약 및 문의가 가능하십니다.^^<br>
				<br>
				<button id="close7">닫기</button></span>
			</div>
			<div id="ask8">
			<span class="Q">Q.</span>
				<span class="Qq">상품제작기간은 얼마나 소요되며 어떻게 받나요?</span>
			</div>
			<div id="reply8">
			<span class="A">A.</span>
				<span class="Aa">앨범 및 사진의 제작 기간은 약 2주 정도 입니다!<br>
				상품은 방울방울 스튜디오에 방문하셔서 제작된 상품의 이상이 없는 지 확인 후 찾아보실수 있습니다.<br>
				또한 상품 배송중 파손의 위험이있는 액자의 경우를 제외하고 택배배송 서비스도 이용하실 수 있으며,<br>
				증명사진 또는 간단한 사진촬영 후 인쇄된 사진은 촬영후 20분 정도면 바로 찾아보실 수 있습니다!<br>
				<br>
				<button id="close8">닫기</button></span>
			</div>
			<div id="ask9">
			<span class="Q">Q.</span>
				<span class="Qq">방울방울 스튜디오의 휴일 및 영업시간을 알려주세요!</span>
			</div>
			<div id="reply9">
			<span class="A">A.</span>
				<span class="Aa">저희 방울방울 스튜디오의 휴일은 매주 화요일이며, 영업시간은 am 9시30분 ~ pm 6시30분까지입니다.<br>
				특별한경우 전화 예약을 이용하시어 휴일인 화요일도 예약하실 수 있습니다.<br>
				<br>
				<button id="close9">닫기</button></span>
			</div>
			<div id="ask10">
			<span class="Q">Q.</span>
				<span class="Qq">방울방울 스튜디오 내에서 코스튬 상품을 구매할 수 있나요?</span>
			</div>
			<div id="reply10">
			<span class="A">A.</span>
				<span class="Aa">죄송합니다. 저희 방울방울 스튜디오에서 COSTUME상품은 촬영내에서 대여만 가능하시며,<br>
				구매는 불가 하십니다!<br>
				<br>
				<button id="close10">닫기</button></span>
			</div>
		</div>
	</div>
	<jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
	
	$("#reply").hide();
	$("#reply2").hide();
	$("#reply3").hide();
	$("#reply4").hide();
	$("#reply5").hide();
	$("#reply6").hide();
	$("#reply7").hide();
	$("#reply8").hide();
	$("#reply9").hide();
	$("#reply10").hide();
	
	$("#ask").on("click", function(){
		$("#reply").show();
	});
	$("#ask2").on("click", function(){
		$("#reply2").show();
	});
	$("#ask3").on("click", function(){
		$("#reply3").show();
	});
	$("#ask4").on("click", function(){
		$("#reply4").show();
	});
	$("#ask5").on("click", function(){
		$("#reply5").show();
	});
	$("#ask6").on("click", function(){
		$("#reply6").show();
	});
	$("#ask7").on("click", function(){
		$("#reply7").show();
	});
	$("#ask8").on("click", function(){
		$("#reply8").show();
	});
	$("#ask9").on("click", function(){
		$("#reply9").show();
	});
	$("#ask10").on("click", function(){
		$("#reply10").show();
	});
	
	$("#close").on("click", function(){
		$("#reply").hide();
	});
	$("#close2").on("click", function(){
		$("#reply2").hide();
	});
	$("#close3").on("click", function(){
		$("#reply3").hide();
	});
	$("#close4").on("click", function(){
		$("#reply4").hide();
	});
	$("#close5").on("click", function(){
		$("#reply5").hide();
	});
	$("#close6").on("click", function(){
		$("#reply6").hide();
	});
	$("#close7").on("click", function(){
		$("#reply7").hide();
	});
	$("#close8").on("click", function(){
		$("#reply8").hide();
	});
	$("#close9").on("click", function(){
		$("#reply9").hide();
	});
	$("#close10").on("click", function(){
		$("#reply10").hide();
	});
	
	$("#closeAll button").on("click", function(){
		$("#reply").hide();
		$("#reply2").hide();
		$("#reply3").hide();
		$("#reply4").hide();
		$("#reply5").hide();
		$("#reply6").hide();
		$("#reply7").hide();
		$("#reply8").hide();
		$("#reply9").hide();
		$("#reply10").hide();
	});
</script>
</html>