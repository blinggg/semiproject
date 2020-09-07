<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
   <title>RESERVATION</title>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
   <link
      href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
      rel='stylesheet' />
   <link
      href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
      rel='stylesheet' media='print' />
   <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
 @font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	font-family: '@여기어때 잘난체';
}

#page {
	background: white;
	margin: 15px;
	height: hidden;
}

#content {
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
	width: 90%;
	margin: auto;
	height: 900px;
}

#tbl1 {
	width: 38%;
	float: right;
	overflow: hidden;
	border-collapse: collapse;
	margin-bottom:10px;
	margin-top:80px;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
}

th {
	padding: 15px;
	font-size: 20px;
	border-bottom: 3px solid #e360f2;
}

#button {
	cursor: pointer;
}

#calendar {
	width: 61%;
	height: 60%;
	float: left;
}

.X {
	float: right;
	border: none;
	font-size: 20px;
	margin-botton: 5px;
	cursor: pointer;
	color:red;
}
.active {
	color: hotpink;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ RESERVATION ⊙</div><br><br>
		<div id="content">
   <div class="container calendar-container">
       <div id="calendar"></div>
   </div>
   <div id="reservation2">
         <table id="tbl1"></table>    
            <script id="temp" type="text/x-handlebars-template"> 
               <tr>
                  <th>예약번호</th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>예약시간</th>
               </tr>
               {{#each list}}
               <tr class="row">
                  <td class="reno">{{reservation_reno}}</td>
                  <td>{{reservation_id}}</td>
                  <td>{{users_name}}</td>
                  <td>
					{{reservation_redate}}
					<button class="X">X</button>
				  </td>
               </tr>
               {{/each}}
            </script>
			</div>
             <div id="pagination"></div>
		</div>
	</div>
</body>
<script type="text/javascript">



$(document).ready(function() {
 $('#calendar').fullCalendar({
  header:{
   left: 'prevYear,prev,next,nextYear,today',
   center: 'title',
   right:'none'
  },
  timeFormat: 'H(:mm)시',         
  events: function (title, start, timezone, callback) {
	$.ajax({
		type : "get" /* "POST", "GET" */,
		url : "/reservationlist" /* Request URL */,
		dataType : "json"/* jSonCalList에 json정보 담기 */,
     	success : function(data) {
  			var json = data.list;
		    var events = [];
			$.each(json,function(i,obj){
        		events.push({
					"title": json[i].users_name, 
            		"start": json[i].reservation_redate
           		});
      		}); 
      	callback(events);
     	}
    });
  }
 });
});


</script>
<script>
var page=1;

var users_id="${users_id}";

getList();

function getList() {
	   $.ajax({
	         type : "get",
	         url : "/reservationlistpage",
	         data : {"page":page},
	         dataType : "json",
	         success : function(data) {
	            var temp = Handlebars.compile($("#temp").html());
	            $("#tbl1").html(temp(data));
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
	                    str += "[<a href='" + i + "'>" + i + "</a>]";
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
      
      
   $("#tbl1").on("click", ".row .X", function(){
      var reservation_reno=$(this).parent().parent().find(".reno").html()
      $.ajax({
         type : "post",
         url : "/redelete",
         data:{"reservation_reno":reservation_reno},
         success : function() {
            alert("삭제 되었습니다.");
           	location.href="/reservation/admincalendar";
         }
      });
   });
   $(document).ready(function() {
		window.scrollTo({top:400, behavior:'smooth'});
	});
</script>
</html>