<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.option {
	position: fixed;
	width: 100%;
	top: -10px;
	z-index: 9999;
	margin-bottom: 200px;
}
.navbar {
	background-color: #fff;
	border: none;
	font-size: 12px;
}
.navbar .nav > li {
	float: left;
}
.navbar .nav > li > a {
	/*display: block;*/
	color: #414141;
	padding: 10px 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
.navbar .nav > li > a:focus,
.navbar .nav > li > a:hover {
	background-color: #ff2424 !important;
	color: #fff !important;
}
.op {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#a {
	padding-top: 20px;
}

/*모달창 가운데 띄우기*/
.modal {
  text-align: center;
}
.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
}
.modal-dialog {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
  width: 400px;
}
/*로그인 모달*/
.logintable {
	margin-bottom: -10px;
	width: 300px;
	padding: 0;
}
#login{
	width: 350px;
}
.checkbox {
	text-align: left;
	margin-bottom: 10px;
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
.click {
	margin-left: 10px;
	color: gray;
}
.click:hover {
	color: black;
	text-decoration: none;
}
/*focus됐을 때 테두리 검은색으로*/
.inputword:focus {
  border-color: inherit;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.dropdown li > a:focus,
.dropdown li > a:hover,
.dropdown:hover > a {
  	background-color: #ff2424 !important;
  	color: #fff !important;
}
</style>

<nav class="navbar navbar-nav navbar-static-top option">
	<div class="op">
		<ul class="nav navbar-nav">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="a">고객센터<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="board_faq.jsp">FAQ</a></li>
					<li><a href="board_1to1.jsp">1:1 문의</a></li>
				</ul>
			</li>
		</ul>

		<ul class="nav navbar-nav pull-right">
			<li><a href="#" id="a" class="open" data-toggle="modal" data-target="#myModal">로그인</a></li>
			<li><a href="join.jsp" id="a">회원가입</a></li>
		</ul>
	</div>
</nav>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>	
				<form class="container" method="post" id="login" name="login" action="sessionLoginPro.jsp">
					<input type="hidden" name="url" id="url" value="">
					<div>
						<h4>NEW RESERVATION</h4>
						<label class="radio-inline">
							<input type="radio" name="member" value="고객회원" out.print(" checked=\"checked\"");> 고객회원
						</label>
						<label class="radio-inline">
							<input type="radio" name="member" value="사업자회원"> 사업자회원
						</label>
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

						<div class="checkbox">
							<label>
								<input type="checkbox" value="remember-me"> 로그인 상태 유지
							</label>
						</div>
	
						<a href="findinfo.jsp" class="click">ID/PASS찾기</a>
						<a href="join.jsp" class="click">회원가입</a>

					</div>
				</form>
			</div><!-- modal-body -->
		</div><!-- modal-content -->

	</div><!-- modal-dialog -->
</div><!-- mymodal -->

<script>
$(document).on("click", ".open", function () {
	//var link = document.location.href;
	//$("#url").val(link);
	
	var CurrentFileName = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 30);
	$("#url").val(CurrentFileName);
});
</script>