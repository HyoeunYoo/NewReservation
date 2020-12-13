<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
<link rel="stylesheet" href="/ebban/assets/fullcalendar-3.4.0/fullcalendar.css">

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

/*예약내역 테이블*/
#business_reserv_table {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	text-align: center;
}
.business_reserv td{
	width: 5%;
	height: 40px;
	border: 1px solid lightgray;
}
.table-first {
	height: 40px;
	font-weight : bold;
}
#time {
	width: 7%;
}
#kind {
	width: 10%;
}
#customer {
	width: 10%;
}
#phone {
	width: 10%;
}
#changecancel a {
	color: black;
	font-size: 20px;
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
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="/ebban/assets/fullcalendar-3.4.0/lib/jquery.min.js"></script>
<script src="/ebban/assets/fullcalendar-3.4.0/lib/jquery-ui.min.js"></script>
<script src="/ebban/assets/fullcalendar-3.4.0/lib/moment.min.js"></script>
<script src="/ebban/assets/fullcalendar-3.4.0/fullcalendar.js"></script>
<script src="/ebban/assets/fullcalendar-3.4.0/locale-all.js"></script>

<%
Date date = new Date();
SimpleDateFormat sdf1= new SimpleDateFormat("yyyy-MM-dd");
String seldate = sdf1.format(date);
//seldate = request.getParameter("seldate");
%>

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
				<h3>예약내역</h3>
			</div>
			<jsp:include page="business_history.inc.jsp" flush="false"/>
			
			<%
			request.setCharacterEncoding("utf-8");
			
			String dbUrl = "jdbc:mysql://localhost:3306/newr";
			Class.forName("com.mysql.jdbc.Driver");
				try {
					Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
					PreparedStatement pstmt = null;
					PreparedStatement pstmt1 = null;
					PreparedStatement pstmt2 = null;
					PreparedStatement pstmt3 = null;
					PreparedStatement pstmt4 = null;
					ResultSet rs = null;
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					ResultSet rs3 = null;
					ResultSet rs4 = null;
					
					int shop_num = 0;
					pstmt = conn.prepareStatement("select shop_num from shop where business_id = ?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if(rs.next()) shop_num = rs.getInt(1);
			%>
			
			<form>
				<div id="changecancel">
					<input type="text" id="seldate" name="seldate" value="<%=seldate%>"><a href="reserve.jsp?shop_num=<%=shop_num%>" title="예약추가" style="margin-top : 10px; margin-left : 10px;"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
				</div>
			</form>
			
			<!-- 선택한 날짜에 따른 예약내역 -->

			<%		
				int total1 = 0;
				pstmt1 = conn.prepareStatement("select count(*) from reserveview where shop_num = ? and day = ? and business_id is null");
				pstmt1.setInt(1, shop_num);;
				pstmt1.setString(2, seldate);
				rs1 = pstmt1.executeQuery();
				if(rs1.next()) total1 = rs1.getInt(1);
				
				int total2 = 0;
				pstmt2 = conn.prepareStatement("select count(*) from reserveview where shop_num = ? and day = ? and business_id is not null");
				pstmt2.setInt(1, shop_num);
				pstmt2.setString(2, seldate);
				rs2 = pstmt2.executeQuery();
				if(rs2.next()) total2 = rs2.getInt(1);
				
				int total = total1 + total2;				
				
				if(total == 0){
					%>
					<h5>예약이 없습니다.</h5>
					<%
				}
					if(total1 > 0){
						pstmt3 = conn.prepareStatement("select * from scheduleview where shop_num = ? and day = ? order by day asc, start_time asc");
						pstmt3.setInt(1, shop_num);
						pstmt3.setString(2, seldate);
						rs3 = pstmt3.executeQuery();
						%>
						<br>
						<h5><strong>온라인 예약</strong></h5>
						<div id="business_reserv_table">
							<table id="busi_r_table">
								<tr class="business_reserv table-first">
									<td id="time">시간</td>
									<td>선택직원</td>
									<td id="kind">시술종류</td>
									<td id="customer">고객명(ID)</td>
									<td id="phone">핸드폰 번호</td>
									<td>취소</td>
								</tr>
						<%
						while(rs3.next()){
							int schedule_num = rs3.getInt(1);
							Date start = rs3.getTime(5);
							Date end = rs3.getTime(6);
							String staff = rs3.getString(9);
							String kind = rs3.getString(10);
							String kind2 = rs3.getString(11);
							String name = rs3.getString(12);
							String cid = rs3.getString(3);
							String phone = rs3.getString(13);
							
							SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");
							String time1 = sdf.format(start);
							String time2 = sdf.format(end);
							
							String surgery = null;
							if(kind == "1"|| kind.equals("1")) {surgery = "네일";}
							if(kind == "2"|| kind.equals("2")) {surgery = "속눈썹";}
							if(kind == "3"|| kind.equals("3")) {surgery = "왁싱";}
				
							%>
							<tr class="business_reserv">
								<td><%=time1 %> ~ <%=time2 %></td>
								<td><%=staff%></td>
								<td><%=surgery%> - <%=kind2%></td>
								<td><%=name%>(<%=cid%>)</td>
								<td><%=phone%></td>
								<td id="changecancel"><input type="hidden" name="num" value="<%=schedule_num%>">
					<!-- 							<a href="#" title="예약변경" style="margin-right: 10px;"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a> -->
									<a href="#" class="acancel" id="acancel" data-toggle="modal" data-target="#cancelModal" title="예약취소"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></a>
								</td>
							</tr>
						<%
						}
						%>
						</table>
						</div>
						<%
					}
					if(total2 > 0){
					%>
					<br>
					<h5><strong>오프라인 예약</strong></h5>
					<div id="business_reserv_table">
						<table id="busi_r_table">
							<tr class="business_reserv table-first">
								<td id="time">시간</td>
								<td>선택직원</td>
								<td id="kind">시술종류</td>
								<td id="customer">고객명(ID)</td>
								<td id="phone">핸드폰 번호</td>
								<td>취소</td>
							</tr>
					<%
					pstmt4 = conn.prepareStatement("select * from reserveview where shop_num = ? and day = ? and business_id is not null order by day asc, start_time asc");
					pstmt4.setInt(1, shop_num);
					pstmt4.setString(2, seldate);
					rs4 = pstmt4.executeQuery();
					
					while(rs4.next()){
						int schedule_num = rs4.getInt(1);
						Date start = rs4.getTime(6);
						Date end = rs4.getTime(7);
						String staff = rs4.getString(11);
						String kind = rs4.getString(12);
						String kind2 = rs4.getString(14);
						
						SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");
						String time1 = sdf.format(start);
						String time2 = sdf.format(end);
						
						String surgery = null;
						if(kind == "1"|| kind.equals("1")) {surgery = "네일";}
						if(kind == "2"|| kind.equals("2")) {surgery = "속눈썹";}
						if(kind == "3"|| kind.equals("3")) {surgery = "왁싱";}
			
						%>
						<tr class="business_reserv">
							<td><%=time1 %> ~ <%=time2 %></td>
							<td><%=staff%></td>
							<td><%=surgery%> - <%=kind2%></td>
							<td></td>
							<td></td>
							<td id="changecancel"><input type="hidden" name="num" value="<%=schedule_num%>">
				<!-- 							<a href="#" title="예약변경" style="margin-right: 10px;"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a> -->
								<a href="#" class="acancel" id="acancel" data-toggle="modal" data-target="#cancelModal" title="예약취소"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></a>
								
							</td>
						</tr>
					<%
					}
					%>
					</table>
				</div>
					<%
					}
				
				} catch(SQLException e) {
					out.print(e.toString());
		        }
					%>
					
				</table>
			</div>
		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script>
$('.acancel').on("click",function(){
	var num = $('input[name=num]').val();
	console.log(num);
	$('input[name=schedule_num]').val(num);
})
</script>


<form method="post" action="deleteReservePro2.jsp" class="form-inline">
	<div class="modal" role="dialog" id="cancelModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">예약 취소</h3>
					<h5>취소된 예약은 복구가 불가합니다.</h5>
					<h5>정말 취소하시겠습니까?</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>비밀번호</label>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="passwd" name="passwd">
						<button type="submit" class="btn btn-danger">확인</button>
					</div>
				</div>
				<input type="hidden" name="schedule_num">
			</div>
		</div>
	</div>
</form>
</body>
</html>
<%
			}
}catch(Exception e){
	e.printStackTrace();
}
%>