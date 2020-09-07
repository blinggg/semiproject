<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<title>코로나 예방 수칙</title>
<style>
/* CSS */
.contents {
	margin: 0 auto;
	max-width: 800px;
}

.contents .title {
	margin: 10px 0;
	font-size: 25px;
	font-weight: 600;
	text-align: center;
}

.contents p {
	line-height: 20px;
	font-size: 14px;
}

.layerPopup {
	display: none;
}

.layerPopup:before {
	display: block;
	content: "";
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .5);
}

.layerPopup .layerBox {
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	padding: 30px;
	background: #fff;
	border-radius: 6px;
}

.layerPopup .layerBox .title {
	margin-bottom: 10px;
	padding-bottom: 10px;
	font-weight: 600;
	border-bottom: 1px solid #d9d9d9;
}

.layerPopup .layerBox .cont {
	margin-bottom: 40px;
}

.layerPopup .layerBox p {
	line-height: 20px;
	font-size: 13px;
}

.layerPopup .layerBox .btnClose {
	display: inline-block;
	position: absolute;
	right: 30px;
	bottom:23px;
	padding: 6px 12px;
	color: #444;
	font-size: 20px;
	border:none;
	cursor: pointer;
}

.layerPopup .layerBox .btnTodayHide {
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
}


</style>
</head>

<body>

	<!-- layer popup content -->
	<div class="layerPopup">
		<div class="layerBox">
			<h1 class="title">코로나 예방 수칙</h1>
			<div class="cont">
				<img src="display?fileName=popup.jpg" width=500 height=500 style="margin:0px;">
			</div>
		<div>
			<a href="javascript:;" class="btnTodayHide">오늘 하루 보지 않기</a>
			<button onClick="location.href='javascrfipt:;'" class="btnClose">X</button>
		</div>
	</div>
</div>
</body>
<script>
	var $layerPopup = document.querySelector('.layerPopup');
	var $btnLayerPopupClose = document.querySelector('.layerPopup .btnClose');
	var $btnLayerPopupTodayHide = document
			.querySelector('.layerPopup .btnTodayHide');

	//최초 레이어팝업 노출
	layerPopupShow();

	//레이어팝업 닫기 버튼 클릭
	$btnLayerPopupClose.addEventListener('click', function() {
		layerPopupHide(0);
	});

	//레이어팝업 오늘 하루 보지 않기 버튼 클릭
	$btnLayerPopupTodayHide.addEventListener('click', function() {
		layerPopupHide(1);
	});

	//레이어팝업 노출
	function layerPopupShow() {
		if ($.cookie('testCookie') == undefined) {
			$layerPopup.style.display = 'block'
		}
	}
	
	//레이어팝업 비노출
	function layerPopupHide(state) {
		//닫기버튼 오늘하루보지않기 버튼 무관하계 레이어팝업은 닫는다.
		$layerPopup.style.display = 'none'

		//오늘하루보지않기 버튼을 누른 경우
		if (state == 1) {
			//'testCookie' 이름의 쿠키가 있는지 체크한다.
			if ($.cookie('testCookie') == undefined) {
				//쿠키가 없는 경우 testCookie 쿠키를 추가
				$.cookie('testCookie', 'testCK', {
					expires : 1
				});
				
				/**
				    설명 :
				    임의로 testCookie라는 이름에 Y라는 값을 넣어주었고,
				    expires값으로 1을 주어 1일 후 쿠키가 삭제되도록 하였다.
				    path값을 '/'로 주면 해당사이트 모든페이지에서 유효한 쿠키를 생성한다.
				    특정페이지에서만 작동하려면 페이지 경로를 작성하면 된다.
				 **/
			}
		}
	}
</script>
</html>