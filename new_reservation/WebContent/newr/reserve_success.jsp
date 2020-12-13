<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="newr.login.LoginDBBean"%>
<% request.setCharacterEncoding("utf-8");%>

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
<%
	String id ="";
	try{
		id = (String)session.getAttribute("id");
		if(id==null || id.equals("")){
			response.sendRedirect("index.jsp");
		}
		else{
			LoginDBBean login = LoginDBBean.getInstance();
			boolean check= login.loginCheck(id);
			if(check==true) {%>
				<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>
			<%}
			else { %>
				<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>
			<% }%>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="page-header">
		<h3>예약완료</h3>
	</div>
	
	<%
	LoginDBBean login2 = LoginDBBean.getInstance();
	boolean check2= login2.loginCheck(id);
	if(check2 == true) {
		String dbUrl = "jdbc:mysql://localhost:3306/newr";
		Class.forName("com.mysql.jdbc.Driver");
		try {
			Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
			Statement stmt = conn.createStatement();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String name = "";
			pstmt = conn.prepareStatement("select customer_name from customer where customer_id = ?");
		 	pstmt.setString(1, id);
		 	rs = pstmt.executeQuery();
		 	if(rs.next()){
		 		name = rs.getString(1);
		 	}
		 	rs.close();
		%>
			<div style="margin-top: 30px;">
				<h2><%=name%>님 예약이 완료되었습니다.</h2>
				<h4 style="margin-top: 30px;">예약 변경 및 취소와 관련한 사항은 공지사항을 확인해주세요.</h4>
				<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='main.login.jsp'">홈으로</button>
				<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='customer_history.jsp'">예약내역보기</button>
			</div>
			<%
		}catch(Exception e){
			e.printStackTrace();
		}
	}//고객 끝
	
	else {
	%>
		<div style="margin-top: 30px;">
			<h2>예약이 완료되었습니다.</h2>
			<h4 style="margin-top: 30px;">예약 내역에서 확인해 주세요.</h4>
			<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='main.login.jsp'">홈으로</button>
			<button class="btn btn-default" type="button" style="margin-top: 20px;" OnClick="window.location='business_history_.jsp'">예약내역보기</button>
		</div>
	<%
	}
	%>
	

</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<%
}//else 끝
}catch(Exception e){
	e.printStackTrace();
}
%>