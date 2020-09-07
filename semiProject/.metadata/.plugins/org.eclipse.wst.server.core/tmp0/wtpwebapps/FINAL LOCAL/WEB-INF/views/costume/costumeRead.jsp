<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSTUME</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	padding-bottom: 30px;
	height: hidden;
}

#content {
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
}

#tbl1 {
	width: 80%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
}

td {
	padding: 15px;
}

th {
	padding: 15px;
	font-size: 30px;
}

.info {
	text-align: left;
	padding-left: 20px;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

select {
	width: 100%;
	height: 25px;
	font-size: 20px;
	border: none;
	text-align-last: center;
}

select option {
	height: 25px;
	font-size: 20px;
	border: none;
	text-align-last: center;
}

.cart,#btnList,input[type=submit] {
	width: 300px;
	height: 100px;
	font-size: 35px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}
.btnDelete{
	width:300px;
	height: 100px;
	font-size: 35px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}
.cart:active,#btnList:active {
	background: #cca6cf;
}

input[type=file] {
	visibility: hidden;
	height: 0px;
}

input[type=text] {
	height: 25px;
	font-size: 20px;
	text-align:center;
	border:none;
}

input[type=number] {
	width:60px;
	height: 25px;
	font-size: 20px;
	text-align:center;
	border:none;
}

.btn{
	width:100%;
	padding:20px;
}

.price input[type='text']{
	height: 60px;
	text-align: left;
	font-size: 60px;
	font-weight: bold;
	outline: none;
	border: none;
	color:#fc8da0;
}

.price{
	text-align: left;
	font-size: 40px;
	font-weight: bold;
	padding-left:80px;
}

.name input[type='text']{
	text-align: left;
	
}

</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ COSTUME ⊙</div>
		<br>
		<br>
		<div id="content">
			<form name="frm" action="/costumeUpdate" method="post"
				enctype="multipart/form-data">
				<!-- <input type="hidden" value="${users_id}"> -->
				<table id="tbl1">
					<tr>
						<th width=150>TITLE</th>
						<td colspan=4 class="name">
							<input type="text" value="${vo.lend_costume_code}" name="lend_costume_code" readonly size=4>
							<input type="text" value="${vo.lend_costume_name}" name="lend_costume_name" size=35>
						</td>
						<td rowspan=6 width=500>
						<c:if test="${users_note==1}">
							<input type="file" name="file">
						</c:if>
							<c:if
								test="${vo.lend_costume_image!=null && vo.lend_costume_image!=''}">
								<img id="image" src="../display?fileName=${vo.lend_costume_image}"
									width=400 />
							</c:if> <c:if
								test="${vo.lend_costume_image==null || vo.lend_costume_image==''}">
								<img id="image" src="http://placehold.it/100x80" width=100>
							</c:if> <!-- 예시사진 --> 
							
							<input type="hidden" name="lend_costume_image" value="${vo.lend_costume_image}">
						</td>
					</tr>
					<tr>
						<th width=150>SIZE</th>
						<td width=200><select name="size" id="size">
								<option>S</option>
								<option>M</option>
								<option>L</option>
								<option>XL</option>
						</select></td>
						<th>AMOUNT</th>
						<td>
							<input type="number" value="1" min="1" id="quantity">
						</td>
						
					</tr>
					<tr>
						<td colspan=4>
							<textarea name="lend_costume_content" rows=10 cols=50>${vo.lend_costume_content}</textarea>
						</td>
					</tr>
					<tr>
						<td width=200 class="price" colspan=4>
							\<input type="text" id="price" value="<fmt:formatNumber value="${vo.lend_costume_price}" pattern="#,###"/>" name="lend_costume_price" size=10>
						</td>
					</tr>
				</table>
				<div class="btn">
					<c:if test="${users_note==1}">
						<input type="submit" value="UPDATE">
					</c:if>
					<input type="button" value="LIST" id="btnList" onClick="location.href='costumeList'">
					<c:if test="${users_note!=1}">
						<input type="button" value="장바구니에 담기" class="cart">
					</c:if>
					<c:if test="${users_note==1}">
						<input type="button" value="DELET" class="btnDelete">
					</c:if>
				</div>
			</form>
		</div>
		<jsp:include page="costumeReply.jsp" />
	</div>
	<jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
	var users_note="${users_note}";
	
	if(users_note==1){
		$("#price").removeAttr("readonly");
	}
	if(users_note==0){
		 $("#price").attr("readonly",true);
	}
	
	//삭제 버튼을 클릭했을 때
	$(".btnDelete").on("click", function(){
		var code="${vo.lend_costume_code}";
		var title="${vo.lend_costume_name}";
		if(!confirm(title + " 의상을 삭제하시겠습니까?")) return;
		$.ajax({
	         type:"get",
	         url:"/costume/costumeDelete",
	         data:{"lend_costume_code":code, "costume_reply_code":code, "costume_cart_costume_code":code},
	         dataType:"json",
	         success:function(cnt){
	        	 if(cnt==0){
	        		 alert("삭제되었습니다.");
	 	         	location.href="/costume/costumeList";
	        	 }else if(cnt!=0){
	        		alert("장바구니에 담겨있어 삭제할 수 없습니다."); 
	        	 }
	         }
	      });
	});
	
	//이미지 클릭했을떄
	$("#image").on("click", function() { //이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
	});

	/* //파일업로드
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0]; //1번째 input type="file"에서 이미지 1개만
		$("#image").attr("src", URL.createObjectURL(file));
	}); */
	
	//이미지 미리보기    
	 $(frm.file).on("change", function(e){        
		var reader = new FileReader();        
		reader.onload=function(e){            
		$("#image").attr("src", e.target.result);       
			}        
		reader.readAsDataURL(this.files[0]);    
			});
	
	//장바구니 버튼을 클릭했을 때
	$(".cart").on("click", function(){
      var title="${vo.lend_costume_name}";
      var id="${users_id}";
      var code="${vo.lend_costume_code}";
      var quantity=$("#quantity").val();
      var price="${vo.lend_costume_price}";
      var size=$("#size").val();
      if(id != "") {
      if(!confirm(title + " 의상을 장바구니에 담으시겠습니까?")) return;
      $.ajax({
         type:"get",
         url:"/cart/cinsert",
         data:{"costume_cart_id":id, "costume_cart_costume_code":code, "costume_cart_quantity":quantity, "costume_cart_price":price, "costume_size":size},
         success:function(){}
      });
      if(!confirm("담겼습니다. 장바구니로 이동하시겠습니까?")) return;
      location.href="/user/cart";
      } else {
         alert("로그인후 이용해주세요.");
         var options = 'width=500, height=700, top=30, left=30, resizable=no, scrollbars=no, location=no';
         window.open('/user/login', 'LOGIN', options);
      }
   });
	
	//수정버튼을 눌렀을 때
	   $(frm).submit(function(e){
	      e.preventDefault();
	      if(!confirm("상품정보를 수정하시겠습니까?")) return;
	      var price="${vo.lend_costume_price}";
	      alert("상품정보를 수정하였습니다!");
	      $(frm.lend_costume_price).val(removeComma(price));
	      frm.submit();
	   });
</script>
</html>