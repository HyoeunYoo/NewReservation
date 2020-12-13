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
<style>
.main {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}

#inform {
	display: block;
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 10px;
	text-align: left;
}
.surgery_info {
	border: 1px solid lightgray;
	width: 150px;
	height: 150px;
	border-radius: 25px;
	cursor: pointer;
	margin-top: 50px;
}
.sg_select {
	text-align: center;
	margin-top: 50px;
	font-size: 1.5em;
}
.sg_detail {
	text-align: center;
	font-size: 1em;
	color: gray;
	margin-top: -30px;

}
#join {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	/*padding-right: 40px;*/
}

.cusjoin, .busijoin {
	width: 	100px;
	height: 100px;
}
.nailcontainer, .eyelashconatiner, .waxingcontainer {
	margin-left: -15px;
}
a:link, a:visited, a:active {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>

<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="business_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>시술정보</h3>
			</div>

			<div class="row" id="join">
				<div class="container nailcontainer col-md-6">
					<ul>
						<a href="business_surgery_enroll.jsp">
							<div class="container surgery_info" id="inform">
								<p class="sg_select">등록</p><br>
								<p class="sg_detail">직원 등록</p>
							</div>
						</a>
					</ul>
				</div>
				<div class="container eyelashcontainer col-md-6" >
					<ul>
						<a href="business_surgery_management.jsp">
							<div class="container surgery_info" id="inform">
								<p class="sg_select">조회/삭제</p><br>
								<p class="sg_detail">직원 조회/삭제</p>
							</div>
						</a>
					</ul>
				</div>

			</div>

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>