<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String id ="";
	try{
		id = (String)session.getAttribute("id");
%>

<style>
.option {
	position: fixed;
	width: 100%;
	top: -10px;
	z-index: 9999;
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

.dropdown li > a:focus,
.dropdown li > a:hover,
.dropdown:hover > a {
  	background-color: #ff2424 !important;
  	color: #fff !important;
}
</style>

<nav class="navbar navbar-nav navbar-static-top option">
	<div class="op">
		<ul class="nav navbar-nav pull-right">
			<li><a href="" id="a"><%=id %>님 안녕하세요</a></li>
			<li><a href="adminLogout.jsp" id="a">로그아웃</a></li>
		</ul>
	</div>
</nav>

<% 
}catch(Exception e){
	e.printStackTrace();
}
%>