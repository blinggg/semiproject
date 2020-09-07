<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>24/7 TFS</title>
<link rel="stylesheet" href="home.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="divPage">
		<div id="divCenter">
			<c:if test="${cvs_id==null and company_id==null}">
			<div id="divTop"><jsp:include page="top.jsp" /></div>
			<div class="dropmenu">
				<ul id="dm_ul">
					<li><a id=plist href="denied.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;
					
					<li>현황관리
						<ul>
							<li><a class=alist href="denied.jsp">재고현황</a></li>
							<li><a class=alist href="denied.jsp">판매현황</a></li>
							<li><a class=alist href="denied.jsp">발주현황</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>등록관리
						<ul>
							<li><a class=alist href="denied.jsp">발주등록</a></li>
							<li><a class=alist href="denied.jsp">상품등록</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>이건어때
						<ul>
							<li><a class=alist href="denied.jsp">제안해요</a></li>
						</ul>
					</li>
					</ul>
					</div>
					<img id="logo" src=../images/tfs_logo.JPG>
					</c:if>
					<c:if test="${cvs_id!=null or company_id!=null}">
			<div id="divTop"><jsp:include page="top2.jsp" /></div>
			<div class="dropmenu">
				<ul id="dm_ul">
					<li><a id=plist href="../product/list.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;
					
					<li>현황관리
						<ul>
							<li><a class=alist href="../stock/list.jsp">재고현황</a></li>
							<li><a class=alist href="../sell_status/list.jsp">판매현황</a></li>
							<li><a class=alist href="../order/list.jsp">발주현황</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>등록관리
						<ul>
							<li><a class=alist href="../cart/cartList.jsp">발주등록</a></li>
							<li><a class=alist href="../product/insert.jsp">상품등록</a></li>
						</ul>
					</li>&nbsp;&nbsp;&nbsp;
					<li>이건어때
						<ul>
							<li><a class=alist href="../bbs/list.jsp">제안해요</a></li>
						</ul>
					</li>
					</ul>
					</div>
					<img id="logo" src=../images/tfs_logo.JPG>
					</c:if>
			<div id="main">
				
				<div id="divContent" style="width: 100%; margin: auto">

					<!--여기에 내용출력 시작---------------------------- -->
					<div style=text-align:center>
						
						<img src=/semiProject/images/KakaoTalk_20200619_135346924.png>
						<img src=/semiProject/images/KakaoTalk_20200619_135347129.png>
						<img src=/semiProject/images/KakaoTalk_20200619_135346601.png>
					</div>
			<!--여기까지가 내용입니다.---------------------------- -->
			<div id="divFoot" style="text-align: center;"><jsp:include page="footer.jsp" /></div>
		</div>
	</div>
</body>
<script>
	$(".dropmenu ul li").hover(function(){
		$(this).find("ul").stop().fadeToggle(300);
	})
</script>
</html>