<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "newr.business.BusinessStaffDelDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>
<%

String del_num= request.getParameter("nums");
String[] num = del_num.split(",");
%>

<%


	for (int i=0; i<num.length; i++) {
		String d_num = num[i];

		BusinessStaffDelDBBean dbPro = BusinessStaffDelDBBean.getInstance();
		dbPro.delStaff(d_num);
	}

 
    

%>
