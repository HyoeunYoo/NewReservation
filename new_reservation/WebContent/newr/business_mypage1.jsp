<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="newr.login.LoginDBBean"%>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
		response.sendRedirect("index.jsp");
	else{
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

#inform {
	display: block;
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 10px;
	text-align: left;
}
#inform_label {
	width: 15%;
	text-align: left;
	vertical-align: top;
}
#inform_300 {
	width: 300px;
}
#inform_200 {
	width: 200px;
}
#inform_120 {
	width: 120px;
}
#inform_80 {
	width: 80px;
}
#inform_80p {
	width: 80%
}
.adddetailinfo{
	width: 550px;
	display: block;
	margin: 10px 150px 0px 110px;
}
.sm_button {
	width: 500px;
}
</style>
</head>
<body>

<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="business_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>기본정보수정</h3>
			</div>


			<form onsubmit="return validateForm(this)" action="modifyBusiness.jsp" name="myform" method="post" class="form-horizontal">

<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;

				ResultSet rs = null;

				pstmt = conn.prepareStatement(
				"select * from BUSINESS where business_id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(rs.next()){
				
				String business_id = rs.getString(1);
				String business_num = rs.getString(3);
				String business_name = rs.getString(4);
				String business_phone = rs.getString(5);
				String business_mail = rs.getString(6);
%>
				


				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">이름</label>
					<input id="inform_300" type="text" class="form-control" name="business_name" readonly="readonly" value="<%=business_name%>">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">사업자번호</label>
					<input id="inform_300" type="text" class="form-control" name="business_num" readonly="readonly" value="<%=business_num%>">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">아이디</label>
					<input id="inform_300" type="text" class="form-control" name="business_id" readonly="readonly" value="<%=business_id%>">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">비밀번호</label>
					<input id="inform_300" type="password" class="form-control" name="business_passwd1" placeholder="6~15자" maxlength="15">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">비밀번호 확인</label>
					<input id="inform_300" type="password" class="form-control" name="business_passwd2" placeholder="비밀번호를 한번 더 입력하세요" maxlength="15">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">휴대전화</label>
					<input id="inform_120" type="text" class="form-control" name="business_phone" id="phone" value="<%=business_phone%>">

				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">이메일</label>
					<input type="text" class="form-control" name="business_email" value="<%=business_mail%>">
				</div>

<%				}

		        rs.close();
		        stmt.close();
		        conn.close();

		        } catch(SQLException e) {
					out.print(e.toString());
		        }

%>
				<br><br>
				<div class="container sm_button">
					<input type="submit" class="btn btn-default pull-right sm_button" value="수정">
				</div>
			</form>



		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
function validateForm(arg) {

var business_passwd1 = $('form').find('input[name="business_passwd1"]').val();
if(business_passwd1.length < 6) {
	alert('비밀번호는 6글자 이상입니다.');
	$('form[name="myform"]').find('input[name="business_passwd1"]').focus();
	return false;
}

var business_passwd2 = $('form').find('input[name="business_passwd2"]').val();
if(business_passwd2 != business_passwd1) {
	alert('비밀번호가 다릅니다.');
	$('form[name="myform"]').find('input[name="business_passwd2"]').focus();
	return false;
}

}
</script>
</body>
</html>


<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>