<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.logo {
	padding: 50px 0 30px;
	text-align: center;
	cursor: pointer
}
</style>

<div class="logo">
<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals("")){
%>
		<img src="logo.png" alt="NEW Reservation" onclick="location.href='index.jsp';">
	<%
	}
	else{%>
		<img src="logo.png" alt="NEW Reservation" onclick="location.href='main.login.jsp';">
	<%}
%>
</div>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>