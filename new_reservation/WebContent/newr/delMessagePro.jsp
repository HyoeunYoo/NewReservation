<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "newr.customer.CustomerMessageDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>
<%

String del_num= request.getParameter("nums");
String[] num = del_num.split(",");
%>

<%


	for (int i=0; i<num.length; i++) {
		String d_num = num[i];

		CustomerMessageDBBean dbPro = CustomerMessageDBBean.getInstance();
		dbPro.delMessage(d_num);
	}

 
    

%>
