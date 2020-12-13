<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="newr.login.LoginDBBean"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
/*약관*/
.agreeArea{
	/*padding: 0;*/
	/*color: #555;*/
	font-size: 11px;
	line-height: 20px;
}
.agreeArea .agree{
	overflow: auto;
	height: 180px;
	padding: 10px 3px 10px 10px;
	border: 1px solid #B2B2B2;
	background: #fff;

	/*추가*/
	width: 550px;
	margin-left: auto;
	margin-right: auto;
}
.agreeArea .agree p{
	text-align: left;
	/*padding: 0;*/
}
.check {
	padding: 15px 0 0 0;
	color: #333;
	font-size: 12px;
	text-align: right;
	width: 550px;
	margin-left: auto;
	margin-right: auto;
}
.agreeArea {
	margin-top: 50px;
}
#custom_leave_form {
	width: 80%;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#inform_200 {
	width: 200px;
}

.b_pwd_input, .b_pwd_btn {
	margin-top: 20px;
	float: left;
}
.custom_leave_align {
	width: 315px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

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
				<h3>계약</h3>
			</div>


			<form onsubmit="return validateForm(this)" action="business_contractPro.jsp" name="myform" method="post" class="form-horizontal">
<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;

				ResultSet rs = null;
				ResultSet rs2 = null;

				pstmt = conn.prepareStatement(
				"select * from contract where business_id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
				Date contract_start = rs.getDate(3);
				
				// 90일 더하기
				Calendar cal = Calendar.getInstance();
				cal.setTime(contract_start);
			    cal.add(Calendar.DATE, 90);
			    
			    // 90일 더해서 계약 끝나는 날 받아오기
			    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    String contract_end = df.format(cal.getTime());
	
				// 오늘 날짜와 비교하기
				Date today = new Date();
				String compare_today = df.format(today);
				
				// 오늘 날짜와 비교해서 contract_end가 옛날이면 양수 미래면 음수 같은날이면 0
				int comparedate = compare_today.compareTo(contract_end);
				
				
					if(comparedate>0){// 양수가 나오면 contract_ck를 1로 바꾸고 계약하기 폼이 나오게 해야 함
					

					pstmt2 = conn.prepareStatement(
					"update business set contract_ck = 1 where business_id = ?");
					pstmt2.setString(1, id);
					pstmt2.executeUpdate();
%>					
					<h4>계약 만료일 : <%=contract_end%></h4>
					<div class="agreeArea">
						<div class="agree">
							<h6 align="left">
								<strong>NEWR 계약하시면 현 시점으로부터 90일간 사용 가능합니다.</strong><br><br>
								계약기간 만료 시 매장 검색을 할 수 없어 고객의 예약을 받을 수 없으나,<br><br>
								예약받기 외 다른 서비스들은 정상적으로 이용이 가능합니다.<br><br>
								<strong>계약요청 전에 아래 사항을 반드시 확인해 주시기 바랍니다.</strong><br><br>
								계약요청을 하시게 되면 NEWR에서 제공하는 모든 서비스를 사용가능합니다.<br><br>
								오늘 날짜로부터 90일간 사용 가능하며, 계약 요청시간에 따른 불이익은 책임지지 않습니다.
							</h6>
						</div>
						
						<p class="check">위 사항에 동의하십니까? <input type="checkbox" id="leave_agree"><label>동의함</label></p>
					</div>
					
					<div class="container" id="custom_leave_form">
						<div class="container custom_leave_align">
							<input type="password" placeholder="비밀번호를 입력해주세요." class="form-control b_pwd_input" id="inform_200" name="passwd">
							<input type="submit" class="btn btn-default b_pwd_btn" value="계약하기">
						</div>
					</div>
<%				
					} else {
%>
					<div class="container">
						<h4>계약 만료일 : <%=contract_end%></h4>
					</div>
<% 					}
				} else {
%>				
				<div class="agreeArea">
					<div class="agree">
						<h6 align="left">
							<strong>NEWR 계약하시면 현 시점으로부터 90일간 사용 가능합니다.</strong><br><br>
							계약기간 만료 시 매장 검색을 할 수 없어 고객의 예약을 받을 수 없으나,<br><br>
							예약받기 외 다른 서비스들은 정상적으로 이용이 가능합니다.<br><br>
							<strong>계약요청 전에 아래 사항을 반드시 확인해 주시기 바랍니다.</strong><br><br>
							계약요청을 하시게 되면 NEWR에서 제공하는 모든 서비스를 사용가능합니다.<br><br>
							오늘 날짜로부터 90일간 사용 가능하며, 계약 요청시간에 따른 불이익은 책임지지 않습니다.
						</h6>
					</div>
					
					<p class="check">위 사항에 동의하십니까? <input type="checkbox" id="leave_agree"><label>동의함</label></p>
				</div>
				
				<div class="container" id="custom_leave_form">
					<div class="container custom_leave_align">
						<input type="password" placeholder="비밀번호를 입력해주세요." class="form-control b_pwd_input" id="inform_200" name="passwd">
						<input type="submit" class="btn btn-default b_pwd_btn" value="계약하기">
					</div>
				</div>
					
					
<%					
				}
		        rs.close();
		        stmt.close();
		        conn.close();

		        } catch(SQLException e) {
					out.print(e.toString());
		        }

%>




			</form>
		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script>
$('.b_pwd_btn').click(function(){
	if($('input:checkbox[id="leave_agree"]').is(":checked") == false) {
		alert('이용약관에 동의해주세요.');
		return false;
	}
});
</script>
</body>
</html>


<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>