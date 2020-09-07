<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>LOGIN</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
* {
   font-family: 'Comic Sans MS';
}

body {
   background: black;
}

.title {
   margin-top: 40px;
   text-align: center;
   font-size: 80px;
   margin: auto;
}

.ortxt {
   text-align: center;
   margin: auto;
   font-size: 30px;
}
.or {
   text-align: center;
   margin: auto;
   font-size: 20px;
}


#id input, #pw input {
   width: 24.5%;
   height: 65px;
   font-size: 30px;
   padding:20px;
}

.btn, #id, #pw {
   text-align: center;
}

#divLoginPage {
   background: white;
   margin: 15px;
}

#btnLogin, #btnSignup {
   width: 26.5%;
   height: 90px;
   font-size: 50px;
   margin: 2px;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border: none;
   border-radius: 3px 3px 3px 3px;
}

#btnLogin:active, #btnSignup:active {
   background: #cca6cf;
}

.kakao, .naver {
   float: center;
   cursor: pointer;
}

.checks{
   margin-left:37%;
   margin-top: 10px;
   cursor: pointer;
}

.checks {
   position: relative;
}

.checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0
}

.checks input[type="checkbox"]+label {
   display: inline-block;
   position: relative;
   cursor: pointer;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
}

.checks input[type="checkbox"]+label:before { /* 가짜 체크박스 */
   content: ' ';
   display: inline-block;
   width: 21px; /* 체크박스의 너비를 지정 */
   height: 21px; /* 체크박스의 높이를 지정 */
   line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
   margin: -2px 8px 0 0;
   text-align: center;
   vertical-align: middle;
   background: #fafafa;
   border: 1px solid #cacece;
   border-radius: 3px;
   box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
      rgba(0, 0, 0, 0.05);
}

.checks input[type="checkbox"]+label:active:before, .checks input[type="checkbox"]:checked+label:active:before
   {
   box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
      rgba(0, 0, 0, 0.1);
}

.checks input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
   content: '\2714'; /* 체크표시 유니코드 사용 */
   color: #99a1a7;
   text-shadow: 1px 1px #fff;
   background: #e9ecee;
   border-color: #adb8c0;
   box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
      rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
}
</style>
</head>
<body>
   <div id="divLoginPage">
   	<jsp:include page="../index_include/menu.jsp" />
      <jsp:include page="../index_include/header.jsp" />
      <br><div class="title"><b>⊙ LOGIN ⊙</b></div><br>
      <div id="id"><input type="text" id="users_id" placeholder="　　ID" maxlength="20"/></div><br>
      <div id="pw"><input type="password" id="users_pass" placeholder="　　PASSWORD" maxlength="20"/></div>
      <div class="checks"><input type="checkbox" id="ex_chk"> <label for="ex_chk">로그인상태유지</label></div><br>
      <div class="btn"><input type="button" id="btnLogin" value="LOGIN"/></div>
      <div class="btn"><input type="button" id="btnSignup" value="SIGN UP"/></div>
      <div class="ortxt">or</div>
      <div class="or">
         <a href="https://kauth.kakao.com/oauth/authorize?client_id=46437f58302b5ad35f92bcb713a26e08&redirect_uri=http://localhost:8088/kakaoLogin2&response_type=code">
            <img class="kakao" src="../display?fileName=kakao.png" width=26.5%>
         </a>
         <!-- 네이버아이디로로그인 버튼 노출 영역 -->
         <div id="naver_id_login"></div>
           
         <!-- //네이버아이디로로그인 버튼 노출 영역 -->
         <script type="text/javascript">
            var naver_id_login = new naver_id_login("bkD4xjtArMlE7W11ZuTX", "http://localhost:8088/naverlogin2");
            var state = naver_id_login.getUniqState();
            naver_id_login.setButton("green", 5, 120);
            naver_id_login.setDomain("http://localhost:8088/index");
            naver_id_login.setState(state);
            naver_id_login.init_naver_id_login();
         </script>
      </div>
      <br>
   </div>
</body>
<script>
	var birthdayPointChk=false;
	
   $("#btnSignup").on("click",function(){
      window.close();
      var options = 'width=500, height=850, top=30, left=30, resizable=no, scrollbars=no, location=no';
      window.open('/user/signup', 'SIGN UP', options);
   })
   
   function getCookie(name) {
  		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  		return value? value[2] : null;
	}
	var a=getCookie('birthdayPointChk');
	var b=getCookie('users_idChk');
   
	if(a!=null && users_id==b){
  		birthdayPointChk=a;
  	  }
	
   $("#btnLogin").on("click",function(){
      var users_id=$("#users_id").val();
      var users_pass=$("#users_pass").val();
      var ex_chk=$("#ex_chk").is(":checked")==true;
      $.ajax({
         type:"post",
         url:"/user/login",
         data:{"users_id":users_id, "users_pass":users_pass, "ex_chk":ex_chk, "birthdayPointChk":birthdayPointChk},
         success:function(data){
            if(data==0){
                 alert("존재하지 않는 아이디입니다.");
              }else if(data==1){
                 alert("비밀번호가 일치하지 않습니다.");
              }else if(data==3){
                 alert("탈퇴한 회원입니다.");
              }else if(data==4){
                 alert("블랙리스트 처리된 회원입니다.");
              }else{
               var dest="${dest}";
            if(dest!=""){
               location.href="${dest}";
            }else{
               location.href="/index";
            }
            }
         }
      });
   });
   $("#users_pass").keydown(function(key){
         if(key.keyCode==13) {
            $("#btnLogin").click();
         }
      });
</script>
</html>