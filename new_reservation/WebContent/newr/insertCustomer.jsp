<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.customer.CustomerJoinDBBean" %>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="customer" class="newr.customer.CustomerJoinDataBean">
	<jsp:setProperty name="customer" property="*"/>
</jsp:useBean>

<%
CustomerJoinDBBean customerJoin = CustomerJoinDBBean.getInstance();
customerJoin.insertMember(customer); 
%>

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
		<h2><jsp:getProperty name="customer" property="customer_name" />님, NEW RESERVATION 회원이 되신 걸 환영합니다.</h2>
		<h4 style="margin-top: 30px;">
		회원님의 아이디는 <strong><jsp:getProperty name="customer" property="customer_id" /></strong> 입니다.<br><br>
		상단의 로그인 버튼을 눌러 로그인 후 사이트를 이용하여 주세요.<br><br>
		감사합니다.</h4>
		<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='index.jsp'">홈으로</button>
	</div>	
</div>
<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

</body>
</html>