<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "newr.customer.CustomerMessageDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="message" scope="page" class="newr.customer.CustomerMessageDataBean">
    <jsp:setProperty name="message" property="*"/>
</jsp:useBean>

<%
    message.setMsg_time(new Timestamp(System.currentTimeMillis()) );

    CustomerMessageDBBean dbPro = CustomerMessageDBBean.getInstance();
    dbPro.insertMessage(message); 

%>
	<script>
		location.href = 'msg_receive.jsp'
		alert("전송되었습니다.");
	</script>

