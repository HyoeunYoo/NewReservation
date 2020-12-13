<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="newr.login.LoginDBBean"%>
<% request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<%
try{
	String id = (String)session.getAttribute("id");
	if(id==null || id.equals("")){ %>
		<script>
		var num = <%= Integer.parseInt(request.getParameter("shop_num")) %>;
		alert("로그인 후 이용해 주세요.");
		location.href="reserve.jsp?shop_num="+num;
		</script>
	<%
	}
	else{
		LoginDBBean login = LoginDBBean.getInstance();
		boolean check= login.loginCheck(id);
		if(check==true) {%>
			<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>
		<%}
		else { %>
			<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>
		<% }
%>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>
	
		<%
		int shop_num = Integer.parseInt(request.getParameter("shop_num"));
		int staff_kind = Integer.parseInt(request.getParameter("kind"));
		int surgery_num = Integer.parseInt(request.getParameter("detail"));
		int staff_num = Integer.parseInt(request.getParameter("staff"));
		String day = request.getParameter("date");
		day = "2017-12-"+day;
		String start_time = request.getParameter("time");
		String sugery_time = request.getParameter("sugery_time");
		int surgery_price = Integer.parseInt(request.getParameter("surgery_price"));
		String end_hour = request.getParameter("end_hour");
		String end_min = request.getParameter("end_min");
		String end_time = end_hour + ":" + end_min;
		
		String surgery_kind = null;
		if(staff_kind == 1) surgery_kind = "네일";
		if(staff_kind == 2) surgery_kind = "속눈썹";
		if(staff_kind == 3) surgery_kind = "왁싱";
		
// 	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일");
// 		String day = sdf1.format(select_day);
		
// 	    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
// 		String start_time = sdf2.format(select_time);

// 	    SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm");
// 		String end_time = sdf3.format(take_time);
		 
		String dbUrl = "jdbc:mysql://localhost:3306/newr";
		Class.forName("com.mysql.jdbc.Driver");
		try {
			Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
			Statement stmt = conn.createStatement();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//<알맞은 surgery_num으로 바꿔주기>
			//1.surgery_detail 찾기
		 	String sel_surgery_detail = null;
		 	pstmt = conn.prepareStatement("select surgery_detail from staffview where surgery_num = ?");
		 	pstmt.setInt(1, surgery_num);
		 	rs = pstmt.executeQuery();
			
		 	if(rs.next()){
		 		sel_surgery_detail = rs.getString(1);
		 	}
		 	rs.close();
		 	
		 	//2.찾은 surgery_detail에 맞는 surgery_num 찾기
		 	pstmt = conn.prepareStatement("select surgery_num from staffview where shop_num=? and staff_kind=? and staff_num=? and surgery_detail=?");
		 	pstmt.setInt(1, shop_num);
		 	pstmt.setInt(2, staff_kind);
		 	pstmt.setInt(3, staff_num);
		 	pstmt.setString(4, sel_surgery_detail);
		 	rs = pstmt.executeQuery();
			
		 	if(rs.next()){
		 		surgery_num = rs.getInt(1);
		 	}
		 	rs.close();
		 	
		 	LoginDBBean login2 = LoginDBBean.getInstance();
			boolean check2= login2.loginCheck(id);
			if(check2==true) {%>
				<!-- 세션 아이디가 고객일 경우에만 추가 -->
				<div class="page-header">
					<h3>예약자 정보</h3>
				</div>
				<%
				String customer_name = null;
				String customer_phone = null;
				pstmt = conn.prepareStatement("select customer_name, customer_phone from customer where customer_id = ?");
			 	pstmt.setString(1, id);
			 	rs = pstmt.executeQuery();
			 	if(rs.next()){
			 		customer_name = rs.getString(1);
			 		customer_phone = rs.getString(2);
				%>
					<form method="post" class="form-horizontal">
						<div class="form-inline" id="inform">
							<label class="control-label" id="inform_label">이름</label>
							<label class="control-label" id="inform_label"><%=customer_name%></label>
						</div>
							
						<div class="form-inline" id="inform">
							<label class="control-label" id="inform_label">휴대전화</label>
							<label class="control-label" id="inform_label"><%=customer_phone%></label>
						</div>
					</form>
					<br><br>
				<%
					}
			 	rs.close();
				}%>

				<div class="page-header">
					<h3>예약 정보</h3>
				</div>
			
				<%
				String shop_name = null;
				pstmt = conn.prepareStatement("select shop_name from shop where shop_num = ?");
			 	pstmt.setInt(1, shop_num);
			 	rs = pstmt.executeQuery();
			 	if(rs.next()){
			 		shop_name = rs.getString(1);
			 	}
			 	rs.close();
			 	
			 	String surgery_detail = null;
			 	String staff_name = null;
				pstmt = conn.prepareStatement("select surgery_detail, staff_name from staffview where surgery_num = ? and staff_num = ?");
			 	pstmt.setInt(1, surgery_num);
			 	pstmt.setInt(2, staff_num);
			 	rs = pstmt.executeQuery();
			 	if(rs.next()){
			 		surgery_detail = rs.getString(1);
			 		staff_name = rs.getString(2);
			 	}
			 	rs.close();
				%>
				<form method="post" class="form-horizontal">
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">매장명</label>
						<label class="control-label" id="inform_label"><%=shop_name%></label>
					</div>
			
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">시술</label>
						<label class="control-label" id="inform_label"><%=surgery_kind%> - <%=surgery_detail%></label>
					</div>
			
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">디자이너</label>
						<label class="control-label" id="inform_label"><%=staff_name%></label>
					</div>
			
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">날짜</label>
						<label class="control-label" id="inform_label"><%=day%></label>
					</div>
			
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">시간</label>
						<label class="control-label" id="inform_label"><%=start_time%> ~ <%=end_time%></label>
					</div>
					
					<div class="form-inline" id="inform">
						<label class="control-label" id="inform_label">가격</label>
						<label class="control-label" id="inform_label"><%=surgery_price%>원</label>
					</div>
					
					<div class="text-right">  
						<button class="btn btn-default" type="button">
							<img src="reserve_backbtn.png" width="60" height="60" alt="돌아가기" OnClick="window.location='reserve.jsp?shop_num=<%=shop_num%>'">
						</button>
						<button class="btn btn-default" type="button">
							<img src="reserve_btn.png" width="60" height="60" alt="예약하기" data-toggle="modal" data-target=".bs-example-modal-sm">
						</button>
					</div>
				</form>
			</div>

<!-- 모달 -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<form method="post" action="reserve_pro.jsp">
				<input type="hidden" name=id value="<%=id%>">
				<input type="hidden" name="shop_num" value="<%=shop_num%>">
				<input type="hidden" name="surgery_num" value="<%=surgery_num%>">
				<input type="hidden" name="staff_num" value="<%=staff_num%>">
				<input type="hidden" name="day" value="<%=day%>">
				<input type="hidden" name="start_time" value="<%=start_time%>">
				<input type="hidden" name="end_time" value="<%=end_time%>">
				<div style="margin: 20px 0;">
					예약이 완료되면<br> 변경은 취소 후 재예약 해주셔야 합니다.<br><br>
					예약하시겠습니까?
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-default" OnClick="history.go(0)">취소</button>
					<button type="submit" class="btn btn-default">확인</button>
				</div>
			</form>
		</div>
	</div>
</div><!-- 모달 끝 -->

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

</body>
</html>
<%
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>