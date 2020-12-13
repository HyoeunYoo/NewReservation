<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.business.BusinessModifyDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="business" class="newr.business.BusinessModifyDataBean">
	<jsp:setProperty name="business" property="*"/>
</jsp:useBean>


<%
	String id = (String)session.getAttribute("id");

	BusinessModifyDBBean businessModify = BusinessModifyDBBean.getInstance();
	businessModify.modifyBusiness1(business, id); 

%>

<!-- 사업자 -->
<%-- <jsp:getProperty name="business" property="business_id" /> <br> --%>
<%-- <jsp:getProperty name="business" property="business_passwd1" /><br> --%>
<%-- <jsp:getProperty name="business" property="business_name" /><br> --%>
<%-- <jsp:getProperty name="business" property="business_phone" /><br> --%>
<%-- <jsp:getProperty name="business" property="business_email" /><br> --%>



<script>
//테이블 수정 후 business_mypage1 로 넘어감
setTimeout(function(){
		alert("수정 되었습니다.");
		//location.href = 'business_mypage1.jsp'
 	}, 10);
</script>