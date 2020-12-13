var map;
$(document).ready(function(){
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var center = new daum.maps.LatLng(37.558378, 127.049119);
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: center, //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
});