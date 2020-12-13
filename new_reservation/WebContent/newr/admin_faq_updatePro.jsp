<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

 
<%
int post_num = Integer.parseInt(request.getParameter("num"));
String post_title = request.getParameter("title");
String post_content = request.getParameter("content");

int num = 0;

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	sql = "update faq set post_title=?, post_content=? where post_num=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, post_title);
	pstmt.setString(2, post_content);
	pstmt.setInt(3, post_num);
	pstmt.executeUpdate();
	
	%>
	<script>
		location.href = 'admin_faq.jsp'
		alert("수정 완료");
	</script>
	<%
    
} catch(Exception ex) {
	ex.printStackTrace();
}
%>