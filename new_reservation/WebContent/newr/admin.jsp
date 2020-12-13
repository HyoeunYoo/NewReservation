<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
#login{
	margin-top: 100px;
	padding-top: 20px;
	border: 1px solid silver;
	border-radius: 10px;
	width: 350px;
	height: 200px;
}
.logintable {
	width: 300px;
	padding: 0;
}
.loginbtn {
	height: 95px;
	margin-top: -65px;
	margin-left: 10px;
	vertical-align: middle;
}
#id{
	margin-top: 15px;	
}
/*focus됐을 때 테두리 검은색으로*/
.inputword:focus {
  border-color: inherit;
  -webkit-box-shadow: none;
  box-shadow: none;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<div class="main">
	
<form class="container" method="post" id="login" name="login" action="adminLoginPro.jsp">
	<div>
		<h4>NEW RESERVATION ADMIN</h4>
		<table class="logintable">
			<tr>
				<td>
					<div class="form-group">
						<label for="userid" class="sr-only">아이디</label>
						<input type="text" name="id" id="id" class="form-control inputword" placeholder="아이디" required autofocus style="outline:none">
					</div>
				</td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<label for="passwd" class="sr-only">비밀번호</label>
						<input type="password" name="passwd" id="passwd" class="form-control inputword" placeholder="비밀번호" required>
					</div>
				</td>
				<td>
					<button class="btn btn-danger btn-block btn-lg loginbtn">LOGIN</button>
				</td>
			</tr>
		</table>
	</div>
</form>

<div class="text-center" style="margin-top: 30px;">
	<button class="btn btn-default" onclick="document.location.href='index.jsp'">사용자 화면으로 가기</button>
</div>

</div>

</body>
</html>