<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품등록</title>
	<link rel="stylesheet" href="../home2.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="divPage" style=background:#F2F2F2>
	<div id="divTop"><jsp:include page="../top.jsp" /></div>
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
					<li>이건어때
						<ul>
							<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
						</ul>
					</li>
					</ul>
					</div>
		<div id="divHeader">
			<h2>발 주 등 록</h2>
		</div>
		<form name="frm" action="insert" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" 이미지를 저장할수있게해주는거 -->
			<table id="tbl">
				<tr>
					<td class="title" width=130>편의점코드</td>
					<td width=100><input type="text" name="cvs_code" size=10></td>
					<td class="title" width=180>제조원/수입원</td>
					<td width=200><input type="text" name="company" size=10></td>
					<td class="title" width=100>판매가격</td>
					<td width=100><input type="text" name="product_price" size=10></td>
				</tr>
				<tr>
					<td class="title">상품코드</td>
					<td><input type="text" name="product_code" size=10></td>
					<td class="title">상품분류코드</td>
					<td><input type="text" name="category_code" size=10></td>
					<td class="title">상품수량</td>
					<td><input type="number" name="order_quantity"></td>
				</tr>
				<tr>
					<td class="title">상품이름</td>
					<td><input type="text" name="product_name" size=10></td>
					<td class="title"></td>
					<td></td>
					<td class="title" colspan=2></td>
				</tr>
				<tr>
					<td class="title">상품이미지</td>
					<td colspan=5 >
						<img style="margin-left:170px;padding-top:20px;padding-bottom:5px;" src="http://placehold.it/150x120" id="image" width=150 /> <input type="file" name="image" accept="image/*" style="visibility: hidden;">
						<br>
						<h5 style = margin-right:88px;padding-bottom:15px;font-weight:100>이미지를 클릭하여 등록하세요!<h5>
					</td>
				</tr>
			</table>
			<div id="pagination">
				<input type="submit" value="저장" id="save"> <input type="reset" value="취소" id="cancel">
			</div>
			
		</form>
		<div id="divFoot" style="text-align: center"><jsp:include page="../footer.jsp" /></div>
	</div>
</body>
<script>
$(".dropmenu ul li").hover(function() {
	$(this).find("ul").stop().fadeToggle(300);
})

$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("상품을 등록하시겠습니까?")) return;
	alert("상품이 등록되었습니다.");
	frm.submit();
});

	//업로드일 이미지 불러오기
	$("#image").on("click", function(){
		$(frm.image).click();
	});
	
	//불러오기한 이미지가 변경되었을때
	$(frm.image).on("change", function(){
		var reader=new FileReader();
		reader.onload=function(e){
			$("#image").attr("src", e.target.result);
		}
		reader.readAsDataURL(this.files[0]);
	});
	//업체목록 불러오기
	$(frm.mall_id).click(function(){     
		 window.open('/shop/mall/listAll.jsp','mall','width=400,height=300,top=200,left=900');  
	 }); 
	
	 
</script>
</html>