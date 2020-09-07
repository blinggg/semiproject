<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>방울방울</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
   font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: hidden;
}

#content {
   margin-top: none;
   margin-left: 70px;
   margin-right: 70px;
   padding: 30px margin-top: 10px;
   text-align: center;
}

#profile1,#profile2,#profile3,#profile4,#profile5{
	cursor: pointer;
}

#tbl1 {
   width: 50%;
   margin: auto;
}

img {
   margin: 25px;
   padding: none;
}

.title {
   font-size: 50px;
   text-align: center;
   margin: auto;
}

#imgButton {
   cursor: pointer;
}

#menu {
   width: 760px;
   margin: auto;
   margin-bottom: 10px;
}

#darken-background {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 0%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
}

#lightbox {
   width:1200px;
   height:900px;
   margin: 20px auto;
   padding: 10px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   /* text-align: center; */
}
#perPage{
	float:left;
   margin-top:400px;
   cursor: pointer;
   border:none;
   background:white;
   font-size:60px;
}

#nextPage{
	float:right;
   margin-top:400px;
   cursor: pointer;
   border:none;
   background:white;
   font-size:60px;
}

#btnClose {
   border:none;
   background:white;
   font-size:50px;
    cursor: pointer;
}

#lightbox img{
	 position: relative;
	 top:355px;
	 left:44%;
     transform: translate(-50%, -50%);
}

</style>
</head>
<body id="body">
<jsp:include page="../index_include/menu.jsp" />
   <div id="page">
      <jsp:include page="../index_include/header.jsp" />
      <div class="title">⊙ PROFILE ⊙</div>
      <br>
      <div id="content">
         <table id="tbl1">
            <tr class = "box">
               <td>
                  <img id="profile1" page=1 src="../display?fileName=profile-1.jpg" width=500>
               </td>
               <td>
                  <img id="profile2" page=2 src="../display?fileName=profile-2.jpg" width=500>
               </td>
            </tr>
            <tr class = "box">
               <td rowspan=2>
                  <img id="profile3" page=3 src="../display?fileName=profile-3.jpg" width=500>
               </td>
            </tr>
            <tr class = "box">
               <td>
                  <img id="profile4" page=4 src="../display?fileName=profile-4.jpg" width=400>
                  <img id="profile5" page=5 src="../display?fileName=profile-5.jpg" width=400>
               </td>
            </tr>
         </table>
      <div>
         <img id="imgButton" src="../display?fileName=예약하기.png" width=300>
      </div>
      </div>
   </div>
   <!--라이트 박스-->
   <div id="darken-background">
      <div id="lightbox">
         <div style="text-align:right; margin-right:10px;">
            <button id="btnClose">X</button>
         </div>
         <button id="perPage" disabled="false">&lt</button>
         <img id="lightImg"/>
         <button id="nextPage" disabled="false">&gt</button>
      </div>
   </div>
   <jsp:include page="../reservation/reservation.jsp" />
   <jsp:include page="../index_include/chat.jsp" />
   <jsp:include page="../index_include/top.jsp" />
</body>
<script>
var src1="../display?fileName=profile-";
var src2=".jpg";
var page;
$("#imgButton").on("click",function(){
    location.href="/reservation/calendar";
});

$(".box").on("click", "img", function() {
    var src = $(this).attr("src");
    page= $(this).attr("page");
    
    pageOnOff();
    
    $("#lightbox img").attr("src", src1+page+src2);
    $("#lightbox img").attr("page", page);
    $("#darken-background").show();
    var offset = $('.box').offset(); //선택한 태그의 위치를 반환
    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
	$('html').animate({scrollTop : 0}, 400);
	
	});

 $("#btnClose").on("click", function() {
    $("#darken-background").hide();
 });
 
$("#perPage").on("click", function(){
 page = $("#lightbox img").attr("page");
 page--;
 var src = src1+page+src2;
 $("#lightbox img").attr("src", src);
 $("#lightbox img").attr("page",page);

 pageOnOff();
 var offset = $('.box').offset();
	$('html').animate({scrollTop : 0}, 400);
 });
 
 $("#nextPage").on("click", function(){
    page = $("#lightbox img").attr("page");
    page++;
    var src = src1+page+src2;
    $("#lightbox img").attr("src", src);
    $("#lightbox img").attr("page",page);
    
    pageOnOff();
    var offset = $('.box').offset();
	$('html').animate({scrollTop : 0}, 400);
 });

function pageOnOff(){
   if(page==1){
      $("#perPage").attr("disabled",true);
      $("#nextPage").attr("disabled",false); 
   }else if(page==5){
      $("#nextPage").attr("disabled",true);
      $("#perPage").attr("disabled",false);
   }else{
      $("#perPage").attr("disabled",false);
      $("#nextPage").attr("disabled",false); 
   }
}


</script>
</html>