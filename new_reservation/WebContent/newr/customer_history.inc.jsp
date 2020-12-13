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

<style>
/*예약내역 테이블*/
#business_reserv_table {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.business_reserv td{
	width: 5%;
	height: 40px;
	border: 1px solid lightgray;
}
.table-first {
	height: 40px;
	font-weight: bold;
}
#shop_name {
	width:20%;
}
#sg_kind {
	width:20%;
}
#designer {
	width: 10%;
}
#datetime {
	width: 22%;
}
#charge {
	width: 10%;
}
#bgo {
	width: 8%;
}
#changecancel a {
	color: black;
	font-size: 20px;
}

</style>

<div id="business_reserv_table">
	<table id="busi_r_table">
		<tr class="business_reserv table-first">
			<td id="shop_name">매장명</td>
			<td id="sg_kind">시술종류</td>
			<td id="designer">디자이너</td>
			<td id="datetime">예약 날짜 / 시간</td>
			<td id="charge">가격</td>
			<td id="bgo">비고</td>
		</tr>

<%  
		String dbUrl = "jdbc:mysql://localhost:3306/newr";
		Class.forName("com.mysql.jdbc.Driver");
		try {
		Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
		Statement stmt = conn.createStatement();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;

		int total = 0;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		pstmt = conn.prepareStatement(
		"select count(*) from reserveview where customer_id = ? ");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if(rs.next()){
			total = rs.getInt(1);
		}

		if(total > 0){

			pstmt2 = conn.prepareStatement(
			"select * from reserveview where customer_id = ? order by day desc");
			pstmt2.setString(1, id);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()){
				int schedule_num = rs2.getInt(1);
				String shop_name = rs2.getString(8);
				String sg_detail = rs2.getString(14);
				int sg_kind = rs2.getInt(12);
				String designer = rs2.getString(11);
				Date date = rs2.getDate(5);
				Time time1 = rs2.getTime(6);
				Time time2 = rs2.getTime(7);
				String price = rs2.getString(13);
				
				SimpleDateFormat df = new SimpleDateFormat("yy.MM.dd");
				SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
				
				String cv_date = df.format(date);
				String cv_time1 = df2.format(time1);
				String cv_time2 = df2.format(time2);
				
				Date today = new Date();
				String today2 = df.format(today);
				
				int comparedate = today2.compareTo(cv_date);
%>

				<tr class="business_reserv">
					<td><%=shop_name%></td>
					<%if(sg_kind == 1){%>
						<td>네일 - <%=sg_detail%></td>
					<%} else if(sg_kind == 2){%>
						<td>속눈썹 - <%=sg_detail%></td>
					<%} else{%>
						<td>왁싱 - <%=sg_detail%></td>
					<%}%> 
					<td><%=designer%></td>
					<td><%=cv_date%>&nbsp;<%=cv_time1%> ~ <%=cv_time2%></td>
					<td><%=price%>원</td>
		
					<td id="changecancel">
						<% if(comparedate < 0){%>
							<a href="reserve_cancel.jsp?schedule_num=<%=schedule_num%>" title="예약취소">
								<input type="hidden" name="schedule_num" value="<%=schedule_num%>">
								<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
							</a>
						<%} else {
							pstmt3 = conn.prepareStatement(
							"select * from reviewview where schedule_num = ?");
							pstmt3.setInt(1, schedule_num);
							rs3 = pstmt3.executeQuery();
							
							if(rs3.next()){%>
								<a title="완료" onclick="myFunction()" style="cursor: pointer;">
									<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
								</a><%
							}
							else {%>
							<a href="review_writeForm.jsp?schedule_num=<%=schedule_num%>" title="후기작성">
								<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
							</a><%
							}
						}%>
					</td>
				</tr>
			<%}%>

<%		 }else {			%>
			<tr class="business_reserv">
				<td colspan="6">예약 내역이 없습니다.</td>
			</tr>
<%
        }

        rs.close();
        stmt.close();
        conn.close();

        } catch(SQLException e) {
			out.print(e.toString());
        }

%>	
	</table>
</div>

<script>
function myFunction() {
    alert("후기 작성이 완료되었습니다.");
}
</script>
<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>