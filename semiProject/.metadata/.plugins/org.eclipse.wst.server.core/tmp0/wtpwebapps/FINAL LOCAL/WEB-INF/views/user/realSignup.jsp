<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>SIGN UP</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	font-size: 50px;
	margin: auto;
}

input[type=text] {
	height: 50px;
}

#users_passChk, #users_pass {
	height: 20px;
}

#users_passCHK {
	font-family: '@여기어때 잘난체';
	height: 20;
}

button,input[type="button"],#emailSendInjeung {
	height: 55px;
	width: 100px;
	margin-right: 2px;
}


.text {
	text-align: center;
}

.text textarea {
	resize: none;
}

.btn {
	text-align: center;
	font-family: '@여기어때 잘난체'
}

#divSignUpPage {
	background: white;
	margin: 15px;
}

.chk {
	margin-left: 15px;
	cursor: pointer;
}

input[type="submit"] {
	width: 200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

#reset {
	width: 200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}

input[type="submit"]:active {
	background: #cca6cf;
}

#reset:active {
	background: #757575;
}

.checks {
	position: relative;
	margin-left:15px;
}

.checks input[type="radio"] { /* 실제 체크박스는 화면에서 숨김 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}

.checks input[type="radio"]+label {
	display: inline-block;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="radio"]+label:before { /* 가짜 체크박스 */
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

.checks input[type="radio"]+label:active:before, .checks input[type="radio"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="radio"]:checked+label:before { /* 체크박스를 체크했을때 */
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
   <div id="divSignUpPage">
      <br><div class="title"><b>SIGN UP</b></div><br>
      <form name="frm" action="/user/insert" method="post">
         <div class="btn">
            <input type="text" size=35 placeholder="　　ID" maxlength="20" id="users_id" name="users_id" value="${users_id}" required/>
            <input type="button" value="중복확인" id="idCheck">
         </div><br>
         <div class="btn">
            <table class="checks">
	            <tr>
	            	<td><input type="password" size=35 placeholder="　　PASSWORD" maxlength="20" id="users_pass" name="users_pass" value="${users_pass}" required/></td>
	            	<td rowspan=2><span id="btnShow"><button>SHOW</button></span></td>
	            </tr>
	            <tr>
					<td><input type="password" size=35 placeholder="　　PASSWORD CHECK" maxlength="20" id="users_passChk" name="users_passChk" value="${users_passChk}" required/></td>
	            </tr>
	            <tr>
	            	<th colspan=2><span id="users_passCHK">비밀번호 확인</span></th>
         		</tr>
         	</table>
         </div><br>
         <div class="btn"><input type="text" size=48 placeholder="　　NAME" name="users_name" value="${users_name}" required/></div><br>
         <div class="btn">
            <input type="text" size=13 placeholder=" YEAR" id="users_birthdayYear" name="users_birthdayYear" value="${users_birthdayYear}" maxlength=4 minlength=4 required/> -
            <input type="text" size=13 placeholder=" MONTH" id="users_birthdayMonth" name="users_birthdayMonth" value="${users_birthdayMonth}" maxlength=2 minlength=2 required/> -
            <input type="text" size=13 placeholder=" DAY" id="users_birthdayDay" name="users_birthdayDay" value="${users_birthdayDay}" maxlength=2 minlength=2 required/>
            <input type="hidden" name="users_birthday" id="users_birthday">
         </div><br>
         <div class="checks">
         	<input type="radio" name="gender" size=35 id="ex_chk" required value="남자" <c:out value="${users_gender=='남자'?'checked':''}"></c:out>></input> <label for="ex_chk">남자</label>
            <input type="radio" name="gender" size=35 id="ex_chk1" required value="여자" <c:out value="${users_gender=='여자'?'checked':''}"></c:out>></input> <label for="ex_chk1">여자</label>
            <input type="hidden" name="users_gender" id="users_gender">
         </div><br>
         <div class="btn">
            <input type="text" size=35 placeholder="　　ZIP CODE" id="users_zipCode" name="users_zipcode" value="${users_zipcode}" required/>
            <span><button onClick="openAddress();">우편번호</button></span>
         </div><br>
         <div class="btn">
            <input type="text" size=48 placeholder="　　ADDRESS" id="users_address" name="users_addresss" value="${users_addresss}" required/>
         </div><br>
         <div class="btn">
            <input type="text" size=48 placeholder="　　ADDRESS DETAIL" id="users_addressDetail" name="users_addressDetail" value="${users_addressDetail}"/>
            <input type="hidden" name="users_address" id="users_add">
         </div><br>
         <div class="btn">
         	<input type="text" size=35 placeholder="　　PHONE NUMBER" id="phoneNum" name="users_phone" value="${users_phone}" required/>
        	<input type="button" id="phonecheck" value="중복확인">
         </div><br>
         <div class="btn">
            <input type="text" size=35 placeholder="　　E-MAIL" name="users_email" id="users_emailCHK" value="${users_email}" required readonly/>
            <input type="button" id="emailSendInjeung" value="이메일 인증">
         </div><br>
         <input type="hidden" id="idCHK" name="idCHK" value="${idCHK}">
         <input type="hidden" id="phoneCHK" name="phoneCHK" value="${phoneCHK}">
         <div class="btn">
            <input type="submit" id="signup" value="SIGN UP"/>
            <input type="button" id="reset" value="CANCEL"/>
         </div><br>
      </form>
      
   </div>
</body>
<script>
var idCHK=false;
var emailCHK=false;
var phoneCHK=false;

var idchk=$("#idCHK").val();
if(idchk){
   idCHK=true;
   emailCHK=true;
   phoneCHK=true;
}

$("#emailSendInjeung").on("click", function(){
   
   if(idCHK==false){
      alert("아이디를 중복확인 해주세요!");
      return;
   }
   if(phoneCHK==false){
       alert("연락처를 중복확인 해주세요!");
       return;
    }
   
   var users_birthday=$("#users_birthdayYear").val()+"-"+$("#users_birthdayMonth").val()+"-"+$("#users_birthdayDay").val();
   $("#users_birthday").val(users_birthday);

   var addressHap=$("#users_address").val()+" "+$("#users_addressDetail").val();
   $("#users_add").val(addressHap);
   
   var gender=$('input[name="gender"]:checked').val();
   $("#users_gender").val(gender);
   
   frm.action="/user/email";
   frm.method="get";
   frm.submit();
});

/*우편번호*/
function openAddress() {
   new daum.Postcode({
      oncomplete:function(data) {
         $("#users_zipCode").val(data.zonecode);
         $("#users_address").val(data.address);
         $("#users_addressDetail").focus();
         }
   }).open();
}

$("#phoneNum").change(function(){
   phoneCHK=false;
   $("#phoneCHK").val(phoneCHK);
});

$("#users_id").change(function(){
      idCHK=false;
      $("#idCHK").val(idCHK);
   });

$(frm).submit(function(e){
   e.preventDefault();
   if(idCHK==false){
      alert("아이디를 중복확인 해주세요!");
      return;
   }
   if(emailCHK==false){
      alert("이메일을 인증해주세요!");
      return;
   }
   if(phoneCHK==false) {
      alert("연락처 인증을 해주세요.");
      return;
   }
   
   /*생년월일 정규식*/
   var users_birthday=$("#users_birthdayYear").val()+"-"+$("#users_birthdayMonth").val()+"-"+$("#users_birthdayDay").val();
   var users_birthdayChk = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
   
   if(!users_birthdayChk.test(users_birthday)){
      alert("생년월일을 다시 입력해주세요.");
      return;
   }else{
      $("#users_birthday").val(users_birthday);
   }
   
   /*주소 합치기*/
   var zzinAddress=$("#users_address").val()+" "+$("#users_addressDetail").val();
   $("#users_add").val(zzinAddress);
   
   var gender=$('input[name="gender"]:checked').val();
   $("#users_gender").val(gender);

   var users_email=$("#users_emailCHK").val();
   
       $.ajax({
          type:"get",
          url:"/user/echeck",
          data:{"users_email":users_email},
          success:function(data){
             if(data==2){
                frm.submit();
                alert("가입되었습니다.");
             }else{
                alert("이미 사용중인 이메일입니다.");
             }
          }
       });
});

/*비밀번호 확인*/
passChk();
function passChk(){
   $("#users_pass, #users_passChk").change(function(){
      var users_pass=$("#users_pass").val();
      var users_passChk=$("#users_passChk").val();
      
      if(users_pass==users_passChk){
         $("#users_passCHK").html("비밀번호가 일치합니다.");
      }else if(users_pass!=users_passChk){
         $("#users_passCHK").html("비밀번호가 일치하지 않습니다.");
      }
      
      if(users_pass=="" || users_passChk==""){
         $("#users_passCHK").html("");
      }
   });
}

/*아이디중복확인*/
$("#idCheck").on("click", function(){
   var users_id=$("#users_id").val();
   
   if(users_id==""){
      alert("아이디를 입력해주세요!");
      return;
   }else{
      $.ajax({
         type:"get",
         url:"/user/check",
         data:{"users_id":users_id},
         success:function(data){
            if(data==0){
               alert("사용가능한 아이디입니다.");
               idCHK=true;
               $("#idCHK").val(idCHK);
            }else{
               alert("이미 사용중인 아이디입니다.");
               idCHK=false;
               $("#idCHK").val(idCHK);
            }
         }
      });
   }
});

/*연락처중복확인*/
$("#phonecheck").on("click", function(){
   var users_phone=$("#phoneNum").val();
   users_phone=users_phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
   
   if(users_phone==""){
      alert("연락처를 입력해주세요!");
      return;
   }else{
      $.ajax({
         type:"get",
         url:"/user/pcheck",
         data:{"users_phone":users_phone},
         success:function(data){
            if(data==2){
               alert("사용가능한 연락처입니다.");
               phoneCHK=true;
               $("#phoneNum").val(users_phone);
            }else{
               alert("이미 사용중인 연락처입니다.");
               phoneCHK=false;
               $("#phoneNum").val(users_phone);
            }
         }
      });
   }
});

//mouseOver   
$("#btnShow").mouseover(function(){
   $(".btn #users_pass").prop("type", "text");
});
$("#btnShow").mouseout(function(){
   $(".btn #users_pass").prop("type", "password");
});

$("#reset").on("click",function(){
   window.close();
})

</script>

</html>