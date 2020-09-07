<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>네이버로그인</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("bkD4xjtArMlE7W11ZuTX", "http://localhost:8088/naverlogin");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		function naverSignInCallback() { // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			//alert(naver_id_login.getProfileData('email'));
			//alert(naver_id_login.getProfileData('nickname'));
			//alert(naver_id_login.getProfileData('age'));
			location.href = "/loginNaverResult2?email="+ naver_id_login.getProfileData('email')+"&nickname="+naver_id_login.getProfileData('nickname');
		}
	</script>
</body>
</html>