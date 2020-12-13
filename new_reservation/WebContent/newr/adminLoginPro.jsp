<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.login.LoginDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="loginBean" class="newr.login.LoginDataBean">

	<jsp:setProperty name="loginBean" property="*"/>

</jsp:useBean>

<%
	String url = request.getParameter("url");
	String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	LoginDBBean login = LoginDBBean.getInstance();
	

		int check= login.adminCheck(id,passwd);
		
		if(check==1) {
			session.setAttribute("id",id);
			response.sendRedirect("admin_login.jsp");
		}
		else if(check==0){ %>
			<script> 
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
			</script>
		<%}
		else { %>
			<script>
			alert("아이디가 맞지 않습니다.");
			history.go(-1);
			</script>
		<% }
	
	%>
	
	