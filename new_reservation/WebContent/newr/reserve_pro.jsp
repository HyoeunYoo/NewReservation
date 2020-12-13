<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<% request.setCharacterEncoding("utf-8");%>

<%
int shop_num = Integer.parseInt(request.getParameter("shop_num"));
String id = request.getParameter("id");
String day = request.getParameter("day");
String start_time = request.getParameter("start_time");
String end_time = request.getParameter("end_time");
int surgery_num = Integer.parseInt(request.getParameter("surgery_num"));
int staff_num = Integer.parseInt(request.getParameter("staff_num"));

DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date date = format.parse(day);

DateFormat format2= new SimpleDateFormat("HH:mm");
Date start = format2.parse(start_time);
Date end = format2.parse(end_time);

String sql = "";
String sql2 = "";
int num = 0;
String sid = "";

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	pstmt = conn.prepareStatement("select max(schedule_num) from schedule");
	rs = pstmt.executeQuery();
	if(rs.next())
		num = rs.getInt(1)+1;
	else
		num = 1;
	
	//고객인지 확인
	pstmt = conn.prepareStatement("select customer_id from customer where customer_id = ?");
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		sid = rs.getString(1);
		//고객 예약
		sql = "insert into schedule(schedule_num, shop_num, customer_id, day, start_time, end_time) values(?,?,?,?,?,?)";
	 	pstmt = conn.prepareStatement(sql);
	 	pstmt.setInt(1, num);
	 	pstmt.setInt(2, shop_num);
	 	pstmt.setString(3, sid);
	 	pstmt.setDate(4, new java.sql.Date(date.getTime()));
	 	pstmt.setTime(5, new java.sql.Time(start.getTime()));
	 	pstmt.setTime(6, new java.sql.Time(end.getTime()));
	 	pstmt.executeUpdate();
	 	
	 	sql = "insert into reserve_select(schedule_num, surgery_num, staff_num) values(?,?,?)";
	 	pstmt = conn.prepareStatement(sql);
	 	pstmt.setInt(1, num);
	 	pstmt.setInt(2, surgery_num);
	 	pstmt.setInt(3, staff_num);
	 	pstmt.executeUpdate();
	 	
	 	response.sendRedirect("reserve_success.jsp");
	}
	else{
		//사업자인지 확인
		pstmt2 = conn.prepareStatement("select business_id from business where business_id = ?");
		pstmt2.setString(1, id);
		rs2 = pstmt2.executeQuery();
		if(rs2.next()){
			sid = rs2.getString(1);
			//사업자 예약
			sql2 = "insert into schedule(schedule_num, shop_num, business_id, day, start_time, end_time) values(?,?,?,?,?,?)";
		 	pstmt2 = conn.prepareStatement(sql2);
		 	pstmt2.setInt(1, num);
		 	pstmt2.setInt(2, shop_num);
		 	pstmt2.setString(3, sid);
		 	pstmt2.setDate(4, new java.sql.Date(date.getTime()));
		 	pstmt2.setTime(5, new java.sql.Time(start.getTime()));
		 	pstmt2.setTime(6, new java.sql.Time(end.getTime()));
		 	pstmt2.executeUpdate();
		 	
		 	sql2 = "insert into reserve_select(schedule_num, surgery_num, staff_num) values(?,?,?)";
		 	pstmt2 = conn.prepareStatement(sql2);
		 	pstmt2.setInt(1, num);
		 	pstmt2.setInt(2, surgery_num);
		 	pstmt2.setInt(3, staff_num);
		 	pstmt2.executeUpdate();
		 	
		 	response.sendRedirect("reserve_success.jsp");
		}
	}

} catch(Exception ex) {
	ex.printStackTrace();
}
%>
