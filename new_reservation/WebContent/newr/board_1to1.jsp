<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="newr.login.LoginDBBean"%>


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

table > tbody {
	cursor: pointer;
}

a:link, a:visited, a:active {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	
	if(id==null || id.equals(""))%>
		<jsp:include page="optionbar.inc.jsp" flush="false"/>
	<%
	else{
		LoginDBBean login = LoginDBBean.getInstance();
		boolean check= login.loginCheck(id);
		if(check==true) {%>
			<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>
		<%}
		else { %>
			<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>
		<% }
		}%>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="board_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>1:1 문의</h3>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">no.</th>
						<th class="text-center" width=40%>제목</th>
						<th class="text-center">글쓴이</th>
						<th class="text-center">날짜</th>
					</tr>
				</thead>
<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;

				int total = 0;
				ResultSet rs = null;
				ResultSet rs2 = null;

				pstmt = conn.prepareStatement(
				"select count(*) from question");
				rs = pstmt.executeQuery();

				if(rs.next()){
					total = rs.getInt(1);
				}
				
				//out.print("총 문의 : " + total + "개");
				
				int number = total;

				pstmt2 = conn.prepareStatement(
				"select * from question order by question_num desc");
				rs2 = pstmt2.executeQuery();

				while(rs2.next()){
				String idx = rs2.getString(1);
				String writer = rs2.getString(2);
				String title = rs2.getString(3);
				Date date = rs2.getDate(5);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
				String s_date = sdf.format(date);
			
%>
				<tbody>
					<tr>
						<td class="text-center"><%=number%></td>
						<td class="text-center" style="text-overflow: ellipsis; overflow: hidden; cursor: pointer;"><nobr><a href="board_1to1_check.jsp?idx=<%=idx%>"><%=title%></a></td>
						<td class="text-center"><%=writer%></td>
						<td class="text-center"><%=s_date%></td>
					</tr>
				</tbody>

<%				number--;
				}

		        rs.close();
		        stmt.close();
		        conn.close();

		        } catch(SQLException e) {
					out.print(e.toString());
		        }

%>
			</table>
		
		</div><!-- col-md-9 끝 -->
		
		<div style="text-align: right;">
			<button class="btn btn-default" type="button" OnClick="window.location='board_content_write.jsp'">글쓰기</button>
		</div>
	</div><!-- row 끝 -->
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>
</body>
</html>
<% 
	
    }catch(Exception e){
		e.printStackTrace();
	}
%>