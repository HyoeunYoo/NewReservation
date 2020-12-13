<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.business.BusinessStaffDBBean" %>
<%@ page import="newr.business.BusinessStaffDataBean" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="staff" class="newr.business.BusinessStaffDataBean">
	<jsp:setProperty name="staff" property="*"/>
</jsp:useBean>

<%
String id ="";
id = (String)session.getAttribute("id");

BusinessStaffDBBean businessStaff = BusinessStaffDBBean.getInstance();
businessStaff.insertStaff(staff, id); 

%>
<!-- 
직원 1 <br>

<jsp:getProperty name="staff" property="staff_names1" /><br><br>
<jsp:getProperty name="staff" property="sg_detail1" /><br>
<jsp:getProperty name="staff" property="sg_time1" /><br>
<jsp:getProperty name="staff" property="sg_price1" /><br><br>

<jsp:getProperty name="staff" property="sg_detail11" /><br>
<jsp:getProperty name="staff" property="sg_time11" /><br>
<jsp:getProperty name="staff" property="sg_price11" /><br><br>

<jsp:getProperty name="staff" property="sg_detail12" /><br>
<jsp:getProperty name="staff" property="sg_time12" /><br>
<jsp:getProperty name="staff" property="sg_price12" /><br><br>

<jsp:getProperty name="staff" property="sg_detail13" /><br>
<jsp:getProperty name="staff" property="sg_time13" /><br>
<jsp:getProperty name="staff" property="sg_price13" /><br><br>

<jsp:getProperty name="staff" property="sg_detail14" /><br>
<jsp:getProperty name="staff" property="sg_time14" /><br>
<jsp:getProperty name="staff" property="sg_price14" /><br><br>


직원 2<br>
<jsp:getProperty name="staff" property="staff_names2" /><br>
<jsp:getProperty name="staff" property="sg_detail2" /><br>
<jsp:getProperty name="staff" property="sg_time2" /><br>
<jsp:getProperty name="staff" property="sg_price2" /><br><br>

<jsp:getProperty name="staff" property="sg_detail21" /><br>
<jsp:getProperty name="staff" property="sg_time21" /><br>
<jsp:getProperty name="staff" property="sg_price21" /><br><br>

<jsp:getProperty name="staff" property="sg_detail22" /><br>
<jsp:getProperty name="staff" property="sg_time22" /><br>
<jsp:getProperty name="staff" property="sg_price22" /><br><br>

<jsp:getProperty name="staff" property="sg_detail23" /><br>
<jsp:getProperty name="staff" property="sg_time23" /><br>
<jsp:getProperty name="staff" property="sg_price23" /><br><br>

<jsp:getProperty name="staff" property="sg_detail24" /><br>
<jsp:getProperty name="staff" property="sg_time24" /><br>
<jsp:getProperty name="staff" property="sg_price24" /><br><br>

직원 3<br>
<jsp:getProperty name="staff" property="staff_names3" /><br>
<jsp:getProperty name="staff" property="sg_detail3" /><br>
<jsp:getProperty name="staff" property="sg_time3" /><br>
<jsp:getProperty name="staff" property="sg_price3" /><br><br>

<jsp:getProperty name="staff" property="sg_detail31" /><br>
<jsp:getProperty name="staff" property="sg_time31" /><br>
<jsp:getProperty name="staff" property="sg_price31" /><br><br>

<jsp:getProperty name="staff" property="sg_detail32" /><br>
<jsp:getProperty name="staff" property="sg_time32" /><br>
<jsp:getProperty name="staff" property="sg_price32" /><br><br>

<jsp:getProperty name="staff" property="sg_detail33" /><br>
<jsp:getProperty name="staff" property="sg_time33" /><br>
<jsp:getProperty name="staff" property="sg_price33" /><br><br>

<jsp:getProperty name="staff" property="sg_detail34" /><br>
<jsp:getProperty name="staff" property="sg_time34" /><br>
<jsp:getProperty name="staff" property="sg_price34" /><br><br>

직원 4 <br>
<jsp:getProperty name="staff" property="staff_names4" /><br>
<jsp:getProperty name="staff" property="sg_detail4" /><br>
<jsp:getProperty name="staff" property="sg_time4" /><br>
<jsp:getProperty name="staff" property="sg_price4" /><br><br>

<jsp:getProperty name="staff" property="sg_detail41" /><br>
<jsp:getProperty name="staff" property="sg_time41" /><br>
<jsp:getProperty name="staff" property="sg_price41" /><br><br>

<jsp:getProperty name="staff" property="sg_detail42" /><br>
<jsp:getProperty name="staff" property="sg_time42" /><br>
<jsp:getProperty name="staff" property="sg_price42" /><br><br>

<jsp:getProperty name="staff" property="sg_detail43" /><br>
<jsp:getProperty name="staff" property="sg_time43" /><br>
<jsp:getProperty name="staff" property="sg_price43" /><br><br>

<jsp:getProperty name="staff" property="sg_detail44" /><br>
<jsp:getProperty name="staff" property="sg_time44" /><br>
<jsp:getProperty name="staff" property="sg_price44" /><br><br>

직원 5 <br>
<jsp:getProperty name="staff" property="staff_names5" /><br>
<jsp:getProperty name="staff" property="sg_detail5" /><br>
<jsp:getProperty name="staff" property="sg_time5" /><br>
<jsp:getProperty name="staff" property="sg_price5" /><br><br>

<jsp:getProperty name="staff" property="sg_detail51" /><br>
<jsp:getProperty name="staff" property="sg_time51" /><br>
<jsp:getProperty name="staff" property="sg_price51" /><br><br>

<jsp:getProperty name="staff" property="sg_detail52" /><br>
<jsp:getProperty name="staff" property="sg_time52" /><br>
<jsp:getProperty name="staff" property="sg_price52" /><br><br>

<jsp:getProperty name="staff" property="sg_detail53" /><br>
<jsp:getProperty name="staff" property="sg_time53" /><br>
<jsp:getProperty name="staff" property="sg_price53" /><br><br>

<jsp:getProperty name="staff" property="sg_detail54" /><br>
<jsp:getProperty name="staff" property="sg_time54" /><br>
<jsp:getProperty name="staff" property="sg_price54" /><br><br>
 -->
<script>
 // 테이블 수정 후 join_ok 로 넘어감
setTimeout(function(){
		location.href = 'business_mypage3.jsp'
 	}, 10);
</script>