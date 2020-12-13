<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="newr.login.LoginDBBean"%>
<%@ page import="com.oreilly.servlet.*" %>


<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="search" class="newr.search.SearchDataBean2">
	<jsp:setProperty name="search" property="*"/>
</jsp:useBean>
<!-- <br>
<br><br><br>
<jsp:getProperty name="search" property="shop_kind" />샵종류<br><br>
<jsp:getProperty name="search" property="shop_name" />샵이름<br><br>
<jsp:getProperty name="search" property="shop_addr1" />주소1<br><br>
<jsp:getProperty name="search" property="shop_hasy_content" />태그<br><br>
 -->

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
/*결과썸네일*/
.search_thumb {
	margin-bottom: 30px;
}
.thumbnail {
	border: none;
}
.info {
	font-size: 16px;
	text-align: left;
	margin-top: 10px;
}
.detail {
	font-size: 12px;
	margin-top: 10px;
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

	<jsp:include page="search.inc.jsp" flush="false"/>
	
<div class="page-header">
	<h2>검색결과</h2>
</div>

	<div class="row new_thumb">

<%  

	String get_shop_name = request.getParameter("shop_name");
	String get_shop_kind = request.getParameter("shop_kind");
	String get_shop_addr = request.getParameter("shop_addr1");
	String get_shop_hasy_content = request.getParameter("shop_hasy_content");


	String dbUrl = "jdbc:mysql://localhost:3306/newr";
	Class.forName("com.mysql.jdbc.Driver");
	try {   
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String shop_num = null;


	pstmt = conn.prepareStatement(
	"select * from searchimgview where shop_kind = 2 and contract_ck = 0");
	rs = pstmt.executeQuery();

	
	while(rs.next()){
		String s_shop_num = rs.getString(1);
		String s_shop_name = rs.getString(3);
		String s_shop_addr = rs.getString(4);
		String s_shop_phone = rs.getString(5);
		String s_shop_img_path = rs.getString(9);

%>

		<div class="col-xs-6 col-md-3">
			<div class="thumbnail">
				<a href="reserve.jsp?shop_num=<%=s_shop_num%>"><img src="img/<%=s_shop_img_path%>" width="300px" height="200px" style="height: 100%;"></a>
				<div class="info"><%=s_shop_name%>
					<div class="detail">
						<%=s_shop_addr%>
						<br><%=s_shop_phone%>
					</div>
				</div>
			</div>
		</div>
<%	

		}

	} catch(SQLException e) {
		out.print(e.toString());
	}

%>

</div>


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