<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.customer.CustomerModifyDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="customer" class="newr.customer.CustomerModifyDataBean">
	<jsp:setProperty name="customer" property="*"/>
</jsp:useBean>


<%
	String id = (String)session.getAttribute("id");

	CustomerModifyDBBean customerModify = CustomerModifyDBBean.getInstance();
	customerModify.modifyCustomer(customer, id);
%>

<script>
//테이블 수정 후 customer_mypage 로 넘어감
alert('수정 되었습니다.');
location.href = 'customer_mypage.jsp'
</script>