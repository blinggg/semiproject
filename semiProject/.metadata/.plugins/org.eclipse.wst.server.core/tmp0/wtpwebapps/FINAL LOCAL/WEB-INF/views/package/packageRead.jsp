<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PACKAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
* {font-family:'@여기어때 잘난체';}

#page {
   background: white;
   margin: 15px;
   padding-bottom:30px;
   height: hidden;
}

#content {
   margin-left:70px;
   margin-right:70px;
   padding: 30px ;
   margin-top: 10px;
   text-align: center;
   margin:auto;
}

#tbl1{
   width:80%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
   text-align:center;
}

.tTitle{
   font-size:70px;
   font-weight:bold;
   margin-bottom:0px;
   margin:auto;
}


.title{
   font-size:50px;
   text-align:center;
   margin:auto;
}

.price #btnCart/* ,input[type="submit"] */{
   width:300px;
   height: 100px;
   font-size: 35px;
   margin: 2px;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border:none;
   border-radius:3px 3px 3px 3px;
   float:right;
}

.price #btnCart:active {
   background: #cca6cf;
}

.price input[type='text']{
   height: 60px;
   margin-bottom: 5px;
   text-align: left;
   font-size: 60px;
   font-weight: bold;
   outline: none;
   border: none;
   color:#fc8da0;
   margin:20px;
}

input[type="submit"]{
	width: 50px;
	height: 20px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
}

input[type="button"]{
	width: 50px;
	height: 20px;
	cursor: pointer;
	background: #969596;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
}

.price{
   padding-right:50px;
   text-align: left;
   font-size: 40px;
   font-weight: bold;
}

.smallImage{
   cursor: pointer;
}

.hiddenFile{
   width:150px;
}

.bigPig{
   width:20%;
   height:900px;
   display: table-cell;
   padding:20px;
   text-align: center;
   vertical-align: middle;
}

.bigPig img{
   height:750px;
}

.sImageDiv{
   margin: auto;
   cursor: pointer;
    max-width:100%; 
    max-height:100%;
}

.sImage{
   width:75%;
   text-align:center;
   padding-bottom:20px;
	margin:auto;
	word-break:inherit;
}
.image{
   width:100px;
   text-align:center;
}
form{
	float:left;
	text-align: center;
	margin:0px 2px 0px 2px;
	font-size:30px
}

hr {
margin-top:250px;
}
</style>
</head>
<body>  
   <jsp:include page="../index_include/menu.jsp" />
   <div id="page">
      
      <jsp:include page="../index_include/header.jsp" />
      <div class="title">⊙ PACKAGE ⊙</div>
      <br><br>
      <div id="content">
         <div id="tbl1">
            <div class="tTitle"><${vo.photo_package_title}></div>
               <div class="bigPig">
                  <img src="../display?fileName=${vo.photo_package_image}" id="bigPig"/>
                  <img src="" id="bigImage"/>
               </div><br>
              <div class="sImage">
                    <div id="listFile">
                       <c:forEach items="${list}" var="attach"  varStatus="status">
                       <div class="listImage">
	                       <form name="frm" action="/image/update" method="post" enctype="multipart/form-data">     
	                         <div>
	                          <input type="hidden" class="index" value="${status.index}">
	                          <input type="hidden" value="${attach.a_no}" name="a_no" class="a_no">
	                          <input type="hidden" value="${param.photo_package_code}" name="photo_package_code">
	                         </div>
	                         <div><img src="../display?fileName=${attach.image}" height=170 class="smallImage"></div>
	                         <c:if test="${users_note==1}">
	                         	  <div><input type="file" name="file" class="image" accept="image/*" multiple></div>
		                          <span><input type="submit" class="sub" value="수정"></span>
							   	  <span><input type="button" value="삭제" class="btnDelete"></span>
					   		 </c:if>
						</form>
						</div>
                       </c:forEach>
                    </div>  
            </div>
            <br>
                  <hr>
             
             <div class="price">
               \<input type="text" value="<fmt:formatNumber value="${vo.photo_package_price}" pattern="#,###"/>" size=10 readonly>
               <c:if test="${users_note!=1}">
               <input type="button" value="장바구니에 담기" id="btnCart">
               </c:if>
            </div>
         </div>
      </div>
   </div>
   
   <jsp:include page="../index_include/chat.jsp" />
</body>

<script>
$("#bigImage").hide();
$("#tbl1 .sImage").on("click","img",function(){
   var vo_image = $(this).attr("src");
   $("#bigPig").hide();
   $("#bigImage").show();
   $("#tbl1 .bigPig #bigImage").attr("src",vo_image);
})

$("#btnCart").on("click", function(){
   var title="${vo.photo_package_title}";
   var id="${users_id}";
   var package_code="${vo.photo_package_code}";
   var price="${vo.photo_package_price}";
   if(id!="") {
   if(!confirm(title + " 패키지를 장바구니에 담으시겠습니까?")) return;
   $.ajax({
      type:"get",
      url:"/cart/pinsert",
      data:{"package_cart_id":id, "package_cart_package_code":package_code, "package_cart_price":price},
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

$(".btnDelete").on("click", function(){
	if(!confirm("삭제하시겠습니까?")) return;
	var a_no=$(this).parent().parent().find(".a_no").val();
	$.ajax({
		type:"get",
		url:"/image/delete",
		data:{"a_no":a_no},
		success:function(){
			alert("삭제되었습니다.");
			location.reload();
		}
	});
});

$(".smallImage").on("click", function(){
   $(frm.file).click();
});
 
/* $(frm.file).on("change", function(){
	var file=$(frm.file)[0].files[0];
	$(".smallImage").attr("src", URL.createObjectURL(file));
}); */

$(".image").change(function(e) {
	var row=$(this).parent().parent().parent()
	var myIndex=row.find(".index").val();
	
    var reader = new FileReader();
    reader.onload = function(e) {
    	if(myIndex==0){
    		row.find(".smallImage").attr("src", e.target.result);
    	}
    }
    reader.readAsDataURL(this.files[0]);
 });
 
/* $(frm).submit(function(e){
	 e.preventDefault();
	 if(!confirm("수정하시겠습니까?")) return;
	 $(this).unbind('submit').submit();
	 alert("수정되었습니다.");
}); */

$(".sub").on("click", function(){
	if(!confirm("수정하시겠습니까?")) return;
	alert("수정되었습니다.");
});
</script>
</html>