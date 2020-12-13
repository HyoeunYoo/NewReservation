<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.sql.Timestamp" %>

<%  request.setCharacterEncoding("utf-8"); %>

<%
	// 세션 아이디와 입력한 비밀번호를 얻어옴
	String id= (String)session.getAttribute("id");
	String passwd= request.getParameter("passwd");

	Connection conn=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;

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
		
		int number = 0;
		int count = 0;
		Timestamp current_time = new Timestamp(System.currentTimeMillis());
    
	if(rs.next()){
		String rId=rs.getString("business_id");
		String rPasswd=rs.getString("business_passwd");
		
		
		if(id.equals(rId) && passwd.equals(rPasswd)){// 비밀번호가 맞으면
			String sql2 = "select count(*) from contract where business_id = ?";
			pstmt2=conn.prepareStatement(sql2);
		    pstmt2.setString(1,id);
			rs2=pstmt2.executeQuery();
			
			if(rs2.next()) count = rs2.getInt(1);
			
			
			if(count>0){
				
				
				sql= "update business set contract_ck = 0 where business_id= ? ";
			    pstmt=conn.prepareStatement(sql);
			    pstmt.setString(1,id);
			    pstmt.executeUpdate();


			    sql= "select max(contract_num) from contract";
			    pstmt=conn.prepareStatement(sql);
			    rs=pstmt.executeQuery();
				
				if (rs.next())
					number = rs.getInt(1)+1;
			    else
					number = 1; 

				sql= "update contract set contract_start = ? where business_id = ?";
			    pstmt=conn.prepareStatement(sql);
			    pstmt.setTimestamp(1,current_time);
			    pstmt.setString(2,id);
			    pstmt.executeUpdate();

				}
				
				
				
				
				
				
			
			
			
			
			else{
			
		    sql= "update business set contract_ck = 0 where business_id= ? ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setString(1,id);
		    pstmt.executeUpdate();


		    sql= "select max(contract_num) from contract";
		    pstmt=conn.prepareStatement(sql);
		    rs=pstmt.executeQuery();
			
			if (rs.next())
				number = rs.getInt(1)+1;
		    else
				number = 1; 

			sql= "insert into contract values (?,?,?) ";
		    pstmt=conn.prepareStatement(sql);
		    pstmt.setInt(1,number);
		    pstmt.setString(2,id);
		    pstmt.setTimestamp(3,current_time);
		    pstmt.executeUpdate();

			}

%>
			<script>
			location.href = 'business_contract.jsp'
			alert("계약 완료되었습니다.");
			
			</script>
			
<%
		}else // 비밀번호가 틀리면
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