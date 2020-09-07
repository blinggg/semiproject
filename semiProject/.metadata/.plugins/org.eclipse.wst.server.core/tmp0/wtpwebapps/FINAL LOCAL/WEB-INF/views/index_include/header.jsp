<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
	* {
		font-family: '여기어때 잘난체 OTF';
	}
	body {
		background: black;
	}
@media ( min-width : 768px) {
	#logo {
		text-align: center;
		width: 500px;
		margin: auto;
	}
	#logoimg {
		margin-top: 60px;
		cursor: pointer;
		width: 300px;
	}
	p {
		cursor: pointer;
		font-size: 25px;
	}
}

@media ( max-width :767px) {
	#logo {
		text-align: center;
		width: 100px;
		margin: auto;
	}
	#logoimg {
		margin: 30px 0px 0px 0px;
		cursor: pointer;
		width: 180px;
		margin-left:-50%;
	}
	p {
		cursor: pointer;
		font-size: 15px;
	}
}
</style>
<div id="logo">
	<img id="logoimg" src="../display?fileName=gif7.gif">
	<p>방 울 방 울</p>
	<br>
</div>
<script>
	$("#logoimg,p").on("click", function() {
		location.href = "/index";
	})
</script>
