<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<% request.setCharacterEncoding("utf-8");%>

<%
int review_num = Integer.parseInt(request.getParameter("review_num"));
String id= (String)session.getAttribute("id");
String passwd = request.getParameter("passwd");

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql= "select customer_passwd from customer where customer_id= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String customer_passwd = rs.getString("customer_passwd");
		
		if(passwd.equals(customer_passwd)){
		    sql = "DELETE FROM review WHERE review_num= ? ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setInt(1,review_num);
		    pstmt.executeUpdate();

	    %>
		<script>
			location.href = 'review_list.jsp'
			alert("삭제 되었습니다.");
		</script>
	
		<%
		} else {
		%>
		<script> 
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
		}
	}
}catch(Exception e){ 
	e.printStackTrace();
}
%>