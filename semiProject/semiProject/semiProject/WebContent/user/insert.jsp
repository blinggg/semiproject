<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>24/7 TFS</title>
   <link rel="stylesheet" href="/semiProject/home.css">
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
   <div id="divPage">
   <div id="divTop"><jsp:include page="../top.jsp" /></div>
   <div class="dropmenu">
			<ul id="dm_ul" style="background:white">
				<li><a id=plist href="/semiProject/product/list.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;

				<li>현황관리
					<ul>
						<li><a class=alist href="/semiProject/stock/list.jsp">재고현황</a></li>
						<li><a class=alist href="/semiProject/sell_status/list.jsp">판매현황</a></li>
						<li><a class=alist href="/semiProject/order/list.jsp">발주현황</a></li>
					</ul>
				</li>&nbsp;&nbsp;&nbsp;
				<li>등록관리
					<ul>
						<li><a class=alist href="/semiProject/order/insert.jsp">발주등록</a></li>
						<li><a class=alist href="/semiProject/product/insert.jsp">상품등록</a></li>
					</ul>
				</li>&nbsp;&nbsp;&nbsp;
				<li>이건어때
					<ul>
						<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
					</ul>
				</li>
			</ul>
		</div>
      <div id="center">

         <div id="content">
            <h2>점주 가입</h2>
            <form name="ufrm">
               <table id=tblNew width=500>
                  <tr class="row">
                     <td class="title">아이디</td>
                     <td><input type="text" name="cvs_id" placeholder="점주코드 ex)A01"></td>
                  </tr>
                  <tr class="row">
                     <td  class="title">비밀번호</td>
                     <td><input type="password" name="pass"></td>
                  </tr>
                  <tr class="row">
                     <td  class="title">이름</td>
                     <td><input type="text" name="name"></td>
                  </tr>
                  <tr class="row">
                     <td  class="title">이메일</td>
                     <td><input type="text" name="email"></td>
                  </tr>
                  <tr class="row">
                     <td  class="title">연락처</td>
                     <td><input type="text" name="tel"></td>
                  </tr>
               </table>
               <div style=text-align:center;margin-bottom:25px>
               <input type="submit" value="저장" id="btnSave">
               <input type="reset" value="취소" id="btnCancel">
               </div>
            </form>
         </div>
      </div>
      <div id="divFoot" style="text-align: center;"><jsp:include page="../footer.jsp" /></div>
   </div>
</body>
<script>
   $(ufrm).submit(function(e){
      e.preventDefault();
      if(!confirm("저장하시겠습니까?")) return;
      
      var cvs_id=$(ufrm.cvs_id).val();
      var pass=$(ufrm.pass).val();
      var name=$(ufrm.name).val();
      var email=$(ufrm.email).val();
      var tel=$(ufrm.tel).val();
      if(cvs_id=="" || pass=="" || email=="" || tel=="") {
         alert("모든 데이터를 입력하세요.");
      } else {
         $.ajax({
            type:"post",
            url:"/semiProject/user/cvs_insert",
            data:{"cvs_id":cvs_id, "pass":pass, "name":name, "email":email ,"tel":tel},
            dataType:"json",
            success:function(data){
               if(data.count==0) {
                  alert("등록 완료되었습니다.")
                  location.href="../index.jsp";
               } else {
                  alert("이미 등록된 회원입니다.");
                  $(ufrm.cvs_id).focus();
               }
            }
         });
      }
         
         
   });
</script>
</html>