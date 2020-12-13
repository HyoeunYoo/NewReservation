<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.customer.CustomerJoinDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%



	String id = request.getParameter("customer_id");

	CustomerJoinDBBean join = CustomerJoinDBBean.getInstance();
	boolean check= join.idCheck(id);


	out.println(id);
		
		if (check) {
		
			out.println("<p>이미 가입된 아이디입니다.</p>");
		}
		else {
			out.println("<p>사용가능한 아이디입니다.</p>");
		}
%>


	
	
	
	
	