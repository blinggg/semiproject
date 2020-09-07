<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
   display:inline-block;
   margin:10%;
   margin-top: 10px;
   margin-bottom: 40px;
   text-align: center;
   width: 80%;
   height:hidden;
}

#tbl1,.null{
   float:left;
   width:48%;
   margin: 2px;
   border-collapse: collapse;
}

#tbl2,.null1{
   float:right;
   width:48%;
   margin: 2px;
   border-collapse: collapse;
   height: 100px;
}

td{
   padding: 15px;
   border-bottom:1px solid #e360f2;
}

th {
   padding: 15px;
   font-size: 25px;
   border-bottom:3px solid #e360f2;
}

#tbl1,#tbl2{
 margin-bottom:50px;
}

.row{
   height: 200px;
}

.title {
   font-size: 50px;
   text-align: center;
   margin: auto;
}

.btnDel {
   font-size: 20px;
   border: none;
   cursor: pointer;
}

.pnumber, .cnumber{
   width:30px;
}

#COSTUME,#PACKAGE{
   color:#e360f2;
   font-size: 30px;
   text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

.btnDel:hover{
   color: #e360f2;
}

#divFinal{
   text-align: center;
   width:1250px;
   margin: auto;
   height:300px;
   padding-left:12%;
   overflow:hidden;
}

#divSum, #divShipping, #divtotalSum {
   padding-top:80px;
   padding-bottom:80px;
   border: 1px solid #e360f2;
   display: block;
   width: 300px;
   height: hidden;
   display: table-cell;
   vertical-align: middle;
   float:left;
}

#divSum input[type='text'],#divShipping input[type='text'],#divtotalSum input[type='text']{
   width: 100px;
   height: 40px;
   margin-top: 7px;
   margin-bottom: 5px;
   text-align: right;
   font-size: 20px;
   color: #dc1c2c;
   font-weight: bold;
   outline: none;
   border: none;
}

.divOper div {
   margin-top: 250%;
   font-size: 40px;
}

.divOper {
   display: block;
   height: 200px;
   width: 50px;
   float: left;
}

.OrderArea {
   text-align: center;
   padding-bottom: 30px;
}

#btnOrder {
   width: 250px;
   bottom:5%;
   margin-right: 15px;
   height: 50px;
   border: 1px solid #e360f2;
   border-radius: 4px 4px 4px 4px;
   background: #e360f2;
   color: white;
   font-size:30px;
   font-weight: bold;
   outline: none;
   cursor: pointer;
}

.totalDel{
   width: 73px;
   height: 30px;
   font-size: 13px;
   margin-right: 18%;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border: none;
   border-radius: 3px 3px 3px 3px;
   font-weight:lighter;
}

input[type="number"]{
   margin-bottom:5px;
}

.photo_package_title{
   overflow:hidden;
}

.image{
	cursor: pointer;
}
.null button,.null1 button{
	cursor: pointer;
	width: 300px;
	height: 50px;
	font-size: 25px;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
}
.null,.null1{
	margin-top:100px;
}

