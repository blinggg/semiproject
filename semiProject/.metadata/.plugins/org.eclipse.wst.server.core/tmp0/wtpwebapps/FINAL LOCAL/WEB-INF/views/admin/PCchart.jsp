<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PACKAGE CHART</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <style>
* {
	font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	height: hidden;
}

#content {
	 display:inline-block;
   margin:10%;
   margin-top: 10px;
   margin-bottom: 40px;
   text-align: center;
   width: 80%;
   height:hidden;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	margin-top:10px;
}

#Pchart{
   float:left;
   width:48%;
}

#Cchart {
   float:right;
   width:48%;
}

</style>
</head>
<body><jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ CHART ⊙</div>
		<div id="content">
			<div id="Pchart"><jsp:include page="../admin/packagechart.jsp" /></div>
			<div id="Cchart"><jsp:include page="../admin/costumechart.jsp" /></div>
		</div>
	</div>
</body>
</html>