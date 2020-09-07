<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SIGN UP</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: 'Comic Sans MS';
}

body {
	background: black;
}

.title {
	margin-top:40px;
	text-align: center;
	font-size: 50px;
	margin:auto;
}

.text{
	text-align: center;
}

.text textarea{
	resize:none;
}

.btn {
	text-align: center;
	margin: 10px;
}

#divSignUpPage {
	background: white;
	margin: 15px;
}

#next{
	width:200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}

#reset{
	width:200px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}

#next:active {
	background: #cca6cf;
}

#reset:active {
	background: #757575;
}

.checks{
	margin-left: 15px;
	margin-bottom: 5px;
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
	<div id="divSignUpPage">
		<br><div class="title"><b>SIGN UP</b></div><br><br>
		<div class="checks"><input type="checkbox" id="ex_chk"> <label for="ex_chk">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label></div><br><br>
		<div class="checks"><input type="checkbox" id="ex_chk1" class="ex_chk"> <label for="ex_chk1">회원약관 (필수)</label></div>
		<div class="text"><textarea rows="9" cols="47" readonly>
제 1 조 (목적)
1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)
1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.

제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.

제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
</textarea></div><br>
		<div class="checks"><input type="checkbox" id="ex_chk2" class="ex_chk"> <label for="ex_chk2">개인정보 수집 및 이용 동의 (필수)</label></div>
		<div class="text"><textarea rows="9" cols="47" readonly>
1. 개인정보 수집항목 및 수집목적
회사는 고객에게 서비스 제공에 관한 계약이행 및 주문에 대한 관리, 관계법령의 준수와 보다 나은 서비스를 위하여 개인정보를 수집하고 있으며,
수집항목 및 목적은 다음과 같습니다.
① 수집항목
- 물품주문시 : 성명, 주소, 전화번호, 이메일주소, 주문비밀번호와 물품수령인의 성명, 배송주소, 전화번호
- 대금결제시 : 은행계좌정보 또는 신용카드정보
- 현금영수증 발급시 : 전화번호
- 주문정보 확인시 : 방문일시, 거래내역
② 수집목적
- 서비스 제공에 관한 계약이행 : 요금정산, 배송, 고객상담 및 민원처리
- 주문관리 : 본인확인, 개인식별, 분쟁조정을 위한 기록보존, 불만처리, 고지사항 전달
- 마케팅 활용 : 서비스 이용 통계, 접속빈도 파악
- 법령의 준수 : 서비스와 관련하여 법령에 따른 기록의 보존 및 제공

2. 개인정보 보유 및 이용기간
회사는 거래완결시까지 관계법령(전자상거래 등에서의 소비자보호에 관한 법률 등)에 따라 회사가 개인정보 및 기록보유 의무나 권한을 가진 기간
동안 개인정보를 보유하고 이용하게 됩니다.,
① 계약 및 청약철회 등에 관한 기록 : 5년
② 대금결제 및 재화 등의 공급에 관한 기록 : 5년
③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
④ 표시, 광고에 관한 기록 : 6개월

3. 개인정보 파기절차 및 그 방법
고객의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체없이 파기합니다.
회사의 개인정보 파기절차 및 방법은 다음과 같습니다.
① 파기절차
- 고객이 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된후 파기됩니다.
② 파기방법- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
4. 개인정보 제공 및 공유
회사는 이용자들의 개인정보를 [1. 개인정보 수집항목 및 수집목적]에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
단, ㈜다나와의 호스팅서비스 사용계약 및 회사에서 이루어지는 물품구매에 대한 고객서비스 응대를 위해 ㈜다나와와 아래와 같은 정보를 공유합니다.
- 주문자정보 : 이름, 전화번호, 휴대전화번호, 이메일, 주소
- 배송지정보 : 이름, 전화번호, 휴대전화번호, 주소
			</textarea></div><br>
		<div class="checks"><input type="checkbox" id="ex_chk3" class="ex_chk"> <label for="ex_chk3">전자상거래(인터넷사이버몰) 표준약관 (필수)</label></div>
		<div class="text"><textarea rows="9" cols="47" readonly>
전자상거래(인터넷사이버몰) 표준약관
표준약관 제10023호
(2015. 6. 26. 개정)
제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
제2조(정의)
  ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
제3조 (약관 등의 명시와 설명 및 개정) 
  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
제4조(서비스의 제공 및 변경) 
  ① “몰”은 다음과 같은 업무를 수행합니다.
    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타 “몰”이 정하는 업무
  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
제5조(서비스의 중단) 
  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
제6조(회원가입) 
  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
</textarea></div><br>
		<div class="btn">
			<input type="button" id="next" value="NEXT"/>
			<input type="button" id="reset" value="CANCEL"/>
		</div>
		<br>
	</div>
</body>
<script>
	
	//각 행에있는 체크버튼을 클릭 했을 때
	$("#divSignUpPage").on("click", ".checks .ex_chk", function() {
	   var isChkAll = true;
	   $("#divSignUpPage .checks .ex_chk").each(function() {
	      if (!$(this).is(":checked")) {
	         isChkAll = false;
	      }
	   });
	   if (isChkAll) {
	      $("#divSignUpPage #ex_chk").prop("checked", true);
	   } else {
	      $("#divSignUpPage #ex_chk").prop("checked", false);
	   }
	});
	
	//전체 체크버튼을 클릭 했을때
	$("#divSignUpPage").on("click", "#ex_chk", function() {
	   if ($(this).is(":checked")) {
	      $("#divSignUpPage .checks .ex_chk").each(function() {
	         $(this).prop("checked", true);
	      });
	   } else {
	      $("#divSignUpPage .checks .ex_chk").each(function() {
	         $(this).prop("checked", false);
	      });
	   }
	});
	
	$("#next").on("click",function(){
		if($("#ex_chk").is(":checked") == true) {
			location.href="/user/realSignup";
	      } else {
	         alert("약관을 모두 동의해주세요!");
	         return;
	      }
	})
	
	$("#reset").on("click",function(){
		window.close();
	})
	
</script>
</html>