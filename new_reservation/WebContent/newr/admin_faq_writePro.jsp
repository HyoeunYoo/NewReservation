<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

 
<%
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
	
	pstmt = conn.prepareStatement("select max(post_num) from faq");
	rs = pstmt.executeQuery();
	if(rs.next())
		num = rs.getInt(1)+1;
	else
		num = 1;
	
	pstmt = conn.prepareStatement("INSERT INTO faq VALUES (?,?,?)");
	pstmt.setInt(1, num);
	pstmt.setString(2, post_title);
	pstmt.setString(3, post_content);
	pstmt.executeUpdate();
	
	%>
	<script>
		location.href = 'admin_faq.jsp'
		alert("작성 완료");
	</script>
	<%
    
} catch(Exception ex) {
	ex.printStackTrace();
}
%>