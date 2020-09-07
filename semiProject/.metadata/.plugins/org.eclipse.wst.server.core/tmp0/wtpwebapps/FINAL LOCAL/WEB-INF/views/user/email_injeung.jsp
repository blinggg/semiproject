<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-MAIL</title>
<style>
#e-mail{
   text-align:center;
}
* {
   font-family: 'Comic Sans MS';
   font-family: '@여기어때 잘난체';
}

body {
   background: black;
}

#e-maliPage1{
   background: white;
   margin: 15px;
   
}

h3{
   color:red;
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
   margin-bottom:20px;
}

input{
   height: 25px;
   
}

button:active {
   background: #cca6cf;
}

input::placeholder {
   text-align: center;
}
</style>
</head>
<body>
<div id="e-maliPage1">
   <form action="/emailCheckInjeung" method="post">
   <div id="e-mail">
      
      <img id="logoimg" src="../display?fileName=gif7.gif" width=200>
         <h1>인증번호 입력</h1>
         <h4>(인증번호가 일치해야 다음 단계로 넘어가실 수 있습니다.)</h4>
         <h3>전송받은 인증번호를 입력하여 주세요!</h3>
         <input type="text" name="requestDice" value="" size=40 placeholder="인증번호">
         <input type="hidden" value="${dice}" name="dice">
      <br><br>
      <div>
         <input type="hidden" name="users_id" value="${users_id}">
         <input type="hidden" name="users_pass" value="${users_pass}">
         <input type="hidden" name="users_passChk" value="${users_passChk}">
         <input type="hidden" name="users_name" value="${users_name}">
         <input type="hidden" name="users_birthday" value="${users_birthday}">
         <input type="hidden" name="users_birthdayYear" value="${users_birthdayYear}">
         <input type="hidden" name="users_birthdayMonth" value="${users_birthdayMonth}">
         <input type="hidden" name="users_birthdayDay" value="${users_birthdayDay}">
         <input type="hidden" name="users_gender" value="${users_gender}">
         <input type="hidden" name="users_zipcode" value="${users_zipcode}">
         <input type="hidden" name="users_address" value="${users_address}">
         <input type="hidden" name="users_addresss" value="${users_addresss}">
         <input type="hidden" name="users_addressDetail" value="${users_addressDetail}">
         <input type="hidden" name="users_phone" value="${users_phone}">
         <input type="hidden" name="users_email" value="${users_email}">
         <input type="hidden" name="idCHK" value="${idCHK}">
      </div>
      <button type="submit">인증번호 입력</button>
      </div>
   </form>
   </div>
</body>
</html>