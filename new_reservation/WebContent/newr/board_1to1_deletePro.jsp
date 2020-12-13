<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newr.admin.AnswerQuestionDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
int q_num = Integer.parseInt(request.getParameter("q_num")); 
  String question_passwd = request.getParameter("question_passwd");

  AnswerQuestionDBBean dbPro = AnswerQuestionDBBean.getInstance(); 
  int check = dbPro.deleteArticle(q_num, question_passwd);

  if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=board_1to1.jsp?">
<%}else{%>
    <script>      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
   </script>
<%} %>