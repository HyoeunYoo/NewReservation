<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newr.admin.AnswerQuestionDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="newr.admin.QuestionDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setQuestion_date(new Timestamp(System.currentTimeMillis()) );

	AnswerQuestionDBBean dbPro = AnswerQuestionDBBean.getInstance();
    dbPro.insertArticle(article); 

    response.sendRedirect("board_1to1.jsp");
%>
