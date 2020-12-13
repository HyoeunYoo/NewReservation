<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<%request.setCharacterEncoding("utf-8");%>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	ResultSet rs=null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/newr";
		String dbId="bban";
		String dbPass="1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
		String sql= "select shop_num from shop where business_id= ?";
		pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			int num = rs.getInt("shop_num");
		
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
			<li><a href="" id="a"><%=id %>님 안녕하세요</a></li>
			<li><a href="reserve.jsp?shop_num=<%=num%>" id="a">내 샵 보기</a></li>
			<li><a href="msg_receive.jsp" id="a">쪽지</a></li>
			<li><a href="business_history_.jsp" id="a">예약내역</a></li>
			<li><a href="business_mypage1.jsp" id="a">마이페이지</a></li>
			<li><a href="sessionLogout.jsp" id="a">로그아웃</a></li>
		</ul>
	</div>
</nav>

<% 
		}
	}catch(Exception e){ 
		e.printStackTrace();
	}finally{
	if(rs != null) 
		try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>