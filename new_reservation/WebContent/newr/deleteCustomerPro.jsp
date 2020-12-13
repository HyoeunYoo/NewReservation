<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8"); %>

<%
	// 세션 아이디와 입력한 비밀번호를 얻어옴
	String id= (String)session.getAttribute("id");
	String passwd= request.getParameter("passwd");

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/newr";
		String dbId="bban";
		String dbPass="1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
		String sql= "select customer_id, customer_passwd from customer where customer_id= ?";
		pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
		rs=pstmt.executeQuery();
    
	if(rs.next()){
		String rId=rs.getString("customer_id");
		String rPasswd=rs.getString("customer_passwd");
		
		if(id.equals(rId) && passwd.equals(rPasswd)){
			sql= "update customer set leave_ck = 1 where customer_id= ? ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setString(1,id);
		    pstmt.executeUpdate(); 

%>
			<script>
			location.href = 'index.jsp'
			alert("탈퇴되었습니다.");
			
			</script>
			
<%
		}else
%>
			<script> 
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
	
<%	}else
		out.println("아이디가 틀렸습니다.");
	}catch(Exception e){ 
		e.printStackTrace();
	}finally{
	if(rs != null) 
		try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
	}
	%>