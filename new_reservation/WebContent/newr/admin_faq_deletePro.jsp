<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

<%
int post_num = Integer.parseInt(request.getParameter("num"));
String post_title = request.getParameter("title");
String post_content = request.getParameter("content");
String id= (String)session.getAttribute("id");
String passwd = request.getParameter("passwd");

int num = 0;

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql= "select admin_passwd from env_vari where admin_id= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String admin_passwd=rs.getString("admin_passwd");
		
		if(passwd.equals(admin_passwd)){
		    sql = "DELETE FROM faq WHERE post_num= ? ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setInt(1,post_num);
		    pstmt.executeUpdate();

	    %>
		<script>
			location.href = 'admin_faq.jsp'
			alert("삭제 완료");
		</script>
	
		<%
		} else {
		%>
		<script> 
			alert("비밀번호 틀림");
			history.go(-1);
		</script>
<%
		}
	}
}catch(Exception e){ 
	e.printStackTrace();
}
%>