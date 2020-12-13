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

/* 비번입력 */
#custom_leave_form {
	width: 80%;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#inform_200 {
	width: 200px;
}

.b_pwd_input, .b_pwd_btn {
	margin-top: 20px;
	float: left;
}
.custom_leave_align {
	width: 315px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("schedule_num"));
%>

<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>
	
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="customer_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>예약취소</h3>
			</div>
			
			<form action="deleteReservePro.jsp" method="post" class="form-horizontal">
				<input type="hidden" name="num" value="<%=num%>">
				<div class="agreeArea">
					<div class="agree">
							<h6 align="left">
							<strong>예약 취소가 완료되면 해당 예약은 즉시 취소 됩니다.</strong><br><br>
							예약 취소 처리 후에는 해당 예약정보를 복원할 수 없으며,<br><br>
							재예약을 원할 시 예약을 재진행 해주셔야 합니다.<br><br>
							<strong>예약 취소 전에 아래 사항을 반드시 확인해 주시기 바랍니다.</strong><br><br>
							예약 시간까지 2시간 이내 취소 시 차후 불이익을 받으실 수 있습니다.<br><br>
							이 사항의 동의는 거부하실 수 있으며, <br><br>
							동의하지 않으시는 경우 예약이 제한되거나 불이익을 받으실 수 있습니다.
							</h6>
					</div>
					
					<p class="check">위 사항에 동의하십니까? <input type="checkbox" id="leave_agree"><label>동의함</label></p>
				</div>
			
			
				<div class="container" id="custom_leave_form">
					<div class="container custom_leave_align">
						<input type="password" placeholder="비밀번호를 입력해주세요." class="form-control b_pwd_input" id="inform_200" name="passwd">
						<input type="submit" class="btn btn-default b_pwd_btn" value="취소하기">
					</div>
				</div>
			
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>