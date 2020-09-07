<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="home.css">
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>로그인후 이용해주세요.</title>
</head>
<body>
<div id="divPage">
	<div id="divTop"><jsp:include page="top.jsp" /></div>
      <div id="divMenu"></div>
      <div id="divHeader" style=text-align:center>
         <!--여기에 내용출력 시작---------------------------- -->
		<h1>로그인후 이용해주세요.</h1><br>
		<img src="/semiProject/images/info.jpg" data-lazy-src="" data-width="693" data-height="615" alt="" class="se-image-resource">
	<div><input type="button" id="cvs_login" value="점주로그인" style="background-color:#2569C9;border:none;
  color: white;
  padding: 10px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
	<input type="button" id="company_login" value="관리자로그인" style="background-color:#2569C9;border:none;
  color: white;
  padding: 10px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;"></div>

	<!--여기에 내용출력 종료---------------------------- -->
	<div id="divFoot" style="text-align: center;"><jsp:include page="footer.jsp" /></div>
         </div>
      </div>
</body>
<script>

	$("#cvs_login").on("click", function(){
		location.href="/semiProject/user/cvs_login.jsp";
	});
	
	$("#company_login").on("click", function(){
		location.href="/semiProject/user/company_login.jsp";
	});
</script>
</html>