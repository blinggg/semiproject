<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>편의점 관리시스템</title>
	<link rel="stylesheet" type="text/css" href="../enter.css" media="all" />
	<link rel="stylesheet" href="../home.css">
</head>
<body>
<div id="divPage">
	<div id="divTop"><jsp:include page="../top2.jsp" /></div>
		<div class="dropmenu">
			<ul id="dm_ul" style="background: white; margin-bottom: 20px">
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
	<br>
	<br>
	<div class="relCon">
		<!-- 아이디어 게시판-view -->
		<div class="idea_list">
			<br><br>
			<!-- view영역 -->
			<!-- 2018-01-12이거어때 -->
			<div class="idea_view">
		
				<div class="cont_box">
					<div class="head_cont">
						<input type="hidden" value="${vo.bno}">
						<input type="hidden" id="idididid" value="${company_id}">
						제목: <input type="text" id="tt" size=50 value="${vo.title}">
						
					</div>
				</div>
				<div class="detail_box">
					<!-- 2018-04-04 추가 -->
						<textarea style="width:700px;height:300px;" id="cc">${vo.contents}</textarea>
				</div>
			</div>
			<div class="btnNormal">
				<button style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;"><a href="list.jsp" style=text-decoration:none;font-color:white>목록</a></span>
				<button id="bbsupdate" style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">수정</button>
			</div>
		</div>
	</div>
	<div id="divFoot" style="text-align: center"><jsp:include page="../footer.jsp"/></div>
</div>
<script>
	var bno="${vo.bno}";
	
	$(".dropmenu ul li").hover(function() {
		$(this).find("ul").stop().fadeToggle(300);
	})
	
	$("#bbsupdate").on("click",function(){
		if(!confirm("수정하시겠습니까?")) return;
		var title=$("#tt").val();
		var contents=$("#cc").val();
		var company_id=$("#idididid").val();
		$.ajax({
			type:"post",
			url:"update",
			dataType:"json",
			data:{"company_id":company_id,"title":title,"contents":contents,"bno":bno},
			success:function(data){
				if(data.count==1){
					alert("수정되었습니다!");
					location.href="/semiProject/bbs/read?bno="+bno;
				}else{
					alert("권한이 없습니다!");
				}
			}
		});
	});
</script>
</html>