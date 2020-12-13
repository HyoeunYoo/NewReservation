<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "newr.customer.CustomerMessageDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="message" scope="page" class="newr.customer.CustomerMessageDataBean">
    <jsp:setProperty name="message" property="*"/>
</jsp:useBean>

<%
	String url = request.getParameter("url");

    message.setMsg_time(new Timestamp(System.currentTimeMillis()) );

    CustomerMessageDBBean dbPro = CustomerMessageDBBean.getInstance();
    dbPro.insertMessage(message); 
    
    //response.sendRedirect("sent_message.jsp");
    //response.sendRedirect(url);
%>
<script>
	alert("전송 되었습니다.");
	history.go(-1);
</script>

