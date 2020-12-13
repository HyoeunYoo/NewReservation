<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newr.admin.AnswerQuestionDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%

  String question_passwd = request.getParameter("question_passwd");

  AnswerQuestionDBBean dbPro = AnswerQuestionDBBean.getInstance(); 

int idx = Integer.parseInt(request.getParameter("idx"));
  
  int check = dbPro.checkArticle(idx, question_passwd);
  String url = "board_content.jsp?idx="+idx;
  if(check==1){
	  response.sendRedirect(url);
%>
	
<%}else{%>
    <script type="text/javascript">      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
   </script>
<%} %>