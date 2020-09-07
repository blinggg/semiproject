<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PACKAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	padding-bottom: 30px;
	height: hidden;
}

#content {
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
	height: 400px;
}

.image {
	cursor: pointer;
}

.box {
	width: 15%;
	float: left;
	text-align: center;
	margin: 38px;
	font-size: 30px;
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
	margin-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ PACKAGE ⊙</div>
		<br> <br>
		<div id="content">
			<input type="hidden" value="${cri.page}">
			<div id="package">
				<div class="box">
					<div>
						<img class="image" src="../display?fileName=package_family6.jpg"
							onClick="location.href='/package/packageRead?photo_package_code=A1'" width=250 height=200>
					</div>
					<div>
						<a href="/package/packageRead?photo_package_code=A1">가족사진</a>
					</div>
					<div>190,000</div>
				</div>
				<div class="box">
					<div>
						<img class="image" src="../display?fileName=package_couple2.jpg"
							onClick="location.href='/package/packageRead?photo_package_code=A2'" width=250 height=200>
					</div>
					<div>
						<a href="/package/packageRead?photo_package_code=A2">커플사진</a>
					</div>
					<div>50,000</div>
				</div>
				<div class="box">
					<div>
						<img class="image" src="../display?fileName=package_profile2.jpg"
							onClick="location.href='/package/packageRead?photo_package_code=B2'" width=250 height=200>
					</div>
					<div>
						<a href="/package/packageRead?photo_package_code=B2">프로필사진</a>
					</div>
					<div>28,000</div>
				</div>
				<div class="box">
					<div>
						<img class="image" src="../display?fileName=package_pet7.jpg"
							onClick="location.href='/package/packageRead?photo_package_code=C1'" width=250 height=200>
					</div>
					<div>
						<a href="/package/packageRead?photo_package_code=C1">펫사진</a>
					</div>
					<div>19,900</div>
				</div>
				<div class="box">
					<div>
						<img class="image" src="../display?fileName=package_friend2.jpg"
							onClick="location.href='/package/packageRead?photo_package_code=B1'" width=250 height=200>
					</div>
					<div>
						<a href="/package/packageRead?photo_package_code=B1">우정사진</a>
					</div>
					<div>30,000</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
	//페이지를 클릭했을 때
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "costumeList?page=" + page;
	});
</script>
</html>