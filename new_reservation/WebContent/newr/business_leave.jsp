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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
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
/*약관*/
.agreeArea{
	/*padding: 0;*/
	/*color: #555;*/
	font-size: 11px;
	line-height: 20px;
}
.agreeArea .agree{
	overflow: auto;
	height: 180px;
	padding: 10px 3px 10px 10px;
	border: 1px solid #B2B2B2;
	background: #fff;

	/*추가*/
	width: 550px;
	margin-left: auto;
	margin-right: auto;
}
.agreeArea .agree p{
	text-align: left;
	/*padding: 0;*/
}
.check {
	padding: 15px 0 0 0;
	color: #333;
	font-size: 12px;
	text-align: right;
	width: 550px;
	margin-left: auto;
	margin-right: auto;
}
.agreeArea {
	margin-top: 50px;
}
</style>
</head>
<body>

<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>
	
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="business_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<jsp:include page="business_leave.inc.jsp" flush="false"/>
		</div>
	</div>
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>