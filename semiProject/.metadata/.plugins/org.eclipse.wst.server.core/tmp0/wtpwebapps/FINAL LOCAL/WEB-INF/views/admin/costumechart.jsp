<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>COSTUME CHART</title>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <style>
select{
   height: 30px;
   font-size: 20px;
   border: none;
}

#COSTUME{
   color:#e360f2;
   font-size: 50px;
   text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
   margin:20px;
}
#chart_div3,#chart_div4{
   margin:auto;
}

.cbtnMonth{
   width: 80px;
   height: 30px;
   font-size: 15px;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border: none;
   border-radius: 3px 3px 3px 3px;
}

.cbtnMonth:active {
   background: #cca6cf;
}

</style>
</head>
<body>
      <div id="COSTUME">COSTUME CHART</div>
      <select id="cselYear" style="height: 25px;">
         <option value="2015">2015년</option>
         <option value="2016">2016년</option>
         <option value="2017">2017년</option>
         <option value="2018">2018년</option>
         <option value="2019">2019년</option>
         <option value="2020" selected>2020년</option>
         <option value="2021">2021년</option>
         <option value="2022">2022년</option>
         <option value="2023">2023년</option>
         <option value="2024">2024년</option>
         <option value="2025">2025년</option>
         <option value="2026">2026년</option>
         <option value="2027">2027년</option>
         <option value="2028">2028년</option>
         <option value="2029">2029년</option>
         <option value="2030">2030년</option>
      </select>
      <select id="cselMonth">
         <option value="1">1월</option>
         <option value="2">2월</option>
         <option value="3">3월</option>
         <option value="4">4월</option>
         <option value="5">5월</option>
         <option value="6">6월</option>
         <option value="7">7월</option>
         <option value="8" selected>8월</option>
         <option value="9">9월</option>
         <option value="10">10월</option>
         <option value="11">11월</option>
         <option value="12">12월</option>
      </select>
      <button class="cbtnMonth">SHOW</button>
      <div id="chart_div3" style="width: 600px; height: 500px;"></div>
      <div id="chart_div4" style="width: 600px; height: 500px;"></div>

</body>
<script type="text/javascript">
var varTitle;

$(".cbtnMonth").click(function(){
   var month=$("#cselMonth option:checked").val();
   var year=$("#cselYear option:checked").val();
   varTitle=$("#selChart option:checked").text();
   changeChart();
});

changeChart();

function changeChart(){
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
    function drawVisualization() { 
       
       var month=$("#cselMonth option:checked").val();
       var year=$("#cselYear option:checked").val();
       
        $.ajax({
            type:"get",
            url:"/costumechartt",
            data:{"month":month, "year":year},
            dataType:"json",
          
            success:function(result){
              //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                /* 데이터 셋팅 */
                var data = google.visualization.arrayToDataTable(result);

                /* 옵션 셋팅 */
                var options = {
                   title : varTitle,
                    seriesType: 'bars',
                    
                };

                /* 차트 그리기 */
                var chart = new google.visualization.ComboChart(document.getElementById('chart_div3'));
                chart.draw(data, options);
                
            }
        });
        $.ajax({
            type:"get",
            url:"/costumechartt2",
            dataType:"json",
            data:{"month":month, "year":year},
            success:function(result){
              //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                /* 데이터 셋팅 */
                var data = google.visualization.arrayToDataTable(result);

                /* 옵션 셋팅 */
                var options = {
                   title : varTitle,
                    seriesType: 'line'
                   
                };

                /* 차트 그리기 */
                var chart = new google.visualization.ComboChart(document.getElementById('chart_div4'));
                chart.draw(data, options);
                
            }
        });
    }
}

</script>
</html>