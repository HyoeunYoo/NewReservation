<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<style>
.main {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}
</style>
</head>
<body>

<jsp:include page="optionbar.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="page-header">
		<h3>회원가입 완료</h3>
	</div>
	
	<div style="margin-top: 30px;">
		<h2>이름님, NEW RESERVATION 회원이 되신 걸 환영합니다.</h2>
		<h4 style="margin-top: 30px;">
		회원님의 아이디는 <strong>@@@</strong> 입니다.<br><br>
		회원님의 패스워드는 아무도 알 수 없는 암호화 코드로 저장되므로 안심하셔도 좋습니다.<br><br>
		아이디, 패스워드 분실 시에는 아이디, 패스워드 찾기를 이용하여 찾을 수 있습니다.<br><br>
		회원 탈퇴는 언제든지 가능하며 탈퇴 후 일정기간이 지난 후, 회원님의 모든 소중한 정보는 삭제하고 있습니다.<br><br>
		상단의 로그인 버튼을 눌러 로그인 후 사이트를 이용하여 주세요.<br><br>
		감사합니다.</h4>
		<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='index.jsp'">홈으로</button>
	</div>

</div>
<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

</body>
</html>