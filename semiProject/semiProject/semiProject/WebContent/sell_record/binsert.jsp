<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../enter.css" media="all" />
<title>이거어때</title>
</head>
<body>
	<div id=page>
	<div id="divTop"><jsp:include page="../top.jsp" /></div>
		<div id=header></div>
		<div id=center>
			<div id=menu><jsp:include page="../menu.jsp" /></div>
			<!-- contents -->
			<div id="contents" style="margin: auto;">
				<ul id="holder" class="txtControll">
				</ul>
				<h1>여기 어때?</h1>
				<div class="relCon">
					<!-- 아이디어 작성하기 -->
					<div class="proposal idea">
						<div class="info_comment">
							<dl>
								<dt>알려드립니다.</dt>
								<dd>
									<ul>
										<li>단순 불만 사항, 장난성 글, 욕설 및 비방, 광고글, 반복 게시물 등은 예고 없이 삭제될 수
											있습니다.</li>
										<li>게시판 성격에 맞지 않는 글은 임의로 이동되거나 삭제될 수 있습니다.</li>
									</ul>
								</dd>
							</dl>
						</div>

						<div class="staffTit mb20">
							<h3 class="fl">기본 입력 항목</h3>
							<p class="fr" style="width: 785px; float: right;">
								<img src="check.png" alt="필수 입력 사항">&nbsp;필수 입력 사항
							</p>
						</div>
						<div class="table04 mb40">
							<form name="frm" action="insert" method="post">
								<table summary="등록 및 수정" border="0" cellpadding="0"
									cellspacing="0" style="table-layout: fixed;">
									<caption>등록 및 수정</caption>
									<colgroup>
										<col width="140">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><span>제목</span><img src="check.png" alt="필수 입력 사항"
												class="essential"></th>
											<td><label for="title"><input type="text"
													name="title" class="input_text" id="title"
													style="width: 785px;" placeholder="제목은 40자 이내로 작성해주세요." /></label></td>
										</tr>
										<tr>
											<th><span>내용</span><img src="check.png" alt="필수 입력 사항"
												class="essential"></th>
											<td class="contentsTxt"><textarea name="contents"
													class="textarea" style="width: 795px;" id="content"
													value="내용을 입력하세요"></textarea></td>
										</tr>
									</tbody>
								</table>
								<input type=button value="목록"> <input type=submit
									value="아이디어 작성 완료"> <input type=reset value="취소">
							</form>
						</div>
						<!--// 아이디어 작성하기 -->
					</div>
				</div>
				<!--// contents -->
			</div>
		</div>
		<div id="divFoot" style="text-align: center"><jsp:include
				page="../footer.jsp" /></div>
	</div>
</body>

<script>
	//값이 들어가있는지 체크하는 식
	$(frm).submit(function(e) {
		e.preventDefault(); //서브밋 방지
		if (!confirm("저장하시겠습니까?"))
			return;

		var title = $(frm.title).val();
		var contents = $(frm.contents).val();

		alert(title + contents);

		if (title == "") {
			alert("제목을 입력하세요!");
			$(frm.title).focus();
		} else if (contents == "") {
			alert("내용을 입력하세요!");
			$(frm.contents).focus();
		} else {
			frm.submit();
		}

	});
</script>
</html>