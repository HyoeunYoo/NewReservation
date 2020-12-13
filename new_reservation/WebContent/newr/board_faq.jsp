<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
.main {
  width: 940px;
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 0;
}

button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 15px;
    width: 100%;
    border: none;
    border-radius: 5px;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
button.accordion.active, button.accordion:hover {
	background-color: #ddd;
}
button.accordion:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}
button.accordion.active:after {
    content: "\2212";
}
div.panel {
    padding: 0 18px;
    background-color: #f9f9f9;
	border-radius: 5px;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
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
	
	if(id==null || id.equals("")){
	%>	
		<jsp:include page="optionbar.inc.jsp" flush="false"/>
	<%}
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

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="board_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>FAQ</h3>
			</div>
			
			<!-- 게시글 -->
			<!-- 제목 -->
	<%
	request.setCharacterEncoding("utf-8");
	
	String dbUrl = "jdbc:mysql://localhost:3306/newr";
	Class.forName("com.mysql.jdbc.Driver");
	try {
		Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
		Statement stmt = conn.createStatement();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		pstmt = conn.prepareStatement("SELECT * FROM faq");
		rs = pstmt.executeQuery();
	
		while(rs.next()){
			int num = rs.getInt(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
	%>
			<button class="accordion"><%=title%></button>
			<!-- 내용 -->
			<div class="panel">
				<h5><%=content%></h5>
			</div>
	<%
		}//while문 끝
		rs.close();
		stmt.close();
		conn.close();
	%>
		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
	acc[i].onclick = function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		
		console.log(panel.style.maxHeight);
		console.log(panel.scrollHeight);
		
		if (panel.style.maxHeight){
			panel.style.maxHeight = null;
		} else {
			panel.style.maxHeight = panel.scrollHeight + "px";
		} 
	}
}
</script>
</body>
</html>

<% 
	}catch(SQLException e) {
	out.print(e.toString());
	}

}catch(Exception e){
	e.printStackTrace();
}
%>