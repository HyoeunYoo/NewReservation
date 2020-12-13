<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.login.LoginDBBean"%>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
	       response.sendRedirect("admin.jsp");
	else{
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW Reservation</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="optionbar_alogin.inc.jsp" flush="false"/>
<div class="main">
	<jsp:include page="admin_header.inc.jsp" flush="false"/>
	
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="admin_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>메뉴를 선택하세요.</h3>
			</div>
			<div>
				<button class="btn btn-default" onclick="document.location.href='index.jsp'">사용자 화면으로 가기</button>
			</div>
		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->

</div>
<jsp:include page="footer.inc.jsp" flush="false"/>

</body>
</html>

<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>