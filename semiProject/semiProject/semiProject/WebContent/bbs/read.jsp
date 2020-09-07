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
		<br><br>
		<div class="idea_list">
			<!-- view영역 -->
			<!-- 2018-01-12이거어때 -->
			<div class="idea_view">
			
				<div class="cont_box">
					<div class="head_cont">
						<input type="hidden" value="${vo.bno}">
						<div class="title">${vo.title}</div>
						<div class="etc">
							<span><strong class="tit">등록일</strong>${vo.date}</span>
						</div>
					</div>
				</div>
				<div class="detail_box">
					<!-- 2018-04-04 추가 -->
					<div class="txt_detail">
						${vo.contents}
					</div>
				</div>
			</div>
			<div class="table03 mb20" style=float:right;>
				<table summary="상세목록" border="0" cellpadding="0" cellspacing="0"
					style="table-layout: fixed;">
					<colgroup>
						<col width="120">
						<col width="*">
					</colgroup>
					<tbody >
						<tr>
							<input type="button" id="preRead" value="이전글" style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
							<input type="button" id="nextRead" value="다음글"style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
						</tr>
					</tbody>
				</table>
			</div>
			<!--// 이전글, 다음글 -->
			<div class="btnNormal">
				
				<button id="bbsupdate"style= "background-color: #2569C9;
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
  
				<button id="bbsdelete"style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">삭제</button>
  <a href="list.jsp" ><button id="bbsdelete"style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">목록</button></a>
			</div>
			<div class="prodSnsReply" id="ideaTable">
				<div class="reply_box_n_wrap">
					<div class="reply_box_n">
						<textarea name="rplContent" id="rplContent" cols="30" rows="10"
							style="width:943px;" placeholder="게시판 성격과 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea>
						<a class="btn_reply" style="cursor:pointer;">댓글달기</a>
					</div>
				</div>
				<ul class="idea_add">
					<li>
						<div>
							<strong>아이디어에 당신의 아이디어를 추가해 보세요.</strong><!-- 아이디어 댓글 없을 때 -->
						</div>
					</li>
					<li>
					<div id="tbl"></div>
					<script id="temp" type="text/x-handlebars-template">
					{{#each bArray}}
						<div class="balloon_new">
							<div class="info_area">
								<div class="idea_photo">
										<img src="../images/leftbro.jpg" alt="">
									<span class="mask"></span> <!-- 이미지 동그라미 마스크 -->
								</div>
								<span class="snsId">(익명)</span>
								<div class="etc">
										<div class="btn_del" style="cursor:pointer;">삭제</div>
								</div>
								<input type="hidden" id="bno" value="{{bno}}">
								<input type="hidden" id="rno" value="{{rno}}">
								<div class="snsContents">
									{{contents}}
								</div>
								<p class="snsdate">{{date}}</p>
								<strong id="likeStr325">{{ulike}}</strong>
							</div>
						</div>
						{{/each}}
						</script>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="divFoot" style="text-align: center"><jsp:include page="../footer.jsp"/></div>
</div>
</body>
<script>
$(".dropmenu ul li").hover(function() {
	$(this).find("ul").stop().fadeToggle(300);
})

var bno="${vo.bno}";
var maxbno="${count}";
getList();

//댓글삭제
$("#tbl").on("click",".btn_del",function(){
  if(!confirm("댓글을 삭제하시겠습니까?")) return;
  var rno=$("#rno").val();
  $.ajax({
     type:"post",
     url:"replydelete",
     data:{"bno":bno,"rno":rno},
     success:function(){
           alert("삭제되었습니다!");
           getList();
     }
  });
});

//댓글등록
$(".reply_box_n").on("click",".btn_reply",function(){
	var contents=$("#rplContent").val();
	$.ajax({
		type:"post",
		url:"replyinsert",
		data:{"bno":bno,"contents":contents},
		success:function(){
			getList();
			location.href="/semiProject/bbs/read?bno="+bno;
		}
	});
});

function getList(){
	$.ajax({
		type:"get",
		url:"replylist",
		data:{"bno":bno},
		dataType:"json",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
		}
	});
}

//게시글삭제
$("#bbsdelete").on("click",function(){
  if(!confirm("삭제하시겠습니까?")) return;
  var company_id=$("#idididid").val();
  $.ajax({
     type:"post",
     url:"delete",
     dataType:"json",
     data:{"company_id":company_id,"bno":bno},
     success:function(data){
        if(data.count==1){
           alert("삭제되었습니다!");
           location.href="/semiProject/bbs/list.jsp";
        }else{
           alert("권한이 없습니다!");
        }
     }
  });
});

//수정으로 이동
$("#bbsupdate").on("click",function(){
  location.href="/semiProject/bbs/update?bno="+bno;
});

$("#preRead").on("click",function(){
  var prebno=bno-1;
  var prebno=parseInt(bno) - 1;
  location.href="/semiProject/bbs/read?bno="+prebno;
});

if(bno==1){
  $("#preRead").attr("disabled",true);
};
if(bno==maxbno){
  $("#nextRead").attr("disabled",true)
}

$("#nextRead").on("click",function(){
  var prebno=bno+1;
  var prebno=parseInt(bno) + 1;
  location.href="/semiProject/bbs/read?bno="+prebno;
});

</script>
</html>