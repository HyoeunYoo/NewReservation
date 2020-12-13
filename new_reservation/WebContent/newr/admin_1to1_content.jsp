<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<%
String id ="";
try {
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
		response.sendRedirect("admin.jsp");
	else{
		int idx = Integer.parseInt(request.getParameter("idx"));
%>

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
.msg_btn {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 350px;
	width: 100px;
}

</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="optionbar_alogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="admin_header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-sm-3">
			<jsp:include page="admin_navi.inc.jsp" flush="false"/>
		</div>
	 
	    <div class="col-sm-9">
			<div class="page-header">
				<h3>문의 확인</h3>
			</div>
	
<%  
			String dbUrl = "jdbc:mysql://localhost:3306/newr";
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
	
			
				pstmt = conn.prepareStatement(
				"select * from question where question_num = ? ");
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String q_num = rs.getString(1);
					String question_writer = rs.getString(2);
					String question_date = rs.getString(5);
					String question_title = rs.getString(3);
					String question_content = rs.getString(4);
					String question_answer = rs.getString(7);
	%>
					<form class="form-horizontal" method="post" action="admin_1to1_answerPro.jsp">
					<input type="hidden" value="<%=q_num%>" name="q_num">
	
						<div class="form-group">
							<label class="col-sm-2 control-label" style="text-align: left;">작성자</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" value="<%=question_writer%>" readonly>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" style="text-align: left;">작성일</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" value="<%=question_date%>" readonly>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label" style="text-align: left;">제목</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" value="<%=question_title%>" name="q_title" readonly>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label" style="text-align: left;">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="10" readonly><%=question_content%></textarea>
							</div>
						</div>
	
	<%
						if(question_answer!=null){
	%> 						
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align: left;">답변</label>
								<div class="col-sm-10">
									<textarea class="form-control" readonly><%=question_answer%></textarea>
								</div>
							</div>
							<div class="form-group text-center">
								<input type="button" class="btn btn-default" value="목록보기" OnClick="location.href='admin_1to1.jsp'">
							</div>
							
						
						<%} else {%>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" style="text-align: left;">답변</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="answer"></textarea>
							</div>
						</div>
						
						<div class="form-group text-center">
							<input type="button" class="btn btn-default" value="목록보기" OnClick="location.href='admin_1to1.jsp'">
							<input type="submit" class="btn btn-danger" value="답변쓰기">
						</div>
	<%			
						}
				}
		        rs.close();
		        stmt.close();
		        conn.close();
	        } catch(SQLException e) {
				out.print(e.toString());
	        }

%> 			</form>		
		</div>   
	</div>
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