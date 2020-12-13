<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="newr.login.LoginDBBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>

<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.main {
	display: block;
	width: 940px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}
.msg_btn {
/* 	outline: 1px solid pink; */
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 350px;
	width: 100px;
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
		<div class="col-sm-3">
			<jsp:include page="board_navi.inc.jsp" flush="false"/>
		</div>
	 
	    <div class="col-sm-9">
			<div class="page-header">
				<h3>문의 작성</h3>
			</div>
	
			<% 
			int q_num = 0;
			String answer="";
			%>

			<form class="form-horizontal" method="post" name="f" action="board_content_write_pro.jsp">
				<input type="hidden" name="q_num" value="<%=q_num%>">
				<input type="hidden" name="question_date">

				<div class="form-group">
					<label class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="question_writer">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="q_title">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="10" name="question_content"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input class="form-control" type="password" name="question_passwd">
					</div>
				</div>

				<div class="form-group text-center">
					<input type="button" class="btn btn-default" value="목록보기" OnClick="history.go(-1)">
					<input type="submit" id="write" onclick="check()" class="btn" style="background-color: black; color: white;" value="글쓰기">
				</div>
			</form>	
		</div>   
	</div>
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script>
var check=function(){
	if(!f.question_passwd.value){
		   alert('비밀번호를 입력하세요');
		   f.question_passwd.focus();
		   return;
		  }
}
</script>
</body>
</html>
<% 
	
    }catch(Exception e){
		e.printStackTrace();
	}
%>