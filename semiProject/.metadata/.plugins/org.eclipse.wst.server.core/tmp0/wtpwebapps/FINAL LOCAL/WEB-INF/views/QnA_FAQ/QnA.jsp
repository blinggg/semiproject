<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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

#tbl1 {
	width: 70%;
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
	border-bottom: 3px solid #e360f2;
}
.row2:hover {
	background:hotpink;
	cursor: pointer;
	color:#fff;
}

#pagination{
	padding:20px;
}

#btnInsert{
	width: 100px;
	height: 30px;
	float:right;
	font-size: 15px;
	margin-right: 18%;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
}

#insert{
	width: 100%;
	height: 30px;
	float:right;
}

#btnInsert:active {
	background: #cca6cf;
}

.active {
	color: hotpink;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ Q&A ⊙</div>
		<br><div id="insert"><button id="btnInsert">글쓰기</button></div><br>
		<div id="content">
			<table id="tbl1">
				<tr class="title2">
					<th width=100>글번호</th>
					<th width=100>제목</th>
					<th width=100>작성자</th>
					<th width=100>게시일</th>
					<th width=100>조회수</th>
					<th width=100>댓글수</th>
				</tr>
				<c:forEach items="${QnAList}" var="vo">
					<tr class="row2">
						<td class="board_bno">${vo.board_bno}</td>
						<td>${vo.board_title}</td>
						<td>${vo.board_writer}</td>
						<td><fmt:formatDate value="${vo.board_regdate}" pattern="yyyy-MM-dd kk:mm"/></td>
						<td>${vo.board_viewcnt}</td>
						<td>${vo.board_replycnt}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div id="pagination">
		        <c:if test="${pm.prev}">
		            <a href="${pm.startPage-1}">◀</a>
		        </c:if>
		        <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
		            <c:if test="${pm.cri.page == i }">
		                [<a href="${i}" class='active'>${i}</a>]
		            </c:if>
		            <c:if test="${pm.cri.page != i }">
		                [<a href="${i}">${i}</a>]
		            </c:if>
		        </c:forEach>
		        <c:if test="${pm.next}">
		            <a href="${pm.endPage+1}">▶</a>
		        </c:if>
    		</div>
    		<input type="hidden" id="page2" value="${pm.cri.page}">
		</div>
	</div>
	<jsp:include page="../index_include/chat.jsp" />
</body>
<script>
	  
	$("#tbl1").on("click", ".row2", function(){
		var board_bno=$(this).find(".board_bno").html();
		var page=$("#page2").val();
		location.href="QnARead?board_bno="+board_bno+"&page="+page;
	});
	
	$("#btnInsert").on("click", function(){
		var page=$("#page2").val();
		location.href="QnAInsert?page="+page;;
	})
	
	$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="QnA?page="+page;
});
</script>
</html>