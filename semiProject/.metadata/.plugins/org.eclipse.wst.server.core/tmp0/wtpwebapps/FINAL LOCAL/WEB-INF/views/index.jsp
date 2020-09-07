<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방울방울</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
 @font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family:'@여기어때 잘난체'}
@media ( min-width : 768px) {
#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: 3300px;
}
#content {
	margin-top:none;
	margin-left:70px;
	margin-right:70px;
	margin-top: 10px;
	text-align: center;
}

#tbl1 {
 	width:7%;
	float:left;
}

#tbl2 {
 	width:7%;
	float:left;
	margin-left: 1.3%;
	margin-right: 1.3%;
}

#tbl3 {
 	width:7%;
	float:right;
}

img {
	margin: 25px;
	padding: none;
}

#tbl1 img, #tbl2 img, #tbl3 img {
		width: 15%;
		margin: 0px;
	}

#img1,#img2,#img5,#img8,#img11,#img14{
	cursor:pointer;
}

#img-1,#img-2,#img-5,#img-8,#img-11{
	display:none;
	cursor:pointer;
}

#img13,#img14{
	margin:0px;
	width:100%;
}

.image{
	width: 250px;
	height: 200px;
	cursor: pointer;
}

.box {
	width: 15.5%;
	float: left;
	text-align: center;
	margin:2%;
	font-size:30px;
}

.image img {
	width: 180px;
	height: 120px;
	margin: auto;
	margin-bottom: 5px;
}

.title {
   font-size: 50px;
   text-align: center;
   margin: auto;
   margin-top:50px;
}

#tbl1 img,#tbl2 img,#tbl3 img{
	width:550px;
}
#img3{
	height:280px;
}
#img11,#img-11{
	height:850px;
}
}
</style>
</head>
<body id="body">
<jsp:include page="index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="index_include/header.jsp" />
		<div id="content">
			<table id="tbl1">
				<tr>
					<td>
						<img id="img1" src="display?fileName=jpg5.jpg">
						<img id="img-1" src="display?fileName=COUPLE.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img2" src="display?fileName=jpg2.jpg">
						<img id="img-2" src="display?fileName=PET.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img3" src="display?fileName=gif5.gif">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img4" src="display?fileName=jpg7.jpg">
					</td>
				</tr>
			</table>
			<table id="tbl2">
				<tr>
					<td>
						<img id="img5" src="display?fileName=jpg6.jpg">
						<img id="img-5" src="display?fileName=FAMILY.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img6" src="display?fileName=jpg10.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img7" src="display?fileName=gif1.gif">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img8" src="display?fileName=jpg1.jpg">
						<img id="img-8" src="display?fileName=PROFILE.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img9" src="display?fileName=jpg3.jpg">
					</td>
				</tr>
			</table>
			<table id="tbl3">
				<tr>
					<td>
						<img id="img10" src="display?fileName=gif2.gif">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img11" src="display?fileName=jpg8.jpg">
						<img id="img-11" src="display?fileName=FRIEND.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<img id="img12" src="display?fileName=jpg4.jpg">
					</td>
				</tr>
			</table>
			<img id="img13" src="display?fileName=introduce.jpg">
			<img id="img14" src="display?fileName=introduce1.jpg">
			<!-- photo_package 출력하기 -->
					<div class="title">⊙ PACKAGE ⊙</div>
				<div id="package">
						<div class="box">
							<img class="image" src="display?fileName=package_family6.jpg" onClick="location.href='/package/packageRead?photo_package_code=A1'">
							<br><a href="/package/packageRead?photo_package_code=A1">가족사진</a><br>
							190,000
						</div>
						<div class="box">
							<img class="image" src="display?fileName=package_couple2.jpg" onClick="location.href='/package/packageRead?photo_package_code=A2'">
							<br><a href="/package/packageRead?photo_package_code=A2">커플사진</a><br>
							50,000
						</div>
						<div class="box">
							<img class="image" src="display?fileName=package_profile2.jpg" onClick="location.href='/package/packageRead?photo_package_code=B2'" >
							<br><a href="/package/packageRead?photo_package_code=B2">프로필사진</a><br>
							28,000
						</div>
						<div class="box">
							<img class="image" src="display?fileName=package_pet7.jpg" onClick="location.href='/package/packageRead?photo_package_code=C1'">
							<br><a href="/package/packageRead?photo_package_code=C1">펫사진</a><br>
							19,900
						</div>
						<div class="box">
							<img class="image" src="display?fileName=package_friend2.jpg" onClick="location.href='/package/packageRead?photo_package_code=B1'">
							<br><a href="/package/packageRead?photo_package_code=B1">우정사진</a><br>
							30,000
						</div>	
				</div>
			<!-- photo_package 출력끝 -->	
		</div>
		
	</div>
	<jsp:include page="index_include/chat.jsp" />
	<jsp:include page="index_include/top.jsp" />
	<jsp:include page="index_include/popup.jsp"/>
</body>
<script>
	$(document).ready(function(){
		$(".items8").on("click",function(){
			var offset = $('.items8').offset(); //선택한 태그의 위치를 반환
	            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
	        $('html').animate({scrollTop : 3000}, 400);
		});
	
	});
	
	$("#img14").on("click",function(){
		location.href="/index_include/introduce";
	})
	
	/*read페이지로이동--------------------------------------------------*/
	$("#img-1").on("click",function(){
		location.href="/read/couple";
	});
	
	$("#img-5").on("click",function(){
		location.href="/read/family";
	});
	
	$("#img-2").on("click",function(){
		location.href="/read/pet";
	});
	
	$("#img-11").on("click",function(){
		location.href="/read/friend";
	});
	
	$("#img-8").on("click",function(){
		location.href="/read/profile";
	});
	$("#img1").on("click",function(){
		location.href="/read/couple";
	});
	
	$("#img5").on("click",function(){
		location.href="/read/family";
	});
	
	$("#img2").on("click",function(){
		location.href="/read/pet";
	});
	
	$("#img11").on("click",function(){
		location.href="/read/friend";
	});
	
	$("#img8").on("click",function(){
		location.href="/read/profile";
	});
	
	/*이미지hover-----------------------------------------------------*/
	$("#img1").hover(function(){
		$("#img1").hide();
		$("#img-1").show();
	});
	
	$("#img1").on("mouseleave",function(){
		$("#img-1").hide();
		$("#img1").show();
	});
	
	$("#img2").hover(function(){
		$("#img2").hide();
		$("#img-2").show();
	});
	
	$("#img2").on("mouseleave",function(){
		$("#img-2").hide();
		$("#img2").show();
	});
	
	$("#img5").hover(function(){
		$("#img5").hide();
		$("#img-5").show();
	});
	
	$("#img5").on("mouseleave",function(){
		$("#img-5").hide();
		$("#img5").show();
	});
	
	$("#img8").hover(function(){
		$("#img8").hide();
		$("#img-8").show();
	});
	
	$("#img8").on("mouseleave",function(){
		$("#img-8").hide();
		$("#img8").show();
	});

	$("#img11").hover(function(){
		$("#img11").hide();
		$("#img-11").show();
	});
	
	$("#img11").on("mouseleave",function(){
		$("#img-11").hide();
		$("#img11").show();
	});
</script>
</html>