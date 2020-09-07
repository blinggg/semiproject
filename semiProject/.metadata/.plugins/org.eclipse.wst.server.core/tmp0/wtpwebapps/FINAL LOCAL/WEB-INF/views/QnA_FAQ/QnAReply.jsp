<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REPLY</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
	margin-left:8%;
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
}
#divInput{
	width:60%;
	text-align:center;
	margin:auto;
}
.board_reply button{
	color:red;
	padding-top:10px;
}

#Rcontent{
	display:inline-block; 
	width:80%;
	padding:10px;
}
</style>
</head>
<body>
	REPLY COUNT : <span id="count"></span>
	<div class="title">⊙ REPLY ⊙</div>
	<div id="divInput">
		<input type="text" id="txtReply" size=50 placeholder="CONTENT">
		<button id="btnInsert">INSERT</button>
	</div>
	<div id="tbl2"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each QnAList}}
		<div class="divContent">
			<hr>
			<div class="replydate">
				<span class="replyDate">{{board_reply_replyDate}}</span>
				<span class="replyer">{{board_reply_replyer}}</span>
			</div><br>
			<div class="board_reply" >
				<button rno={{board_reply_rno}} style="{{printStyle board_reply_replyer}}">X</button>
				<span id="Rcontent">{{board_reply}}</span>
			</div>
		</div>
	{{/each}}
	</script>
	<div id="pagination"></div>
</body>
<script>
var board_reply_bno="${vo.board_bno}";
var board_reply_replyer="${users_id}";
var users_note="${users_note}";
var page=1;

Handlebars.registerHelper("printStyle",function(writer){
	   var src;
	   if(board_reply_replyer!=writer && users_note != 1 || board_reply_replyer=="GUEST") {
		   src="display:none;";
	   } else if(users_note == 1) {
		   src="color:red;";
	   }
	   return src;
	   
	});
	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/QnAReply.json",
			data:{"board_reply_bno":board_reply_bno, "page":page},
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
                $("#tbl2").html(temp(data));
                $("#count").html(data.count);
                
              	//페이지 리스트 출력
                var str="";
                if(data.pm.prev){
                    str += "<a href='" + (data.pm.startPage-1) + "'>◀</a>"
                }
                for(var i=data.pm.startPage; i<= data.pm.endPage; i++){
                    if(data.pm.cri.page == i){
                        str += "[<a href='" + i + "' class='active'>" + i + "</a>]";
                    }else{
                        str += " [<a href='" + i + "'>" + i + "</a>]";
                    }
                }
                if(data.pm.next){
                    str += "<a href='" + (data.pm.endPage+1)  +  "'>▶</a>"
                }
                $("#pagination").html(str);
			}
		});
		
	    //페이지 번호를 클릭했을 경우
	    $("#pagination").on("click", "a", function(event){
	        event.preventDefault();
	        page = $(this).attr("href");
	        getList();
	    });
	}
	  
	$("#txtReply").keydown(function(key){
		if(key.keyCode==13){
			$("#btnInsert").click();
		}	
	});
	
	//댓글입력
	$("#btnInsert").on("click", function(){
		var board_reply=$("#txtReply").val();
		
		if(board_reply=="") {
			alert("댓글내용을 입력하세요");
			return;
		} 
		
		if(board_reply_replyer=="") {
			board_reply_replyer="GUEST";
		}
		
		$.ajax({
			type:"post",
			url:"/ReplyInsert",
			data:{"board_reply_bno":board_reply_bno, "board_reply":board_reply , "board_reply_replyer":board_reply_replyer},
			success:function(){
				alert("댓글이 입력되었습니다.");
				$("#txtReply").val("");
				getList();
			}
		});
	});
	
	
	
	//댓글삭제
	$("#tbl2").on("click", ".board_reply button", function(){
		var board_reply_rno=$(this).attr("rno");
		if(!confirm(board_reply_rno + " 번의 댓글을 삭제하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/ReplyDelete",
			data:{"board_reply_rno":board_reply_rno},
			success:function(){
				alert("삭제되었습니다.");
				getList();
			}
		});
	});
	
	
</script>
</html>