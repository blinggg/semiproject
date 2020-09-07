<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히히호호</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
#tbl1, #tbl2, #tbl3 {
	width: 1000px;
}

.image {
	width: 200px;
	float: left;
}

.help {
	width: 1000px;
	margin: auto;
	float: center;
	text-align: center;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<div id="divPage">
		<div id="divMenu"></div>
		<div id="divHeader">
			<h2>인 기 상 품 목 록</h2>
		</div>
		<div id="haha">
			<div class="help">
				<h2>5월 인기상품</h2>
				<div id="tbl1"></div>
				<script id="temp1" type="text/x-handlebars-template">  
         {{#each array}}
               
               <div class="image"><img src="{{printImage image}}"><br>
               상품명 : {{product_name}}<br>판매수량 : {{sold_quantity}}</div>
         {{/each}}      
      </script>
			</div>
			<br>
		</div>
	</div>
</body>
<script>
	var selMonth;

	getList(1);

	function getList(selMonth) {

		$
				.ajax({
					type : "get",
					url : "/record/topTen",
					data : {
						"selMonth" : selMonth
					},
					dataType : "json",
					success : function(data) {

						var template = Handlebars.compile($("#temp" + selMonth)
								.html());
						$("#tbl" + selMonth).html(template(data));
					}
				});
	}

	Handlebars.registerHelper("printImage", function(image) {
		var src;
		if (!image)
			src = "http://placehold.it/200x300";
		else
			src = "/img/product/" + image;
		return src;
	});
</script>
</html>