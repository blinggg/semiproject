<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="../home.css" />
</head>
<body>
	<div id="divPage" style="background:#F2F2F2;">
		<div id="divTop"><jsp:include page="../top2.jsp" /></div>
		<div class="dropmenu">
				<ul id="dm_ul" style="background:#F2F2F2">
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
					<li><a href="/semiProject/bbs/list.jsp" style=text-decoration:none;color:#2569C9>이거어때?</a>
						<ul>
							<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
						</ul>
					</li>
					</ul>
					</div>
		<div id="divMenu"></div>
		<div id="divHeader">
			<h2>판 매 현 황</h2>
		</div>
		<div id="divCondition">
			<div id="divSearch">
				<select id="selKey">
					<option value="cvs_code">점주코드</option>
					<option value="product_code">상품코드</option>


				</select> <input type="text" id="txtWord"> <select id="selPerpage">
					<option value="3">3행</option>
					<option value="5">5행</option>
					<option value="10" selected>10행</option>
				</select> <input type="button" id="btnSearch" value="검색"> <span
					style="font-size: 12px;">검색수: <b id="count"></b>건
				
				</span>
				<div id="divSort">
					<select id="selOrder">
						<option value="cvs_code">점주코드</option>
						<option value="product_code">상품코드</option>

					</select> <select id="selDesc">
						<option value="">오름차순</option>
						<option value="desc">내림차순</option>
					</select>
				</div>
			</div>

		</div>
		<table id="tbl"></table>
		<script id="temp" type="text/x-handlebars-template">  
           <tr class="title">          
          	<td width=130>판매지점</td>    
           	<td width=130>상품명</td>
			<td width=130>판매수량</td> 
			<td width=130>판매단가</td>
			<td width=130>판매총금액</td>
			<td width=130>판매월</td> 
          </tr>       
         {{#each array}}       
          <tr class="row">       
             <td class="cvs_code">{{cvs_code}}</td>   
             <td class="product_code">{{product_name}}<br><font size="2" color="gray">[{{category_code}}{{product_code}}]</font></td>
			 <td class="sold_quantity">{{sold_quantity}}</td> 
			 <td class="price">{{price}}</td>
			 <td class="total">{{total}}</td>   
         	 <td class="month">{{month}}</td> 
           </tr>      
           {{/each}}
		</script>
		<div id="pagination">

			<button id="btnPre">◀</button>
			<button id="btnNext">▶</button>
			<div>
				[<span id="curPage"></span>/<span id="totPage"></span>]
			</div>

		</div>
		<div id="divFoot" style="text-align: center"><jsp:include
				page="../footer.jsp" /></div>
	</div>
</body>
<script>
var url = "/semiProject/Sell_Status/list";
$(".dropmenu ul li").hover(function() {
	$(this).find("ul").stop().fadeToggle(300);
})

	
</script>
<script src="../home.js"></script>
</html>