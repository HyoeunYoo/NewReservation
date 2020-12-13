<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.admin.AnswerQuestionDBBean" %>
<%@ page import="newr.admin.QuestionDataBean" %>
<%@ page import="newr.login.LoginDBBean"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
int idx = Integer.parseInt(request.getParameter("idx"));
List<QuestionDataBean> articleList = null; 
AnswerQuestionDBBean dbPro = AnswerQuestionDBBean.getInstance();
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.main {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}

table > tbody {
	cursor: pointer;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	
	if(id==null || id.equals(""))%>
		<jsp:include page="optionbar.inc.jsp" flush="false"/>
	<%
	else{
		LoginDBBean login = LoginDBBean.getInstance();
		boolean check= login.loginCheck(id);
		if(check==true) {%>
			<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>
		<%}
		else { %>
			<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>
		<% }
		}%>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="board_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>비밀번호를 입력해주세요.</h3>
			</div>
			
			<form class="form-inline" method="post" name="checkForm" action="board_1to1_checkPro.jsp">
				<div class="form-group">
				    <label for="inputPassword" class="sr-only">Password</label>
				    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="question_passwd" required>
		        	<input type="hidden" name="idx" value="<%=idx%>">
			  	</div>
		        <button class="btn btn-default" type="submit">확인</button>
		    </form>

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

</body>
</html>
<% 
	
    }catch(Exception e){
		e.printStackTrace();
	}
%>