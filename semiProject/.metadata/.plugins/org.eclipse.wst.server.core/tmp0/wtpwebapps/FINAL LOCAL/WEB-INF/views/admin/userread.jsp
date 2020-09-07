<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>USER INFO</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
	width: 50%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
	text-align: center;
	white-space: nowrap;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	margin-bottom: 10px;
}

.btn {
	text-align: center;
	padding: 30px;
}

td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
	overflow: hidden;
}

th {
	padding: 15px;
	font-size: 25px;
	width: 15%;
	border-bottom: 1px solid #e360f2;
	border-right: 3px solid #e360f2;
}

#pagination {
	padding: 20px;
	text-align: center;
}

.search {
	margin: auto;
	text-align: center;
	padding: 20px;
}

input[type="submit"]:active, input[type=button]:active {
	background: #cca6cf;
}

input[type="text"] {
	height: 25px;
	font-size: 20px;
	text-align: center;
	border: none;
	padding: 5px;
}

select {
	height: 30px;
	font-size: 20px;
	border: none;
}

input[type=submit], input[type=button] {
	width: 250px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

input[type="reset"] {
	width: 250px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

input[type="number"] {
	width: 80px;
}

input[type="reset"]:active {
	background: #757575;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ USER INFO ⊙</div>
		<form id="frm" action="/admin/userUpdate" method="post">
			<input type="hidden" value="${vo.users_id}" name="users_id">
			<input type="hidden" name="page" value="${param.page}">
			<table id="tbl1">
				<tr>
					<th>ID</th>
					<td>${vo.users_id}</td>
				</tr>
				<c:forEach items="vo">
					<tr>
						<th>NAME</th>
						<td>${vo.users_name}</td>
					</tr>
					<tr>
						<th>BIRTHDAY</th>
						<td><fmt:formatDate value="${vo.users_birthday}"
								pattern="yyyy년MM월dd일" /></td>
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td>${vo.users_address}</td>
					</tr>
					<tr>
						<th>TEL</th>
						<td>${vo.users_phone}</td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td>${vo.users_email}</td>
					</tr>
					<tr>
						<th>POINT</th>
						<td><fmt:formatNumber value="${vo.users_point}"
								pattern="#,### Point" /> + <input type="number" name="amount"
							value=0></td>
					</tr>
					<tr>
						<th>GENDER</th>
						<td>${vo.users_gender}</td>
					</tr>
					<tr>
						<th>SUBSCRIPTION DATE</th>
						<td><fmt:formatDate value="${vo.users_regdate}"
								pattern="yyyy년MM월dd일" /></td>
					</tr>
					<tr>
						<th>TYPE</th>
						<td><select name="users_note">
								<option value="0"
									<c:out value="${vo.users_note=='0'?'selected':''}"/>>회원</option>
								<option value="2"
									<c:out value="${vo.users_note=='2'?'selected':''}"/>>탈퇴</option>
								<option value="3"
									<c:out value="${vo.users_note=='3'?'selected':''}"/>>블랙리스트</option>
						</select></td>
					</tr>
				</c:forEach>
			</table>
			<div class="btn">
				<input type="submit" value="UPDATE"> <input type="reset"
					value="RESET"> <input type="button" value="LIST"
					id="btnList">
			</div>
		</form>
	</div>
	<jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
	})

	$("#btnList").on("click", function() {
		var page = $(frm.page).val();
		location.href = "/admin/userlist?page=" + page;
	});
</script>
</html>