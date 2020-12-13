<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>


<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
	       response.sendRedirect("admin.jsp");
	else{
%>

<%
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("post_num"));
		
		String dbUrl = "jdbc:mysql://localhost:3306/newr";
		Class.forName("com.mysql.jdbc.Driver");
		try {
			Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
			Statement stmt = conn.createStatement();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			pstmt = conn.prepareStatement("select * from faq where post_num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String title = rs.getString(2);
				String content = rs.getString(3);
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
				<h3>FAQ 게시물 수정</h3>
			</div>

			<form class="form-horizontal" method="post" action="admin_faq_updatePro.jsp">
				<input type="hidden" name="num" value="<%=num%>">
				<div class="form-group">
					<label class="col-sm-1 control-label" style="text-align: left;">제목</label>
					<div class="col-sm-11">
						<input class="form-control" type="text" name="title" value="<%=title%>">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-1 control-label" style="text-align: left;">내용</label>
					<div class="col-sm-11">
						<textarea class="form-control" name="content" rows="10"><%=content%></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-1 control-label" style="text-align: left;"></label>
					<div class="col-sm-11">
						<input type="button" class="btn btn-default" value="취소" OnClick="history.go(-1)">
						<input type="submit" class="btn btn-success" value="수정">
					</div>
				</div>
			</form>

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
</body>
</html>
<% 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>