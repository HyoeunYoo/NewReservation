<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<%request.setCharacterEncoding("utf-8");%>

<%
	// 취소하려는 스케줄 넘, 세션 아이디, 입력한 비밀번호를 얻어옴
	int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
	String id= (String)session.getAttribute("id");
	String passwd= request.getParameter("passwd");

	Connection conn=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	ResultSet rs=null;

	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/newr";
		String dbId="bban";
		String dbPass="1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
		String sql= "select business_id, business_passwd from business where business_id= ?";
		pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
		rs=pstmt.executeQuery();
    
	if(rs.next()){
		String cid=rs.getString("business_id");
		String cpasswd=rs.getString("business_passwd");
		
		if(id.equals(cid) && passwd.equals(cpasswd)){
		    sql = "DELETE FROM reserve_select WHERE schedule_num= ? ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setInt(1,schedule_num);
		    pstmt.executeUpdate();
		    
		    String sql2 = "DELETE FROM schedule WHERE schedule_num= ?";
		    pstmt2=conn.prepareStatement(sql2);
		    pstmt2.setInt(1, schedule_num);
		    pstmt2.executeUpdate();

%>
			<script>
			location.href = 'business_history_.jsp'
			alert("취소되었습니다.");
			
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