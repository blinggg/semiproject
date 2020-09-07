<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A READ</title>
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

#th {
	padding: 15px;
	font-size: 25px;
	border-right: 3px solid #e360f2;
	border-left: 3px solid #e360f2;
	border-bottom: 1px solid #e360f2;
	width:200px;
}

th {
	padding: 15px;
	font-size: 25px;
	border-right: 3px solid #e360f2;
	border-bottom: 1px solid #e360f2;
	width:200px;
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

#reset,#btnDel{
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

#reset:active,#btnDel:active {
	background: #757575;
}

input[type="submit"]:active,#btnList:active {
	background: #cca6cf;
}

.date{
	height:15px;
	font-size:15px;
	text-align:center;
	padding:5px;
	border:none;
}
.text{
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
		<div class="title">⊙ Q&A READ ⊙</div>
		<br><br>
		<div id="content">
			<form name="frm" action="/QnAUpdate" method="post">
				<input type="hidden" name="page" value="${param.page}"> <input
					type="hidden" value="${vo.board_bno}" name="board_bno">
				<table id="tbl1">
					<tr>
						<th>TITLE</th>
						<td colspan=3>
							<input class="text" type="text" value="${vo.board_title}" name="board_title">
						</td>
					</tr>
					<tr>
						<th>WRITER</th>
						<td colspan=3>
							<input class="text" type="text" value="${vo.board_writer}" name="board_writer" readonly>
						</td>
					</tr>
					<tr>
						<th>DATE</th>
						<td>
							<input class="date" type="text" value="<fmt:formatDate value="${vo.board_regdate}" pattern="yyyy-MM-dd kk:mm:ss" />" readonly>
						</td>
						<th id="th">
							UPDATE DATE
						</th>
						<td>
							<input class="date" type="text" value="<fmt:formatDate value="${vo.board_updatedate}" pattern="yyyy-MM-dd kk:mm:ss" />" readonly>
						</td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<td colspan=3>
							<textarea name="board_content" rows=10 cols=54>${vo.board_content}</textarea>
						</td>
					</tr>
				</table>
				<div class="button">
					<c:if test="${users_id == vo.board_writer || users_note==1}">
						<input type="submit" value="UPDATE">
						<input type="reset" value="RESET" id="reset">
						<input type="button" value="DELETE" id="btnDel">
					</c:if>
					<input type="button" value="LIST" id="btnList">
				</div>
			</form>
			<jsp:include page="QnAReply.jsp"/>
		</div>
		</div>
	<jsp:include page="../index_include/chat.jsp"/>
	<jsp:include page="../index_include/top.jsp"/>
</body>
<script>
	$("#btnList").on("click", function(){
		var page=$(frm.page).val();
		location.href="QnA?page="+page;
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
		alert("게시글이 수정되었습니다!");
	});
	
	$("#btnDel").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return; 
		frm.action="/QnADelete";
		frm.submit();
		alert("게시글이 삭제되었습니다!");
	});
</script>
</html>