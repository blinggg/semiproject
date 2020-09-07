<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>INTRODUCE</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
 @font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
   font-family: '@여기어때 잘난체'
}

#page {
   background: white;
   margin: 15px;
   padding-bottom:30px;
   height: hidden;
}

#content {
   margin-top: none;
   margin-left: 70px;
   margin-right: 70px;
   padding: 30px margin-top: 10px;
   text-align: center;
}

.title {
   font-size: 50px;
   text-align: center;
   margin: auto;
}

#map {
   width: 80%;
   height: 600px;
   margin: auto;
}

.text{
   text-align: center;
   margin-top:50px;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp" />
   <div id="page">
      <jsp:include page="header.jsp" />
      <div class="title">⊙ INTRODUCE ⊙</div>
      <br> <br>
      <div id="map"></div>

      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d06e7f6c04a5b6cff4d94cebfef1694"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.438754, 126.675112), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = '../display?fileName=gif77.gif', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(50, 40), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.438754, 126.675112); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

var iwContent = '<div style="padding:5px;">방울방울 스튜디오 <br><a href="https://map.kakao.com/link/map/방울방울%20스튜디오,37.438754, 126.675112" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/방울방울%20스튜디오,37.438754, 126.675112" style="color:blue" target="_blank">길찾기</a></div>', 
iwPosition = new kakao.maps.LatLng(37.438754, 126.675112); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
      <div class="text">
         인천 미추홀구 매소홀로 488번길 6-32 태승빌딩 5층<br><br>(지번) 학익동 663-1<br><br>032-876-3332
      </div>
   </div>
   <jsp:include page="chat.jsp" />
</body>
</html>