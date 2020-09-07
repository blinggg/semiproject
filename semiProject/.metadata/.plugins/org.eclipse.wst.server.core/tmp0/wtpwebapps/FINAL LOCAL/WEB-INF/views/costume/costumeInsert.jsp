<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSTUME</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
* {
   font-family: '@여기어때 잘난체';
}

#page {
   background: white;
   margin: 15px;
   padding-bottom: 30px;
   height: hidden;
}

#content {
   margin-top: none;
   margin-left: 70px;
   margin-right: 70px;
   padding: 30px;
   margin-top: 10px;
   text-align: center;
}

#tbl1 {
   width: 60%;
   margin: auto;
   overflow: hidden;
   border-collapse: collapse;
}

td {
   padding: 15px;
   border-bottom: 1px solid #e360f2;
}

th {
   padding: 15px;
   font-size: 30px;
   border-right: 3px solid #e360f2;
   border-bottom: 1px solid #e360f2;
}

.info {
   text-align: left;
   padding-left: 20px;
}

.title {
   font-size: 50px;
   text-align: center;
   margin: auto;
}

select {
   width: 100%;
   height: 25px;
   font-size: 20px;
   border: none;
   text-align-last: center;
}

select option {
   height: 25px;
   font-size: 20px;
   border: none;
   text-align-last: center;
}

.cart {
   width: 300px;
   height: 100px;
   font-size: 35px;
   margin: 2px;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border: none;
   border-radius: 3px 3px 3px 3px;
   float: right;
}

.cart:active {
   background: #cca6cf;
}
/*스타일 추가하기*/
input[type=file] {
   visibility: hidden;
   height: 0px;
}

.hidden {
   display: none;
}

#btnList, input[type="submit"] {
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

#reset:active {
   background: #757575;
}

input[type="submit"]:active, #btnList:active {
   background: #cca6cf;
}

.btn {
   margin: 20px;
}

input[type=text] {
   height: 25px;
   font-size: 20px;
   text-align: center;
   border: none;
}

#image {
   cursor: pointer;
}
</style>
</head>
<body>
   <jsp:include page="../index_include/menu.jsp" />
   <div id="page">
      <jsp:include page="../index_include/header.jsp" />
      <div class="title">⊙ COSTUME INSERT ⊙</div>
      <br> <br>
      <div id="content">
         <form name="frm" method="post" action="/costumeInsert"
            enctype="multipart/form-data">
            <table id="tbl1">
               <tr>
                  <th width=200>CODE</th>
                  <td><input type="text" name="lend_costume_code"
                     placeholder="ex)Z001"></td>
               </tr>
               <tr>
                  <th>NAME</th>
                  <td><input type="text" name="lend_costume_name"
                     placeholder="NAME"></td>
               </tr>
               <tr>
                  <th>IMAGE</th>
                  <td width=400><img id="image"
                     src="http://placehold.it/400x500" width=400> <input
                     type="file" id="isFile" name="file" accept="image/*" /></td>
               </tr>
               <tr class="hidden">
                  <th>AMOUNT</th>
                  <td><input type="text" name="lend_costume_amount" value=1></td>
               </tr>
               <tr>
                  <th>PRICE</th>
                  <td><input type="text" name="lend_costume_price"
                     placeholder="PRICE"></td>
               </tr>
               <tr>
                  <th>CONTENT</th>
                  <td><input type="text" name="lend_costume_content"
                     placeholder="상품상세정보를 입력해주세요"></td>
               </tr>
            </table>
            <div class="btn">
               <input type="submit" value="SAVE"> <input type="reset"
                  value="RESET" id="reset"> <input type="button"
                  value="LIST" id="btnList" onClick="location.href='/costumeList'">
            </div>
         </form>
      </div>
   </div>
   <jsp:include page="../index_include/chat.jsp" />
</body>
<script>
   //유효성 검사추가 08.04
   $(frm).submit(function(e) {
      e.preventDefault();
      if (!confirm("저장하시겠습니까?"))
         return;

      var code = $(frm.lend_costume_code).val();
      var name = $(frm.lend_costume_name).val();
      var price = $(frm.lend_costume_price).val();

      //이미지 관련 유효성 검사
      var imgFile = $("#isFile").val();
      var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;

      if (code == "") {
         alert("코스튬 코드를 입력하세요!");
         $(frm.code).focus();
      } else if (name == "") {
         alert("코스튬명을 입력하세요!");
         $(frm.name).focus();
      } else if ($("#isFile").val() == "") {
         alert("이미지 첨부는 필수입니다!");
         $("#isFile").focus();
         return;
      } else if (!imgFile.match(fileForm)) {
         alert("이미지 파일만 업로드 가능합니다.");
         return;
      } else if (price == "") {
         alert("코스튬 가격을 입력하세요!");
         $(frm.price).focus();
      } else {
         frm.submit();
         alert(code + "의 코스튬 내역이 입력되었습니다.");
      }
   });

   //이미지를 클릭했을때
   $("#image").on("click", function() {
      $(frm.file).click();
   });

   $("#btnImage").on("click", function() {
      $(frm.files).click();
   });

   //파일선택버튼을 눌렀을때(Multi)
   $(frm.files).on("change", function() {
      var files = $(frm.files)[0].files;
      var html = "";

      $.each(files, function(index, files) {
         html += "<img src='" + URL.createObjectURL(files) + "'>";
         $("#listFile").html(html);
      });

   });

   //이미지미리보기 
   $(frm.file).change(function(e) {
      var reader = new FileReader();
      reader.onload = function(e) {
         $("#image").attr("src", e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
   });
</script>
</html>