.pcprice,.totprice{
	font-size: 13px;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙CART⊙</div>
		<br><br>
		<div id="content">
		<div class="null">
			<h2>PACKAGE 장바구니가 비었습니다.</h2>
			<button onClick="location.href='/package/packageList'">PACKAGE LIST</button>
		</div>
		<div class="null1">
			<h2>COSTUME 장바구니가 비었습니다.</h2>
			<button onClick="location.href='/costume/costumeList'">COSTUME LIST</button>
		</div>
        <table id="tbl1"></table>
         <script id="temp1" type="text/x-handlebars-template">
            <tr>
               <th><button class="totalDel">선택삭제</button></th>
               <th colspan=6 id="PACKAGE">PACKAGE</th>
            </tr>
            <tr>
               <th><input type="checkbox" class="chkAll"></th>
               <th width=120>IMAGE</th>
               <th colspan=3 width=260>INFO</th>
               <th width=80>PRICE</th>
			   <th width=10></th>
            </tr>
            {{#each plist}}
            <tr class="row">
               <td>
					<input type="checkbox" name="packageCHK" class="chk">
					<input type="hidden" value="{{package_cart_package_code}}" class="package_cart_package_code">
				</td>
               <td><img src="../display?fileName={{photo_package_image}}" width=110 class="image"/></td>
               <td class="photo_package_title" width=80>{{photo_package_title}}</td>
               <td class="pcprice">{{photo_package_price}}원</td>
				<td>
                  <span><input type="hidden" value={{package_cart_no}} size=3 name="package_cart_no" class="package_cart_no"></span>
				  <span><input type="number" value="{{package_cart_quantity}}" min="1" class="pnumber"></span>
			   </td>
               <td class="totprice">{{totprice}}원</td>
               <td><button class="btnDel">X</button></td>
            </tr>
            {{/each}}
         </script>
         <table id="tbl2"></table>
         <script id="temp2" type="text/x-handlebars-template">
            <tr>
               <th><button class="totalDel">선택삭제</button></th>
               <th colspan=6 id="COSTUME">COSTUME</th>
            </tr>
            <tr>
               <th><input type="checkbox" class="chkAll"></th>
               <th width=120>IMAGE</th>
               <th colspan=3 width=260>INFO</th>
               <th width=80>PRICE</th>
				<th width=10></th>
            </tr>
            {{#each clist}}
            <tr class="row">
               <td>
					<input type="checkbox" name="costumeCHK" class="chk">
					<input type="hidden" value="{{costume_cart_costume_code}}" class="costume_cart_costume_code">
				</td>
               <td><img src="../display?fileName={{lend_costume_image}}" width=110 class="image"/></td>
               <td class="photo_package_title" width=80>{{lend_costume_name}}/{{costume_size}}</td>
               <td><span class="pcprice">{{lend_costume_price}}원</span></td>
				<td>
                  <span><input type="hidden" value={{costume_cart_no}} size=3 name="costume_cart_no" class="costume_cart_no"></span>                
				  <span><input type="number" value="{{costume_cart_quantity}}" min="1" class="cnumber"></span>
				</td>
               <td class="totprice">{{totprice}}원</td>
               <td><button class="btnDel">X</button></td>
            </tr>
            {{/each}}
         </script>
         
		</div>
		<div id="divFinal">
			<div id="divSum">
				<div>
					<h2>PACKAGE</h2>
					<input type="text" id="packageSum" value="0" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>+</div>
			</div>
			<div id="divShipping">
				<div>
					<h2>COSTUME</h2>
					<input type="text" id="costumeSum" value="0" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>=</div>
			</div>
			<div id="divtotalSum">
				<div>
					<h2>TOTAL</h2>
					<input type="text" id="totalSum" value="0" readonly> 원 <br>
				</div>
			</div>
		</div>
		
		<div class="OrderArea">
			<button id="btnOrder">구매하기</button>
		</div>
	</div>
	<jsp:include page="../index_include/chat.jsp" />
	<jsp:include page="../index_include/top.jsp" />
</body>
<script>
	var cart_id="${users_id}";
	getPlist();
	getClist();
	var Pchk=false;
	var Cchk=false;
	var packageSum=0;
	var costumeSum=0;
	var totalSum=0;
	
	//전체 체크버튼을 클릭 했을때
	$("#tbl2").on("click", ".chkAll", function() {
		if ($(this).is(":checked")) {
			Cchk=true;
			if(Cchk==true){
				$("#tbl2 .row .chk").each(function() {
					var costume_price=$(this).parent().parent().find(".totprice").html();
					costume_price=parseInt(costume_price.replace(/,/g , ''));
					costumeSum = costumeSum + costume_price;  
				});
				costumeSum=costumeSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#costumeSum").val(costumeSum);
				
				ps=$("#packageSum").val();
				cs=$("#costumeSum").val();
				ps=parseInt(ps.replace(/,/g , ''));
				cs=parseInt(cs.replace(/,/g , ''));
				
				totalSum=ps+cs;
				totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#totalSum").val(totalSum);
				costumeSum=0;
				costume_price=0;
	     	}
			$("#tbl2 .row .chk").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			costumeSum=0;
			$("#costumeSum").val(costumeSum);
			
			ps=$("#packageSum").val();
			cs=$("#costumeSum").val();
			ps=parseInt(ps.replace(/,/g , ''));
			cs=parseInt(cs.replace(/,/g , ''));
			
			totalSum=ps+cs;
			totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalSum").val(totalSum);
			Cchk=false;
			$("#tbl2 .row .chk").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	//전체 체크버튼을 클릭 했을때
	$("#tbl1").on("click", ".chkAll", function() {
		if ($(this).is(":checked")) {
			Pchk=true;
			if(Pchk==true){
				$("#tbl1 .row .chk").each(function() {
					var package_price=$(this).parent().parent().find(".totprice").html();
					package_price=parseInt(package_price.replace(/,/g , ''));
					packageSum = packageSum + package_price; 
				});
				packageSum=packageSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#packageSum").val(packageSum);
				
				ps=$("#packageSum").val();
				cs=$("#costumeSum").val();
				ps=parseInt(ps.replace(/,/g , ''));
				cs=parseInt(cs.replace(/,/g , ''));
				
				totalSum=ps+cs;
				totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#totalSum").val(totalSum);
				packageSum=0;
	     		package_price=0;
	     	}
	         $("#tbl1 .row .chk").each(function() {
	            $(this).prop("checked", true);
	         });
	      } else {
	    	 packageSum=0;
			 $("#packageSum").val(packageSum);
			 ps=$("#packageSum").val();
			 cs=$("#costumeSum").val();
			 ps=parseInt(ps.replace(/,/g , ''));
			 cs=parseInt(cs.replace(/,/g , ''));
				
			 totalSum=ps+cs;
			 totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			 $("#totalSum").val(totalSum);
	         Pchk=false;
	         $("#tbl1 .row .chk").each(function() {
	            $(this).prop("checked", false);
	         });
	      }
	   });
	
	/*패키지선택 체크버튼*/
	$("#tbl1").on("click", ".row .chk", function(){	
		$("#tbl1 .row .chk:checked").each(function() {
			var package_price=$(this).parent().parent().find(".totprice").html();
			package_price=parseInt(package_price.replace(/,/g , ''));
			packageSum = packageSum + package_price; 
		});
		packageSum=packageSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#packageSum").val(packageSum);
		ps=$("#packageSum").val();
		cs=$("#costumeSum").val();
		ps=parseInt(ps.replace(/,/g , ''));
		cs=parseInt(cs.replace(/,/g , ''));
			
		totalSum=ps+cs;
		totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalSum").val(totalSum);
		packageSum=0;
		package_price=0;
	});
	
	/*코스튬선택 체크버튼*/
	$("#tbl2").on("click", ".row .chk", function(){
		$("#tbl2 .row .chk:checked").each(function() {
			var costume_price=$(this).parent().parent().find(".totprice").html();
			costume_price=parseInt(costume_price.replace(/,/g , ''));
			costumeSum = costumeSum + costume_price; 
		});
		costumeSum=costumeSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#costumeSum").val(costumeSum);
		ps=$("#packageSum").val();
		cs=$("#costumeSum").val();
		ps=parseInt(ps.replace(/,/g , ''));
		cs=parseInt(cs.replace(/,/g , ''));
			
		totalSum=ps+cs;
		totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalSum").val(totalSum);
		costumeSum=0;
		costume_price=0;
	});
   
   //구매하기 버튼을 클릭했을 때
   $("#btnOrder").on("click", function(){
      if($("input:checkbox[name=packageCHK]").is(":checked")){
           Pchk=true;
      }
      if(!$("input:checkbox[name=packageCHK]").is(":checked")){
         Pchk=false;
      }
      if($("input:checkbox[name=costumeCHK]").is(":checked")){
           Cchk=true;
      }
      if(!$("input:checkbox[name=costumeCHK]").is(":checked")){
         Cchk=false;
      }
      if(!Pchk){
         alert("한 개 이상의 패키지를 선택해 주세요!");
         return;
      }
      if(!Cchk){
         alert("한 개 이상의 코스튬을 선택해 주세요!");
         return;
      }
      
       var packageCHK = new Array();
       var costumeCHK = new Array();
       var usersid="${users_id}";
       
        $("input[name=packageCHK]:checked").each(function() {
           var package_cart_no=$(this).parent().parent().find(".package_cart_no").val();
           packageCHK.push(package_cart_no);
        });
        
        $("input[name=costumeCHK]:checked").each(function() {
           var costume_cart_no=$(this).parent().parent().find(".costume_cart_no").val();
           costumeCHK.push(costume_cart_no);
        });
        
        $.ajax({
           type:"get",
           url:"/cart/purchase",
           data:{"packageChk[]":packageCHK, "costumeChk[]":costumeCHK, "users_id":usersid},
           success:function(){
              location.href="/user/purchase?users_id="+usersid;
           }
        });
   });
   
   // 패키지 read
   $("#tbl1").on("click", ".image", function(){
      var package_code=$(this).parent().parent().find(".package_cart_package_code").val();
      location.href="../package/packageRead?photo_package_code="+package_code;
   });
   
   // 의상 read
   $("#tbl2").on("click", ".image", function(){
      var costume_code=$(this).parent().parent().find(".costume_cart_costume_code").val();
      location.href="../package/costumeRead?lend_costume_code="+costume_code;
   });
   
   //패키지 수량 수정
   $("#tbl1").on("change", ".row .pnumber", function(){
      var package_cart_no=$(this).parent().parent().find(".package_cart_no").val();
      var package_cart_quantity=$(this).parent().parent().find(".pnumber").val();
      var a=$(this).parent().parent().parent();
      
      $.ajax({
         type:"get",
         url:"/cart/pupdate",
         data:{"package_cart_no":package_cart_no, "package_cart_quantity":package_cart_quantity},
         success:function(data){
        	 data=data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	 a.children().eq(5).html(data+"원");
        	 
        	 $("#tbl1 .row .chk:checked").each(function() {
       			var package_price=$(this).parent().parent().find(".totprice").html();
       			package_price=parseInt(package_price.replace(/,/g , ''));
       			packageSum = packageSum + package_price; 
       		 });
        	 
        	 if($("#tbl1 .row .chk:checked")){
        		 packageSum=packageSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        		 $("#packageSum").val(packageSum);
        		 ps=$("#packageSum").val();
        		 cs=$("#costumeSum").val();
        		 ps=parseInt(ps.replace(/,/g , ''));
        		 cs=parseInt(cs.replace(/,/g , ''));
        				
        		 totalSum=ps+cs;
        		 totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        		 $("#totalSum").val(totalSum);
          		 packageSum=0;
        		 package_price=0;
        	 }
         }
      });
   });
   
   // 의상대여 수량 수정
   $("#tbl2").on("change", ".row .cnumber", function(){
      var costume_cart_no=$(this).parent().parent().find(".costume_cart_no").val();
      var costume_cart_quantity=$(this).parent().parent().find(".cnumber").val();
      var a=$(this).parent().parent().parent();
      
      $.ajax({
         type:"get",
         url:"/cart/cupdate",
         data:{"costume_cart_no":costume_cart_no, "costume_cart_quantity":costume_cart_quantity},
         success:function(data){
        	 data=data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	 a.children().eq(5).html(data+"원");
        	 
        	 $("#tbl2 .row .chk:checked").each(function() {
     			var costume_price=$(this).parent().parent().find(".totprice").html();
     			costume_price=parseInt(costume_price.replace(/,/g , ''));
     			costumeSum = costumeSum + costume_price; 
     		 });
        	 if($("#tbl2 .row .chk:checked")){
        		costumeSum=costumeSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        		$("#costumeSum").val(costumeSum);
        		ps=$("#packageSum").val();
       		 	cs=$("#costumeSum").val();
       			ps=parseInt(ps.replace(/,/g , ''));
       		 	cs=parseInt(cs.replace(/,/g , ''));
       				
       		 	totalSum=ps+cs;
       		 	totalSum=totalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       		 	$("#totalSum").val(totalSum);
          		costumeSum=0;
          		costume_price=0;
        	 }
         }
      });
   });
   
   // 패키지 선택삭제
   $("#tbl1").on("click", ".totalDel", function(){
         if(!confirm("선택한 패키지를 삭제하시겠습니까?")) return;
         $("#tbl1 .row .chk:checked").each(function(){
           var pcart_no=$(this).parent().parent().find(".package_cart_no").val();
            $(this).prop("checked", false);
            $("#tbl1 .chkAll").prop("checked", false);
            $.ajax({
                  type:"get",
                  url:"/cart/pdelete",
                  data:{"package_cart_no":pcart_no},
                  dataType:"json",
                  success:function(){}
            });
         });
         alert("삭제되었습니다.");
         getPlist();
      });
   
   // 의상 선택삭제
   $("#tbl2").on("click", ".totalDel", function(){
         if(!confirm("선택한 의상을 삭제하시겠습니까?")) return;
         $("#tbl2 .row .chk:checked").each(function(){
           var ccart_no=$(this).parent().parent().find(".costume_cart_no").val();
            $(this).prop("checked", false);
            $("#tbl2 .chkAll").prop("checked", false);
            $.ajax({
                  type:"get",
                  url:"/cart/cdelete",
                  data:{"costume_cart_no":ccart_no},
                  dataType:"json",
                  success:function(){}
            });
         });
         alert("삭제되었습니다.");
         getClist();
      });
   
   // 패키지 삭제
   $("#tbl1").on("click", ".row .btnDel", function(){
         if(!confirm("해당 패키지를 삭제하시겠습니까?")) return;
         var cart_no=$(this).parent().parent().find(".package_cart_no").val();
      
         $.ajax({
            type:"get",
            url:"/cart/pdelete",
            data:{"package_cart_no":cart_no},
            dataType:"json",
            success:function(){}
         });
         alert("삭제되었습니다.");
         location.href="/user/cart";
      });
   
   // 의상 삭제
   $("#tbl2").on("click", ".row .btnDel", function(){
         if(!confirm("해당 의상을 삭제하시겠습니까?")) return;
         var cart_no=$(this).parent().parent().find(".costume_cart_no").val();
      
         $.ajax({
            type:"get",
            url:"/cart/cdelete",
            data:{"costume_cart_no":cart_no},
            dataType:"json",
            success:function(){}
         });
         alert("삭제되었습니다.");
         location.href="/user/cart";
      });
   
   $(".null").hide();
   $(".null1").hide();
   $("#tbl1").hide();
   $("#tbl2").hide();
   $("#divFinal").hide();
   $("#btnOrder").hide();
   // 패키지 목록
   function getPlist(){
         $.ajax({
            type:"get",
            url:"/cart/plist",
            data:{"package_cart_id":cart_id},
            dataType:"json",
            success:function(data){
            	var temp=Handlebars.compile($("#temp1").html());
            	var aa=temp(data);
                aa=aa.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                $("#tbl1").html(aa);
         	   var Pdata = $("#tbl1 .row .package_cart_no").val();
         	   if(Pdata!=null){
         		   $("#tbl1").show();
         		   $("#divFinal").show();
         		   $("#btnOrder").show();
             	}else if(Pdata==null){
             		$(".null").show();
             	}
            }
         });
      }

   // 의상대여 목록
     function getClist(){
        $.ajax({
           type:"get",
           url:"/cart/clist",
           data:{"costume_cart_id":cart_id},
           dataType:"json",
           success:function(data){
        	   var temp=Handlebars.compile($("#temp2").html());
        	   var bb=temp(data);
               bb=bb.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
               $("#tbl2").html(bb);
        	   var Cdata = $("#tbl2 .row .costume_cart_no").val();
        	   if(Cdata!=null){
        		   $("#tbl2").show();
         		   $("#divFinal").show();
         		   $("#btnOrder").show();
            	}else if(Cdata==null){
            		$(".null1").show();
            	}
              
           }
        });
     }
   
   //각 행에있는 체크버튼을 클릭 했을 때
   $("#tbl1").on("click", ".row .chk", function() {
      var isChkAll = true;
      $("#tbl1 .row .chk").each(function() {
         if (!$(this).is(":checked")) {
            isChkAll = false;
         }
      });
      if (isChkAll) {
         $("#tbl1 .chkAll").prop("checked", true);
      } else {
         $("#tbl1 .chkAll").prop("checked", false);
      }
   });
   
   //각 행에있는 체크버튼을 클릭 했을 때
   $("#tbl2").on("click", ".row .chk", function() {
      var isChkAll = true;
      $("#tbl2 .row .chk").each(function() {
         if (!$(this).is(":checked")) {
            isChkAll = false;
         }
      });
      if (isChkAll) {
         $("#tbl2 .chkAll").prop("checked", true);
      } else {
         $("#tbl2 .chkAll").prop("checked", false);
      }
   });
   
</script>
</html>