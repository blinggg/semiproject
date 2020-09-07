<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>24/7</title>
<link rel="stylesheet" href="../home.css">
<style>
#divContent {
	height: 300px;
}

#divContent table {
	margin-top: 100px;
}
</style>
</head>
<body>
	<div id="divPage" style="height:700px">
		<div id="divCenter">
			<div id="divTop"><jsp:include page="../top.jsp" /></div>
			<div class="dropmenu">
				<ul id="dm_ul">
					<li><a id=plist href="/semiProject/product/list.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;

					<li>현황관리
						<ul>
							<li><a class=alist href="/semiProject/stock/list.jsp">재고현황</a></li>
							<li><a class=alist href="/semiProject/sell_status/list.jsp">판매현황</a></li>
							<li><a class=alist href="/semiProject/order/list.jsp">발주현황</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>등록관리
						<ul>
							<li><a class=alist href="/semiProject/order/insert.jsp">발주등록</a></li>
							<li><a class=alist href="/semiProject/product/insert.jsp">상품등록</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>이건어때
						<ul>
							<li><a class=alist href="/semiProject/bbs/insert.jsp">칭찬해요</a></li>
							<li><a class=alist href="/semiProject/bbs/binsert.jsp">제안해요</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<img id="logo" src=../images/tfs_logo.JPG>
			<div id="divContent">
				<!--여기에 내용출력 시작--------------------#8ABCEE-------- -->
				<div
					style="text-align: center; margin-top: 100px; background: #3BA22F; border: 1px solid #2569C9; border-radius: 10px; width: 330px; height: 330px; margin: auto; margin-top: 100px; margin-bottom: 100px;">
					<form name="frm" action="company_login" method="post">
						<h1 style="color: white;margin-bottom:25px;margin-top:50px">관리자로그인</h1>
						<div style= height:30px;color:white;font-weight:bold>
							<span>아이디</span>&nbsp;&nbsp;&nbsp; <span><input type="text" name="company_id" size=20;></span>
						</div>
						<div style= height:30px;color:white;font-weight:bold>
							<span>비밀번호</span> <span><input type="password" name="pass" size=20;></span>
						</div>
						<div style= height:50px;margin-top:40px;font-color:#C14428>
							<input type="submit" class="button" value="LOGIN">
						</div>
					</form>
				</div>
				<!--여기에 내용출력 종료---------------------------- -->
			</div>
		</div>
		
	</div>
	<div id="divFoot" style="text-align: center;"><jsp:include page="../footer.jsp" /></div>
</body>
<script>
	$(frm).submit(function(e) {
		var company_id = $(frm.company_id).val();
		var pass = $(frm.pass).val();

		e.preventDefault();
		$.ajax({
			type : "post",
			url : "company_login",
			dataType : "json",
			data : {
				"company_id" : company_id,
				"pass" : pass
			},
			success : function(data) {
				if (data.check == 0) {
					alert("id가 존재하지 않습니다!");
				} else if (data.check == 1) {
					alert("id와 비밀번호가 일치하지 않습니다!");
				} else {
					location.href = "../index.jsp";
				}
			}
		});
	});
</script>
</html>