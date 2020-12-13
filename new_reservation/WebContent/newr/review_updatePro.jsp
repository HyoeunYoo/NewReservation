<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

 
<%
int review_num = Integer.parseInt(request.getParameter("review_num"));
int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
String review_title = request.getParameter("review_title");
String review_content = request.getParameter("review_content");
int review_star = Integer.parseInt(request.getParameter("review_star"));

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	sql = "update review set schedule_num=?, review_title=?, review_content=?, review_star=? where review_num=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, schedule_num);
	pstmt.setString(2, review_title);
	pstmt.setString(3, review_content);
	pstmt.setInt(4, review_star);
	pstmt.setInt(5, review_num);
	pstmt.executeUpdate();
	
	%>
	<script>
		location.href = 'review_list.jsp'
		alert("수정 되었습니다.");
	</script>
	<%
    
} catch(Exception ex) {
	ex.printStackTrace();
}
%>