<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품</title>
<link rel="stylesheet" href="../home2.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
img{height:50px}
</style>
</head>
<body style=background:#F2F2F2>
   <div id="divPage" style="background:#F2F2F2">
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
						<li><a class=alist href="/semiProject/order/insert.jsp">발주등록</a></li>
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
         <h2>상 품 목 록</h2>
      </div>
      <div id="divCondition">
         <div id="divSearch">
            <select id="selKey">
               <option value="product_code">상품코드</option>
               <option value="product_name">상품명</option>
               <option value="company">제조사</option>
               
            </select> <input type="text" id="txtWord">
            <select id="selPerpage">
               <option value="3">3행</option>
               <option value="5">5행</option>
               <option value="10" selected>10행</option>
            </select> <input type="button" id="btnSearch" value="검색"> <span
               style="font-size: 12px;">검색수: <b id="count"></b>건
            </span>
            <div id="divSort">
            <select id="selOrder">
               <option value="product_code">상품코드</option>
               <option value="product_name">상품명</option>
               <option value="company">제조사</option>
            </select>
            <select id="selDesc">
               <option value="">오름차순</option>
               <option value="desc">내림차순</option>
            </select>
         </div>
         </div>
         
      </div>
       <table id="tbl"></table>    
         <script id="temp" type="text/x-handlebars-template">  
           <tr class="title"> 
         		<td width=50><input type="checkbox" id="chkAll"></td>
         		<td width=65>상품코드</td>           
            	<td width=220>상품명</td> 
            	<td width=90>가격:</td>
         		<td width=100>제조사</td>
       	 		<td width=130>제조일</td>
       	 		<td width=130>폐기일</td>
        		<td width=100>이미지</td>
           		<td>발주</td>
          </tr>       
         {{#each array}}       
          	<tr class="row">
         		<td><input type="checkbox" class="chk"></td>
        		<td class="product_code">{{category_code}}{{product_code}}</td>          
            	<td class="product_name">{{product_name}}</td>   
            	<td class="product_price">{{product_price}}</td> 
          		<td class="company">{{company}}</td> 
          		<td class="product_date">{{product_date}}</td> 
          		<td class="product_exp">{{product_exp}}</td>  
        		<td class="img"><img src=/img/product/{{img}} width=50></td>  
         		<td><button style="background-color: #2569C9;
border: none;
  color: white;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  cursor: pointer;
  border-radius:10px;">개별담기</button></td>  
           </tr>      
          {{/each}}
      </script>
      <div style=margin-right:430px;>
      		<input type="button" id="btnCart" value="장바구니" style="float:right;margin-top:15px;">
            <input type="button" id="btnSelect" value="선택담기" style="float:right;margin-top:15px;"></div>
           <div id="pagination" style="margin-bottom:40px;margin-top:100px;background:#F2F2F2">
			<button id="btnPre">◀</button>
			<button id="btnNext">▶</button>
			<div>[<span id="curPage"></span>/<span id="totPage"></span>]</div>
		</div>
	<div id="divFoot" style="text-align: center"><jsp:include page="../footer.jsp" /></div>
   </div>
</body>

<script>
$(".dropmenu ul li").hover(function(){
	$(this).find("ul").stop().fadeToggle(300);
})

   var url="/semiProject/product/list";
   
$("#btnCart").on("click", function(){
	alert("장바구니 목록으로 이동하시겠습니까?")
	location.href="/semiProject/cart/cart.jsp";
})
   
$("#btnSelect").on("click", function(){
    if(!confirm("발주하시겠습니까?")) return;
    if($("#tbl .row .chk:checked").length > 0) {
       $("#tbl .row .chk:checked").each(function(){
          var row=$(this).parent().parent();
          var category_code=row.find(".product_code").html().substring(0,1);
          var product_code=row.find(".product_code").html().substring(1);
          var category_name=row.find(".category_name").html();
          var product_name=row.find(".product_name").html();
          var product_price=row.find(".product_price").html();
          var company=row.find(".company").html()
          $.ajax({
             type:"post",
             url:"/semiProject/cart/insert",
             data:{"category_code":category_code, "product_code":product_code, "product_name":product_name,
                "product_price":product_price, "company":company, "category_name":category_name},
             success:function(){            
             }
          });         
       });       
    } else {
       alert("상품을 선택해주세요");
       return;
    }
    alert("발주되었습니다.");
 });
 
 
   
   $("#tbl").on("click",".row button",function(){
      if(!confirm("발주")) return;
      var row=$(this).parent().parent();
      var category_code=row.find(".product_code").html().substring(0,1);
      var product_code=row.find(".product_code").html().substring(1);
      var category_name=row.find(".category_name").html();
      var product_name=row.find(".product_name").html();
      var product_price=row.find(".product_price").html();
      var company=row.find(".company").html()
      $.ajax({
         type:"post",
         url:"/semiProject/cart/insert",
         data:{"category_code":category_code, "product_code":product_code, "product_name":product_name,
            "product_price":product_price, "company":company, "category_name":category_name},
         success:function(){
            alert("발주되었습니다.");
         }
      });
   });
</script>
<script src="../home.js"></script>
</html>