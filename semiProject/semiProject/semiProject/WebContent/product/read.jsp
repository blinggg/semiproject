<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../home.css">
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>편의점 관리시스템</title>
	<link rel="stylesheet" href="../enter.css">
</head>
<body>
	<div id="divPage">
			<div id="divTop"><jsp:include page="../top.jsp" /></div>
			<div class="dropmenu">
			<ul id="dm_ul" style="background: white;">
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
						<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="divCenter">
			<div id="divMenu"><jsp:include page="../menu.jsp"/></div>
 			<div id="divContent">
				<!-- 여기에 내용 등록 시작--------------------------------------------->
				<div id="divHeader"><h2>상 품 정 보</h2></div>
				<form name="frm" action="update" method="post"  enctype="multipart/form-data">
					<table id=tblNew>
						<tr>
							<td width=100 class="title">상품코드</td>
							<td width=20><input type="text" name="product_code" value="${vo.product_code}" readonly></td>
							<td width=100 class="title" >판매가</td>
							<td width=30><input type="text" name="product_price" value="${vo.product_price}"></td>
							<td width=100 class="title">제조사</td>
							<td width=50><input type="text" name="company" value="${vo.company}"></td>
							<td width=100 class="title">제조일자</td>
							<td width=200>
								<input type="text" name="yy" value="${fn:substring(vo.product_date,0,4)}" maxlength=4 size=2 readonly>년
								<input type="text" name="mm" value="${fn:substring(vo.product_date,5,7)}" maxlength=2 size=1 readonly>월
								<input type="text" name="dd" value="${fn:substring(vo.product_date,8,10)}" maxlength=2 size=1 readonly>일
							</td>
						</tr>
						<tr>
							<td width=100 class="title">상품명</td>
							<td><input type="text" name="product_name" value="${vo.product_name}"></td>
							<td width=100 class="title">카테고리</td>
							<td width=5><input size=5 type="text" name="category_code" value="${vo.category_code}"></td>
							<td width=5><input size=5 type="text" name="category_name" value="${vo.category_name}"></td>
							<td><input type="checkbox" name="prod_del" value=1 <c:out value="${vo.prod_del=='1'?'checked':''}"/>> 판매중지</td>
							<td width=100 class="title" width=150>유통기한</td>
							<td>
								<input type="text" name="yy" value="${fn:substring(vo.product_exp,0,4)}" maxlength=4 size=2 readonly>년
								<input type="text" name="mm" value="${fn:substring(vo.product_exp,5,7)}" maxlength=2 size=1 readonly>월
								<input type="text" name="dd" value="${fn:substring(vo.product_exp,8,10)}" maxlength=2 size=1 readonly>일
							</td>
						</tr>
						<tr>
					<td class="title">상품이미지</td>
					<td colspan=8>
					<c:if test="${vo.img==null}"><img src="http://placehold.it/150x120" id="image" width=150/></c:if>
               <c:if test="${vo.img!=null}"><img src="/img/product/${vo.img}"
                  id="image" width=150 /></c:if>
						<input type="file" name="image" accept="image/*" style="visibility: hidden;">
					</td>
				</tr>
					</table>
					<div id="pagination">
						<input type="submit" value="저장" id="btnInsert">
						<input type="reset" value="취소" id="btnCancel">
					</div>
				</form>
				<!-- 여기에 내용 등록 종료--------------------------------------------->
			</div>
		</div>
	</div>
</body>
<script>
	$(".dropmenu ul li").hover(function(){
		$(this).find("ul").stop().fadeToggle(300);
	})

	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("상품 정보를 수정하시겠습니까?")) return;
		frm.submit();
		alert("수정되었습니다!");
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
	//카테고리 불러오기	
	$(frm.category_code).click(function(){
		window.open('/semiProject/category/listAll.jsp','category','width=400,height=300,top=200,left=900');
	});
</script>
</html>