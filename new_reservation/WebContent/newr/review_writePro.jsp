<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

 
<%
int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
String review_title = request.getParameter("review_title");
int review_star = Integer.parseInt(request.getParameter("review_star"));
String review_content = request.getParameter("review_content");

int num = 0;

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	pstmt = conn.prepareStatement("select max(review_num) from review");
	rs = pstmt.executeQuery();
	if(rs.next())
		num = rs.getInt(1)+1;
	else
		num = 1;
	
	pstmt = conn.prepareStatement("INSERT INTO review VALUES (?,?,?,?,?)");
	pstmt.setInt(1, num);
	pstmt.setInt(2, schedule_num);
	pstmt.setString(3, review_title);
	pstmt.setString(4, review_content);
	pstmt.setInt(5, review_star);
	pstmt.executeUpdate();
	
	%>
	<script>
		location.href = 'review_list.jsp'
		alert("등록 되었습니다.");
	</script>
	<%
    
} catch(Exception ex) {
	ex.printStackTrace();
}
%>