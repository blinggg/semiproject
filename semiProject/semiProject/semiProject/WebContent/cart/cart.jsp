<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>장바구니</title>
   <link rel="stylesheet" href="../home.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body style="background:#F2F2F2">
   <div id="divPage" style="background:#F2F2F2">
   <div id="divTop"><jsp:include page="../top2.jsp" /></div>
   <div class="dropmenu">
			<ul id="dm_ul" style="background:#F2F2F2">
				<li><a id=plist href="semiProject/product/list.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;

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
						<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
					</ul>
				</li>
			</ul>
		</div>
      <div id="center">
         <div id="content">
            <h2>[장바구니]</h2>
            
            <table id="tbl">
               <tr class="title">
                  <td width=100><input type="checkbox" id="chkAll"></td>
                  <td width=100>상품번호</td>
                  <td width=100>상품명</td>
                  <td width=100>가격</td>
                  <td width=100>제조사</td>
                  <td width=100>수량</td>
                  <td width=100>합계</td>
                  <td width=100>수정</td>
                  <td width=100>삭제</td>
               </tr>
               <c:forEach items="${listCart}" var="vo"> 
                  <tr class="row">
                     <td><input type="checkbox" class="chk"></td>
                     <td class="product_code">${vo.category_code}${vo.product_code}</td>
                     <td class="product_name">${vo.product_name}</td>
                     <td class="product_price">${vo.product_price}</td>
                     <td class="company">${vo.company}</td>
                     <td>
                        <input type="text" value="${vo.order_quantity}" size=1 class="order_quantity">
                     </td>
                     <td class="sum">${vo.product_price*vo.order_quantity}</td>
                     <td><button class="btnUpdate">수정</button></td>
                     <td><button class="btnDelete">삭제</button></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div id="pagination">
               <button id="btnAll">전체상품주문</button>
               <button id="btnSel">선택상품주문</button>
         </div>
         <!-- 주문정보쓰 -->
      <div id="divOrderInfo">
         <div id="divHeader">
            <h2>[주문하기]</h2>
            <table id="tblOrder"></table>
            <script id="tempOrder" type="text/x-handlebars-template">
             <tr class="title">
                <td>상품코드</td>
                <td>상품명</td>
               <td>제조사</td>
               <td>상품가격</td>
                <td>상품수량</td>
                <td>합계</td>
             </tr>
             {{#each .}}
            <tr class="row">
               <td class="product_code">{{category_code}}{{product_code}}</td>
               <td class="product_name">{{product_name}}</td>
               <td class="company">{{company}}</td>
                <td class="product_price">{{product_price}}</td>
                <td class="order_quantity">{{order_quantity}}</td>
                <td class="sum">{{sum}}</td>
                </tr>
             {{/each}}
             <tr class="title">
                <td colspan=5>합계</td><td id="totSum" class="sum"></td>
            </tr>
            </script>
            <form name="frm">
               <input type="hidden" name="cvs_code" value="${cvs_id}">
            <div id="pagination" style=margin-bottom:-60px>
               <input type="submit" value="주문하기" style="background-color: #2569C9;
  border: none;
  color: white;
  padding: 10px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
            </div>
            </form>
         </div>
      </div>
      </div>
   </div>
</body>
<script>

$(".dropmenu ul li").hover(function() {
	$(this).find("ul").stop().fadeToggle(300);
})

$(frm).submit(function(e){
   e.preventDefault();
   if (!confirm("상품을 주문하시겠습니까??")) return;
   
   var cvs_code = $(frm.cvs_code).val();
   alert(cvs_code);
   $("#tblOrder .row").each(function() {
      var category_code = $(this).find(".product_code").html().substring(0, 1);
      var product_code = $(this).find(".product_code").html().substring(1);
      var order_quantity =$(this).find(".order_quantity").html();
      $.ajax({
         type : "post",
         url : "/semiProject/order/insert",
         data : {
            "cvs_code":cvs_code,
            "product_code" : product_code,
            "category_code" : category_code,
            "order_quantity" : order_quantity
         },
         dataType:"json",
         success : function(data) {
         }
      });
   });
   alert("발주되었습니다");
   location.href="/semiProject/order/list.jsp";
});

   $("#tbl").on("click", ".row .btnUpdate", function() {
      var row = $(this).parent().parent();
      var category_code = row.find(".product_code").html().substring(0, 1);
      var product_code = row.find(".product_code").html().substring(1);
      var order_quantity = row.find(".order_quantity").val();
      if (!confirm("선택하신 상품의 수량을 변경하시겠습니까?")) return;
      $.ajax({
         type : "post",
         url : "/semiProject/cart/update",
         data : {
            "product_code" : product_code,
            "category_code" : category_code,
            "order_quantity" : order_quantity
         },
         success : function() {
            alert("변경되었습니다.");
            location.href = "/semiProject/cart/cart.jsp";
         }
      });
   });
   $("#tbl").on("click", ".row .btnDelete", function() {
      var row = $(this).parent().parent();
      var category_code = row.find(".product_code").html().substring(0, 1);
      var product_code = row.find(".product_code").html().substring(1);
      alert(product_code+category_code);
      if (!confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?"))
         return;
      $.ajax({
         type : "post",
         url : "/semiProject/cart/delete",
         data : {
            "product_code" : product_code,
            "category_code" : category_code
         },
         success : function() {
            alert("삭제되었습니다.");
            location.href = "/semiProject/cart/cart.jsp";
         }
      });
   });

   $("#divOrderInfo").hide();
   //맨위에 체크누르면 체크다하기
   $("#tbl").on("click", ".title #chkAll", function() {
      if ($(this).is(":checked")) {
         $(".row .chk").each(function() {
            $(this).prop("checked", true);
         });
      } else {
         $(".row .chk").each(function() {
            $(this).prop("checked", false);
         });
      }
   });
   //각 행에 잇는 체크 버ㅡㅌㄴ 눌럿을 떄 ㄹㅇㅇㅇㅇㅇㅇ
   $("#tbl").on("click", ".row .chk", function() {
      var isChkAll = true;
      $("#tbl .row .chk").each(function() {
         if (!$(this).is(":checked"))
            isChkAll = false;
      });

      if (isChkAll) {
         $("#tbl #chkAll").prop("checked", true);
      } else {
         $("#tbl #chkAll").prop("checked", false);
      }
   });

   $("#btnAll").on("click", function() {
      showOrder($("#tbl .row"));
   });

   $("#btnSel").on("click", function() {
      var array = [];
      if ($("#tbl .row .chk:checked").length > 0) {
         $("#tbl .row .chk:checked").each(function() {
            var row = $(this).parent().parent();
            array.push(row);
         });
         showOrder(array);
      } else {
         alert("선택한 상품이 없습니다.");
      }

   });

   function showOrder(row) {
      $("#divCart").hide();
      $("#divOrderInfo").show();
      var totSum = 0;
      var array = [];
      $(row).each(
            function() {
               var category_code = $(this).find(".product_code").html()
                     .substring(0, 1);
               var product_code = $(this).find(".product_code").html()
                     .substring(1);
               var category_name = $(this).find(".category_name").html();
               var product_name = $(this).find(".product_name").html();
               var product_price = $(this).find(".product_price").html();
               var company = $(this).find(".company").html();
               var order_quantity = $(this).find(".order_quantity").val();
               var sum = $(this).find(".sum").html();
               totSum = totSum + parseInt(sum);
               var data = {
                  "category_code" : category_code,
                  "product_code" : product_code,
                  "category_name" : category_name,
                  "product_name" : product_name,
                  "product_price" : product_price,
                  "company" : company,
                  "order_quantity" : order_quantity,
                  "sum" : sum
               };
               array.push(data);
            });
      var template = Handlebars.compile($("#tempOrder").html());
      $("#tblOrder").html(template(array));
      $("#totSum").html(totSum);
   }
</script>
</html>