<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newr.admin.AnswerQuestionDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="question" scope="page" class="newr.admin.QuestionDataBean">
    <jsp:setProperty name="question" property="*"/>
</jsp:useBean>

<%
	AnswerQuestionDBBean dbPro = AnswerQuestionDBBean.getInstance();
    dbPro.answering(question); 
    
    response.sendRedirect("admin_1to1_content.jsp?idx="+question.getQ_num());
%>

<jsp:getProperty name="question" property="answer" /><br>
<jsp:getProperty name="question" property="q_num" /><br>
