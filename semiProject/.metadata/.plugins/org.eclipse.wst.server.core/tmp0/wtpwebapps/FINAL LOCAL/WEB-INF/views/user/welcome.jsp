<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체';
}

button {
	width: 400px;
	height: 60px;
	font-size: 30px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	cursor: pointer;
	text-align:center;
	margin:auto;
}

button:active {
	background: #cca6cf;
}

h1,h2 {
	text-align: center;
}
#wel{
	text-align: center;
}
</style>
<div id="wel">
	<img id="logoimg" src="../display?fileName=gif7.gif" width=200>
	<h1>WELCOME!</h1><h2>방울 방울 스튜디오에 오신것을<br>환영합니다!</h2>

<button>CLOSE</button>
</div>
<script>
	$("button").on("click",function(){
		window.close();
        opener.parent.location="/index";
	})
</script>