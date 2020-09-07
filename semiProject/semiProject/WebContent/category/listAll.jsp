<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#tbl{width:350px; margin:auto;}
		#pagination, h2{width:350px; margin:auto; text-align:center; margin-top:10px; margin-bottom:10px;}
		table {border-collapse:collapse;}
		td{border:1px solid black; height:30px; font-size:12px; padding:0px 5px 0px 5px;}
		table .title{background:#EAEAEA; text-align:center;}
		table .row:hover{background:gray; color:white;}
	</style>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>편의점</title>
</head>
<body>
	<div id="divAll">
		<h2>카 테 고 리</h2>
		<input type="hidden" id="selPerPage" value="5">
		<table id="tbl"></table>
		<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td width=100>카테고리코드</td>
			<td width=100>카테고리명</td>
		</tr>
		{{#each array}}
		<tr class="row">
			<td class="category_code">{{category_code}}</td>
			<td class="category_name">{{category_name}}</td>
		</tr>
		{{/each}}
		</script>
		<div id="pagination">
			<button id="btnPre">◀</button>
			<button id="btnNext">▶</button>
			[<span id="curPage"></span>/<span id="totPage"></span>]
		</div>
	</div>
</body>
<script>
	var url="list";
	
	$("#tbl").on("click", ".row", function(){
		var category_code=$(this).find(".category_code").html();
		var category_name=$(this).find(".category_name").html();
		$(opener.frm.category_code).val(category_code);
		$(opener.frm.category_name).val(category_name);
		window.close();
	});
	
	</script>
	<script src="../home.js"></script>
</html>