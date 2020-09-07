<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link rel="stylesheet" href="../home3.css" />
</head>
<body>
	<div id="divPage" >
		<div id="divTop"><jsp:include page="../top2.jsp" /></div>
		<div class="dropmenu">
			<ul id="dm_ul" style="background:white">
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
						<li><a class=alist href="/semiProject/cart/cartList.jsp">발주등록</a></li>
						<li><a class=alist href="/semiProject/product/insert.jsp">상품등록</a></li>
					</ul>
				</li>&nbsp;&nbsp;&nbsp;
				<li>이건어때
					<ul>
						<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="divMenu"></div>
		<div id="divHeader">
			<h2>상 품 목 록</h2>
		</div>
		<div id="divCondition">
			<div id="divSearch">
				<select id="selKey">
					<option value="product_code">상품코드</option>
					<option value="product_name">상품명</option>
					<option value="company">제조사</option>

				</select> <input type="text" id="txtWord"> <select id="selPerpage">
					<option value="4">4행</option>
					<option value="8" selected>8행</option>
				</select> <input type="button" id="btnSearch" value="검색"> <span
					style="font-size: 12px;">검색수: <b id="count"></b>건
				</span>
				<div id="divSort">
					<select id="selOrder">
						<option value="product_code">상품코드</option>
						<option value="product_name">상품명</option>
						<option value="company">제조사</option>
					</select> <select id="selDesc">
						<option value="">오름차순</option>
						<option value="desc">내림차순</option>
					</select>
				</div>
			</div>
		</div>

		<div id="tbl" style="width:1600px;margin:auto;margin-right:30px"></div>
		<script id="temp" type="text/x-handlebars-template">
         {{#each array}}
            <div class="box">
               <div class="image">
				<a href="/semiProject/product/read?product_code={{product_code}}">
				<img class=imgs src="{{printImage img}}" width=300></a></div>
               <div class="product_name">{{product_name}}</div>
               <div class="product_price">{{product_price}}원</div>
 				<div class="prod_del">{{printDel prod_del}}</div>
            </div>
            {{/each}}
            </script>
		
	</div>
	<div id="pagination" style="margin-bottom:40px;">
	<div>[<span id="curPage"></span>/<span id="totPage"></span>]</div>
			<button id="btnPre">◀</button>
			<button id="btnNext">▶</button>
			
		</div>
	<div id="divFoot" style="text-align: center"><jsp:include page="../footer.jsp" /></div>
</body>
<script>
	
	$(".dropmenu ul li").hover(function() {
		$(this).find("ul").stop().fadeToggle(300);
	})
	var url = "/semiProject/product/list";

	//핸들바에서의 이미지 조건문
	Handlebars.registerHelper("printImage", function(img) {
		var src;
		if (img == null)
			src = "http://placehold.it/300x200";
		else
			src = "/img/product/" + img;
		return src;
	});

	//핸들바에서의 prod_del 조건문
	Handlebars.registerHelper("printDel",function(del){
            var src;
            if(del==1) src="판매중지";   
            else src="😃";   
            return src;
         });

</script>
<script src="../home.js"></script>
</html>