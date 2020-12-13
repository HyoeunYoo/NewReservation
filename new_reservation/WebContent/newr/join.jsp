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
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.main {
  display: block;
  width: 940px;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 0;
}
.page-title {
	font-size: 30px;
	text-align: center;
	margin: 80px 0 50px;
}
#join {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	/*padding-right: 40px;*/
}
ul > li {
	list-style-type: none;
}
.li {
	font-size: 20px;
}
.p {
	font-size: 13px;
	color: gray;
}

.cusjoin, .busijoin {
	width: 	100px;
	height: 100px;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

	<jsp:include page="optionbar.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="page-title">JOIN</div>

	<div class="row" id="join">
		<div class="col-md-2"></div>
		<div class="col-md-4" style="margin-left: -10px;">
			<ul>
				<li><a href="customer_join.jsp"><img src="customer_join.png" class="cusjoin"></a></li>
				<br>
				<li class="li">고객 회원가입</li>
				<li><p class="p">만 14세 이상인 고객 회원</p></li>
				<!-- <li>
					<form action="customer_join.jsp">
						<input type="submit" class="btn btn-default btn-block btn-lg" value="일반 회원가입">
					</form>
				</li> -->
			</ul>
		</div>
		<div class="col-md-4" style="margin-left: -5px;">
			<ul>
				<li><a href="business_join.jsp"><img src="business_join.png" class="busijoin"></a></li>
				<br>
				<li class="li">사업자 회원가입</li>
				<li><p class="p">사업자 등록증을 보유한 사업자 회원</p></li>
				<!-- <li>
					<form action="business_join.jsp">
						<input type="submit" class="btn btn-default btn-block btn-lg" value="사업자 회원가입">
					</form>
				</li> -->
			</ul>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<jsp:include page="footer.inc.jsp" flush="false"/>

</body>
</html>