<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../enter.css" media="all" />
<link rel="stylesheet" href="../home.css">
<style>
.title {
	cursor: pointer;
}

.title:hover {
	text-decoration: underline;
	color: red;
	text-decoration-style: solid;
	text-decoration-color: red;
	text-decoration-thickness: 2px;
}

.txt {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

link {
	display: none;
}

body {
	line-height: inherit;
}

html, body, div, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, b, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tfoot, thead, article, aside, canvas, details, embed, figure,
	figcaption, footer, header, hgroup, menu, nav, output, ruby, section,
	summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: inherit;
	vertical-align: top;
	color: inherit;
}
</style>
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
		<br> <br>
		<div class="relCon">
			<div class="proposal idea cu_idea">
				<br>
				<div class="info_comment">
					<span class="img_icon" style="float: left;"> <img
						src="../images/information.png" style="width: 85px;">
					</span>
					<dl>
						<dt>&nbsp;알려드립니다.</dt>
						<dd>
							<ul>
								<li>단순 불만 사항, 장난성 글, 욕설 및 비방, 광고글, 반복 게시물 등은 예고 없이 삭제될 수
									있습니다.</li>
								<li>게시판 성격에 맞지 않는 글은 임의로 이동되거나 삭제될 수 있습니다.</li>
								<li class="txt_red">유사한 아이디어가 있는지 검색 후에 작성하시기 바랍니다.</li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="proposal_borad">
					<div class="idea_search">
						<img
							src="http://cu.bgfretail.com/images/enter/idea_search_txt.png"
							alt="아이디어 검색" class="img">
						<form id="listForm" name="listForm" action="/idea/idea_list.do"
							method="post" onsubmit="return false;">
							<input id="idx" name="idx" type="hidden" value="0"> <input
								id="pageIndex" name="pageIndex" type="hidden" value="1">
							<input id="searchCondition" name="searchCondition" type="hidden"
								value=""> <input id="isColleger" name="isColleger"
								type="hidden" value="N"> <span class="box"	> <select
								id="selKey" style="font-size: 13px;">
									<option value="title" style="font-size: 13px">제목</option>
									<option value="contents" style="font-size: 13px">내용</option>
							</select> <input type="text" value="" id="txtWord" class="input_text"
								placeholder="검색어를 입력 해 주세요.">
							</span>
						</form>
						<span class="button_search"> <input type="button"
							id="btnSearch" value="조회하기"
							style="width: 100px; height: 93px; background-color: #2569C9; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 10px;">
							<div style="font-size: 15px;">
								검색수: <b id="count"></b>건
							</div>
						</span>
					</div>
					<div id="tbl"></div>
					<script id="temp" type="text/x-handlebars-template">
				{{#each array}}
				<div class="idea_list" id="ideaTable">
					<ul>
						<li>
							<span class="img_icon">
								<img src="../images/tfs_logo.JPG" style="height:108px;">
							</span>
							<div class="box_cont">
								<input type="hidden" class=bno value={{bno}}>
								<strong class="title"><a class=title1>{{title}}</a></strong>
								<p class="txt">{{contents}}</p>
								<span class="date">{{date}}</span>
								<div class="etc">
									<span class="info_post_state info_post_end">작성완료</span>
									<span class="heart_num">
										<button style="width:25px;">👍</button>&nbsp;
										<span class=ulike>{{ulike}}</span>
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
				{{/each}}
				</script>
					<div id="pagination">
						<button id="btnPre">◀</button>
						<button id="btnNext">▶</button>
						[<span id="curPage"></span>/<span id="totPage"></span>]
					</div>
					<div class="qweasd">
						<button class="btn_purple" style="cursor: pointer;">아이디어
							작성하기</button>
					</div>
				</div>
			</div>
		</div>
		<div id="divFoot" style="text-align: center"><jsp:include
				page="../footer.jsp" /></div>
	</div>
</body>
<script>
	$(".dropmenu ul li").hover(function() {
		$(this).find("ul").stop().fadeToggle(300);
	})

	var key, word, order, desc, perPage, page = 1;

	getList();
	var ulike;

	//insert로 이동
	$(".btn_purple").on("click", function() {
		location.href = "/semiProject/bbs/insert.jsp";
	});

	//read로 이동
	$("#tbl").on("click", ".title", function() {
		var bno = $(this).parent().parent().parent().find(".bno").val();
		location.href = "/semiProject/bbs/read?bno=" + bno;
	});

	//좋아요 버튼을 눌렀을 때
	$("#tbl").on("click", ".heart_num button", function() {
		var bno = $(this).parent().parent().parent().find(".bno").val();
		var ulike = $(this).parent().find(".ulike").html();
		ulike = parseInt(ulike) + 1;
		$.ajax({
			type : "get",
			url : "ulike",
			data : {
				"bno" : bno,
				"ulike" : ulike
			},
			success : function() {
				location.href = "list.jsp";
			}
		});
	});

	$("#btnSearch").on("click", function() {
		page = 1;
		getList();
	});

	$("#txtWord").keydown(function(key) {
		if (key.keyCode == 13) {
			page = 1;
			getList();
		}
	});

	$("#btnNext").click(function() {
		page++;
		getList();
	});

	$("#btnPre").click(function() {
		page--;
		getList();
	});

	function getList() {
		key = $("#selKey").val();
		word = $("#txtWord").val();
		perPage = $("#selPerPage").val();
		$.ajax({
			type : "get",
			url : "/semiProject/bbs/list",
			data : {
				"key" : key,
				"word" : word,
				"page" : page,
				"perPage" : perPage
			},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));

				if (data.page == 1) {
					$("#btnPre").attr("disabled", true);
				} else {
					$("#btnPre").attr("disabled", false);
				}
				if (data.page == data.totPage) {
					$("#btnNext").attr("disabled", true);
				} else {
					$("#btnNext").attr("disabled", false);
				}
				$("#curPage").html(data.page);
				$("#totPage").html(data.totPage);
				$("#count").html(data.count);
			}
		});
	}
</script>
</html>