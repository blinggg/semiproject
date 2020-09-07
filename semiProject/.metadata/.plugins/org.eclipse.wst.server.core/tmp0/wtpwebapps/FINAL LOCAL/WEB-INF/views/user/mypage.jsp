<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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
    display:inline-block;
    margin:5%;
   margin-top: 10px;
   margin-bottom: 40px;
   text-align: center;
   width: 90%;
   height:hidden;
}

#tbl1 {
   width:100%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
   margin-bottom:50px;
}

#tbl2{
   float:left;
   width:48%;
   overflow: hidden;
   border-collapse: collapse;
}

#tbl3 {
   float:right;
   width:48%;
   overflow: hidden;
   border-collapse: collapse;
}

#COSTUME,#PACKAGE{
   color:#e360f2;
   font-size: 30px;
   text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

td{
   padding: 15px;
   border-bottom:1px solid #e360f2;
}

th {
   padding: 15px;
   font-size: 20px;
   border-bottom:3px solid #e360f2;
}

#tbl1 th{
    width:50%;
   font-size:40px;
}
.row{
   height: 200px;
}

.title{
   font-size:50px;
   text-align:center;
   margin:auto;
}

.userUpdate{
   cursor: pointer;
}

.userUpdate:hover{
   border-radius: 50px 50px 50px 50px;
   background:#e360f2;
   color:white;
}
.img{
   border:0px;
}
.orderday{
   font-size:13px;
}
img:hover{
   cursor:pointer;
}

.code{
	display: none;
}
.no{
	display: none;
}
.X{
	float: right;
	font-size: 20px;
	border: none;
	cursor: pointer;
	color:red;
}

.pcprice{
	font-size: 13px;
}
</style>
</head>
<body>
   <jsp:include page="../index_include/menu.jsp" />
   <div id="page">
      <jsp:include page="../index_include/header.jsp" />
      <div class="title">⊙ MY PAGE ⊙</div>
      <br><br>
      <div id="content">
         <table id="tbl1">
            <tr>
               <th>
                  <span id="point"></span> Point
               </th>
               <th class="userUpdate">MY INFO UPDATE</th>
            </tr>
         </table><br>
         <table id="tbl2"></table>
         <script id="temp2" type="text/x-handlebars-template">
            <tr>
               <th colspan=7 id="PACKAGE">PACKAGE ORDER</th>
            </tr>
         <tr class="th">
                  <th>IMAGE</th>
                  <th width=150>PACKAGE</th>
					<th width=50></th>
                  <th>PRICE</th>
                  <th width=137>PAY TYPE</th>
                  <th>TOTAL</th>
					<th width=30></th>
               </tr>
            {{#each packagelist}}
               <tr class="row">
                  <td class="img">
                <img src="../display?fileName={{photo_package_image}}" width=110/>
               </td>
               <td rowspan=3>{{photo_package_title}}</td>
                  <td rowspan=3>{{orders_package_quantity}}개</td>
                  <td rowspan=3 class="pcprice">{{package_cart_price}}원</td>
                  <td rowspan=3>{{printStyle orders_paytype}}</td>
                  <td rowspan=3 class="pcprice">{{total}}원</td>
					<td rowspan=3><button class="X">X</button></td>
               <td class="code">{{photo_package_code}}</td>
            	<td class="no">{{orders_no}}</td>
               <tr>
               <tr>
                  <td class="orderday">
                      <b>{{orders_day}}</b>
                  </td>
               </tr>
            {{/each}}
         </script>
         <table id="tbl3"></table>
         <script id="temp3" type="text/x-handlebars-template">
            <tr>
               <th colspan=7 id="COSTUME">COSTUME ORDER</th>
            </tr>
         <tr class="th">
                  <th>IMAGE</th>
                  <th width=150>COSTUME</th>
					<th width=50></th>
                  <th>PRICE</th>
                  <th width=137>PAY TYPE</th>
                   <th>TOTAL</th>
					<th width=30></th>
               </tr>
            {{#each costumelist}}
               <tr class="row">
                  <td class="img"><img src="../display?fileName={{lend_costume_image}}" width=110/></td>
                  <td rowspan=3>{{lend_costume_name}}</td>
                 <td rowspan=3>{{orders_costume_quantity}}개</td>
                  <td rowspan=3 class="pcprice">{{costume_cart_price}}원</td>
                  <td rowspan=3>{{printStyle2 orders_paytype}}</td>
                  <td rowspan=3 class="pcprice">{{total}}원</td>
					<td rowspan=3><button class="X">X</button></td>
                 <td class="code">{{lend_costume_code}}</td>
             <td class="no">{{orders_no}}</td>
               <tr>
               <tr>
                  <td class="orderday">
                     <b>{{orders_day}}</b>
                  </td>
               </tr>
            {{/each}}
         </script>
         </div>
      </div>
   <jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
   var users_id="${users_id}";
   getpackageList();
   getcostumeList();
   getPoint();
   
   
   var orders_paytype="${map.orders_paytype}";
   
   Handlebars.registerHelper("printStyle",function(type){
         var src;
         if(orders_paytype == type) {
            src="카카오 결제";
         } else if(orders_paytype != type) {
            src="현금결제";
         }
         return src;
         
      });
   
  
   $("#tbl2").on("click", ".row button",function(){
      var orders_no=$(this).parent().parent().find(".no").html();
      
        $.ajax({
            type:"get",
            url:"/order/packageStatusUp",
            data:{"orders_no":orders_no},
            success:function(){
            	getpackageList();
              alert("내역이 삭제되었습니다.");
            }
         }); 
   });
   
$("#tbl3").on("click", ".row button",function(){
   var orders_no=$(this).parent().parent().find(".no").html();
      
       $.ajax({
            type:"get",
            url:"/order/costumeStatusUp",
            data:{"orders_no":orders_no},
            success:function(){
            	getcostumeList();
              alert("내역이 삭제되었습니다.");
            }
         }); 
   });
   

   Handlebars.registerHelper("printStyle2",function(type){
         var src;
         if(orders_paytype == type) {
            src="카카오 결제";
         } else if(orders_paytype != type) {
            src="현금결제";
         }
         return src;
         
      });
   
   function getpackageList(){
      $.ajax({
         type:"get",
         url:"/order/packagelist",
         data:{"users_id":users_id},
         dataType:"json",
         success:function(data){
            var temp=Handlebars.compile($("#temp2").html());
            var aa=temp(data);
            aa=aa.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $("#tbl2").html(aa);
         }
      });
   }
   
   function getcostumeList(){
         $.ajax({
            type:"get",
            url:"/order/costumelist",
            data:{"users_id":users_id},
            dataType:"json",
            success:function(data){
               var temp=Handlebars.compile($("#temp3").html());
               var bb=temp(data);
               bb=bb.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
               $("#tbl3").html(bb);
            }
         });
      }
   
   function getPoint(){
      $.ajax({
         type:"get",
         url:"/user/point",
         data:{"users_id":users_id},
         dataType:"json",
         success:function(data){
        	 var data=data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $("#point").html(data);
         }
      });
   }
   
   /*UPDATE클릭 했을때 이동*/
   $(".userUpdate").on("click", function(){
      location.href="/user/read";
   })

   
   $("#tbl2").on("click", ".row img", function(){
      var code=$(this).parent().parent().find(".code").html();
      location.href="/packageRead?photo_package_code="+code
   });
   
   $("#tbl3").on("click", ".row img", function(){
      var code=$(this).parent().parent().find(".code").html();
      location.href="/costumeRead?lend_costume_code="+code
   });
</script>
</html>