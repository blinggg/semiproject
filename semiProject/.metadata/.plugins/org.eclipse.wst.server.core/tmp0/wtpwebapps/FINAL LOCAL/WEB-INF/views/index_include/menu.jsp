<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.net.URLDecoder"%> 
<!DOCTYPE html>
<style>

* {
	font-family: 'Comic Sans MS';
}

#menu {
	width: 1780px;
	padding: 10px;
	color: black;
	position: fixed;
	right: 50px;
	top: 30px;
	text-align: right;
	background:white;
	background-color:rgba(255,255,255,0.3);
}

#menu1 {
	width: 1780px;
	padding: 0px 10px 10px 10px;
	color: black;
	position: fixed;
	right: 50px;
	top: 102px;
	text-align:right;
	background:white;
	background-color:rgba(255,255,255,0.3);
}

.items0,.items1,.items2,.items3,.items4,.items5,.items6,.items7,.items8,.items5-1,.items9,.items10{
	color: black;
	font-size: 30px;
	cursor: pointer;
	display: inline-block;
	margin: 10px;
	text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
	background-color:rgba(0.7);
}

.items1-1,.items2-1,.items3-1,.items4-1,.items2-2{
	color: black;
	font-size: 20px;
	cursor: pointer;
	display: inline-block;
	margin: 10px;
	text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
	background-color:rgba(0.7);
}

.items4:hover ,.items0:hover,.items1:hover,.items2:hover,.items3:hover,.items5:hover,.items6:hover,.items7:hover,.items8:hover,.items5-1:hover,.items1-1:hover,.items2-1:hover,.items3-1:hover,.items4-1:hover,.items2-2:hover,.items9:hover,.items10:hover{
	color: #e360f2;
}

a {
   text-decoration:none;
   color:black;
}

</style>
<%
Cookie[] cookies=request.getCookies();
if(cookies != null) {
   for(Cookie cookie : cookies) {
      if(cookie.getName().equals("users_id")) {
         session.setAttribute("users_id", cookie.getValue());
      }
   }
}

Cookie[] cookies2=request.getCookies();
if(cookies2 != null) {
   for(Cookie cookie2 : cookies2) {
      if(cookie2.getName().equals("users_note")) {
         session.setAttribute("users_note", cookie2.getValue());
      }
   }
}

Cookie[] cookies3=request.getCookies();
if(cookies3 != null) {
   for(Cookie cookie3 : cookies3) {
      if(cookie3.getName().equals("users_name")) {
         session.setAttribute("users_name", URLDecoder.decode(cookie3.getValue(), "UTF-8"));

      }
   }
}
%>
	<div id="menu">
		<div class="items1">
			<b>HOME</b>
		</div>
		<div class="items8">
			<b>PACKAGE</b>
		</div>
		<div class="items0">
			<b>COSTUME</b>
		</div>
		<div class="items2">
			<b>Q&A</b>
		</div>
		<div class="items3">
			<b>FAQ</b>
		</div>
		<c:if test="${users_note!=1}">
		<div class="items4">
			<b>CART</b>
		</div>
		</c:if>
		<c:if test="${users_note==0}">
		<div class="items9">
			<b>RESERVATION</b>
		</div>
		</c:if>
		<c:if test="${users_note==0}">
		<div class="items5">
			<b>MY PAGE</b>
		</div>
		</c:if>
		<c:if test="${users_note==1}">
		<div class="items10">
			<b>RESERVATION</b>
		</div>
		</c:if>
		<c:if test="${users_id==null}">
         <div class="items6">
            <b>LOGIN</b>
         </div>
    	</c:if>
		<c:if test="${users_note==1}">
			[ ${users_id} ] 관리자님
		</c:if>
		<c:if test="${users_note==0}">
			[ <b>${users_id}</b>님 ]
		</c:if>
     	<c:if test="${users_id!=null}">
         <div class="items7">
            <a href="/user/logout"><b>LOGOUT</b></a>
        </div>
		</c:if>
	</div>
	
	<c:if test="${users_note==1}">
	<div id="menu1">
		<div class="items1-1">
			<b>USER LIST</b>
		</div>
		<div class="items2-1">
			<b>PACKAGE ORDERS</b>
		</div>
		<div class="items2-2">
			<b>COSTUME ORDERS</b>
		</div>
		<div class="items3-1">
			<b>BLACK LIST</b>
		</div>
		<div class="items4-1">
			<b>COSTUME INSERT</b>
		</div>
	</div>
      </c:if>
<script>
	/*HOME메뉴*/
	$(".items1").on("click",function(){
		location.href="/index";
	})
	
	/*COSTUME메뉴*/
	$(".items0").on("click",function(){
		location.href="/costume/costumeList";
	})
	
	/*PACKAGE메뉴*/
	var URL = window.location.pathname;
	$(".items8").on("click",function(){
		if(URL!="/index"){
			location.href="/package/packageList";
		}
			window.onload = function(){
			({scrollTop : 3000}, 400);
		}
	});
	
	/*ADMIN USER LIST메뉴*/
	$(".items1-1").on("click",function(){
		location.href="/admin/userlist";
	})
	
	/*ADMIN pCHART메뉴*/
	$(".items2-1").on("click",function(){
		location.href="/admin/pchart";
	})
	
	/*ADMIN cCHART메뉴*/
	$(".items2-2").on("click",function(){
		location.href="/admin/cchart";
	})
	
	/*ADMIN CHART메뉴*/
	$(".items3-1").on("click",function(){
		location.href="/admin/blacklist";
	})
	
	/*ADMIN COSTUM INSERT메뉴*/
	$(".items4-1").on("click",function(){
		location.href="/costume/costumeInsert";
	})
	
	/*Q&A메뉴*/
	$(".items2").on("click",function(){
		location.href="/QnA_FAQ/QnA";
	})
	
	/*FAQ메뉴*/
	$(".items3").on("click",function(){
		location.href="/QnA_FAQ/FAQ";
	})
	
	/*CART메뉴*/
	$(".items4").on("click",function(){
		location.href="/user/cart";
	})
	
	/*MY PGAE메뉴*/
	$(".items5").on("click",function(){
		location.href="/user/mypage";
	})
	
	/*RESERVATION 메뉴*/
	$(".items9").on("click",function(){
		location.href="/reservation/calendar";
	})
	
	/*RESERVATION 메뉴*/
	$(".items10").on("click",function(){
		location.href="/reservation/admincalendar";
	})
	
	/*LOGIN메뉴*/
	$(".items6").on("click",function(){
		var options = 'width=500, height=700, top=30, left=30, resizable=no, scrollbars=no, location=no';
		window.open('/user/login', 'LOGIN', options);
	})
</script>
	