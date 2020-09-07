<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>USERS LIST</title>
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
	text-align: center;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	margin-top:10px;
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

#btnInsert {
	text-align: center;
}

.row:hover {
	background:hotpink;
	cursor: pointer;
	color:#fff;
}

#pagination{
	padding:20px;
	text-align:center;
}

.search{
	margin:auto;
	text-align:center;
	padding:20px;
}

input[type="submit"]{
	width: 100px;
	height: 30px;
	font-size: 15px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

.active {
	color: hotpink;
}

input[type="submit"]:active {
	background: #cca6cf;
}

input[type="text"]::placeholder {
	text-align: center;
}

input[type="text"]{
	height: 25px;
	font-size: 20px;
	text-align: center;
	border: none;
	padding: 5px;
}

select{
	height: 30px;
	font-size: 20px;
	border: none;
}

hr{
	border: 2px solid #e360f2;
	width:70%;
}

#total{
	text-align:center;
}

</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
	<jsp:include page="../index_include/header.jsp" />
	<div id="total">USERS COUNT : ${pm.totalCount}</div>
	<div class="title">⊙ USERS LIST ⊙</div>
	<div>
		<form name="frm" action="/admin/userlist">
		<div class="search">
			<select name="searchType">
				<option value="users_id"
					<c:out value="${cri.searchType=='users_id'?'selected':''}"/>>ID</option>
				<option value="users_name"
					<c:out value="${cri.searchType=='users_name'?'selected':''}"/>>NAME</option>
				<option value="users_point"
					<c:out value="${cri.searchType=='users_point'?'selected':''}"/>>POINT</option>
			</select>
				<input type="text" name="keyword" value="${cri.keyword}"size=50 placeholder="SEARCH TERM"> 
				<input type="submit" value="SEARCH">
			</div><hr>
		</form>
	</div>
	<table id="tbl1">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>BIRTHDAY</th>
			<th>TEL</th>
			<th>E-MAIL</th>
			<th>POINT</th>
			<th>TYPE</th>
		</tr>
		<c:forEach items="${userlist}" var="vo">
			<tr class="row">
				<td class="users_id">${vo.users_id}</td>
				<td>${vo.users_name}</td>
				<td><fmt:formatDate value="${vo.users_birthday}" pattern="yyyy년MM월dd일" /></td>
				<td>${vo.users_phone}</td>
				<td>${vo.users_email}</td>
				<td><fmt:formatNumber value="${vo.users_point}" pattern="#,### Point" /></td>
				<td><c:if test="${vo.users_note==0}">
						회원
					</c:if> <c:if test="${vo.users_note==2}">
						탈퇴
					</c:if> <c:if test="${vo.users_note==3}">
						블랙리스트
					</c:if></td>
			</tr>
		</c:forEach>

	</table>
	<input type="hidden" id="page2" value="${pm.cri.page}">
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
</div>
	<jsp:include page="../index_include/chat.jsp"/>
	<jsp:include page="../index_include/top.jsp"/>
</body>
<script>
	$("#tbl1").on("click",".row",function() {
		var users_id = $(this).find(".users_id").html();
		var page = $("#page2").val();
		location.href = "/admin/userread?users_id=" + users_id + "&page=" + page;
	});

	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "userlist?page=" + page;
	});
</script>
</html>