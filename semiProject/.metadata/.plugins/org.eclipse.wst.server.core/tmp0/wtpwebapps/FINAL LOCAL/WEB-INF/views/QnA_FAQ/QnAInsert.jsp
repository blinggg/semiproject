<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A INSERT</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px margin-top: 10px;
	text-align: center;
}

textarea{
	resize:none;
	font-size:20px;
	border:1px solid #BDBDBD;
	padding:10px;
	border-radius:5px 5px 5px 5px;
}

#tbl1 {
	width: 60%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
}

th {
	padding: 15px;
	font-size: 25px;
	border-right: 3px solid #e360f2;
	border-bottom: 1px solid #e360f2;
}

#btnList,input[type="submit"]{
	width:200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}

#reset{
	width:200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}

#reset:active {
	background: #757575;
}

input[type="submit"]:active,#btnList:active {
	background: #cca6cf;
}

#users_id,#title{
	height:25px;
	font-size:20px;
	text-align:center;
	border:none;
	padding:5px;
}

.button{
	padding:20px;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ Q&A INSERT ⊙</div>
		<br><br>
		<div id="content">
			<form name="frm" action="/QnAInsert" method="post">
				<input type="hidden" name="page" value="${param.page}">
				<table id="tbl1">
					<tr>
						<th width=200>TITLE</th>
						<td><input type="text" name="board_title" size=40 id="title"></td>
					</tr>
					<tr>
						<th width=200>WRITER</th>
						<td><input type="text" name="board_writer" size=40 value="${users_id}" readonly id="users_id"></td>
					</tr>
					<tr>
						<th width=200>CONTENT</th>
						<td><textarea name="board_content" rows=15 cols=56></textarea></td>
					</tr>
				</table>
				<div class="button">
					<input type="submit" value="저장"> 
					<input type="reset" id="reset" value="취소"> 
					<input type="button" value="목록" id="btnList">
				</div>
			</form>
		</div>
		</div>
	<jsp:include page="../index_include/chat.jsp" />
</body>
<script>
var users_id="${users_id}";
if(users_id == "") {
   $("#users_id").val("GUEST");
}

$("#btnList").on("click", function(){
   var page=$(frm.page).val();
   location.href="QnA?page="+page;
});

$(frm).submit(function(e){
   e.preventDefault();
   if($(frm.board_title).val()=="") {
      alert("제목을 입력하세요");
      return;
   } 
   
   if($(frm.board_content).val()=="") {
      alert("내용을 입력하세요");   
      return;
   }
   if(!confirm("저장하시겠습니까?")) return;
   
   frm.submit();
   
});
</script>
</html>