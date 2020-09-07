<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>COSTUME_REPLY_LIST</title>
<style>
* {
	font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	height: hidden;
}

#content {
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
	margin-top: 10px;
}

textarea {
	resize: none;
	font-size: 20px;
	border: 1px solid #BDBDBD;
	padding: 10px;
	border-radius: 5px 5px 5px 5px;
}

#tbl2 {
	width: 60%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	padding: 20px;
}

#txtReply {
	height: 25px;
	font-size: 20px;
	text-align: center;
	border: none;
	padding: 5px;
}

#btnInsert {
	width: 100px;
	height: 30px;
	font-size: 15px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	float: right;
}

#btnInsert:active {
	background: #cca6cf;
}

input::placeholder {
	text-align: center;
}

hr {
	border: 1px dotted #e360f2;
}

button {
	float: right;
	font-size: 20px;
	border: none;
	cursor: pointer;
	padding-top:10px;
}

.replyDate {
	float: right;
	font-size: 12px;
}

.active {
	color: hotpink;
}

.replyer {
	font-weight: bold;
	font-size: 12px;
	float: left;
}

#pagination{
	padding:20px;
	text-align:center;
}
#divInput{
	width:60%;
	text-align:center;
	margin:auto;
}

#countDiv{
	text-align:center;
	width:100%;
}
#Rcontent{
	display:inline-block; 
	width:80%;
	padding:10px;
}
.reply{
	text-align:center;
}
</style>
</head>
<body>
	<div id="countDiv">REPLY COUNT : <span id="count"></span></div>
	<div class="title">⊙ REPLY ⊙</div>
	<div id="divInput">
		<input type="text" id="txtReply" size=50 placeholder="CONTENT">
		<button id="btnInsert">INSERT</button>
	</div>
	<div id="tbl2"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each clist}}
		<div class="divContent">
			<hr>
			<div class="replydate">
				<span class="replyDate">{{costume_reply_replyDate}}</span>
				<span class="replyer">{{costume_reply_replyer}}</span>
			</div><br>
			<div class="reply" >
				<button costume_reply_rno={{costume_reply_rno}} style="{{printStyle costume_reply_replyer}}">X</button>
				<span id="Rcontent">{{costume_reply}}</span>
			</div>
		</div>
	{{/each}}

	</script>
	<div id="pagination"></div>
</body>
<script>
	var costume_reply_code = "${vo.lend_costume_code}";
	var page = 1;
	var costume_reply_replyer = "${users_id}";
	var users_note = "${users_note}";

	getList();

	//삭제버튼 조건 주기(댓글작성자 = 로그인한 유저 & 관리자 권한이 1인경우만 삭제버튼 보이기)
	Handlebars.registerHelper("printStyle", function(users_id) {
		var src;
		if (costume_reply_replyer!=users_id && users_note != 1 || costume_reply_replyer=="GUEST") {
			src = "display:none;";
		}else if(users_note==1){
			src = "color:red;";
		}

		return src;
	})

	//댓글목록 출력하기
	function getList() {
		$.ajax({
			type : "get",
			url : "/costume/costumeReply/reply",
			data : {
				"costume_reply_code" : costume_reply_code,
				"page" : page
			},
			dataType : "json",
			success : function(data) {
				//alert(bno);
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl2").html(temp(data));
				$("#count").html(data.pm.totalCount);

				//페이지 리스트 출력
				var str = "";
				if (data.pm.prev) {
					str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>"
				}
				for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
					if (page == i) {
						str += "[<a href='" + i + "' class='active'>" + i
								+ "</a>]";
					} else {
						str += " [<a href='" + i + "'>" + i + "</a>]";
					}
				}
				if (data.pm.next) {
					str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>"
				}
				$("#pagination").html(str);

			}
		});
	}

	//댓글삭제하기
	$("#tbl2").on("click", "button", function() {
		var costume_reply_rno = $(this).attr("costume_reply_rno");
		if (!confirm(costume_reply_rno + "번의 댓글을 삭제하시겠습니까?"))
			return;
		$.ajax({
			type : "post",
			url : "/costumeReplyDelete",
			data : {
				"costume_reply_rno" : costume_reply_rno
			},
			success : function() {
				alert("삭제했습니다!");
				getList();
			}
		});
	});

	//Enter key를 눌렀을 때
	$("#txtReply").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#btnInsert").click();
		}
	});

	//댓글입력버튼을 눌렀을 때
	$("#btnInsert").on("click", function() {
		//alert(".");
		var costume_reply = $("#txtReply").val();
		//alert(costume_reply);
		if (costume_reply == "") {
			alert("댓글 내용을 입력하세요!");
			return;
		}

		if (costume_reply_replyer == "") {
			costume_reply_replyer = "GUEST";

		}

		$.ajax({
			type : "post",
			url : "/costumeReplyInsert",
			data : {
				"costume_reply_code" : costume_reply_code,
				"costume_reply" : costume_reply,
				"costume_reply_replyer" : costume_reply_replyer,
			},

			success : function() {
				alert("댓글을 입력했습니다!");
				$("#txtReply").val("");
				getList();
			}
		});

	});

	//페이징
	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>
</html>