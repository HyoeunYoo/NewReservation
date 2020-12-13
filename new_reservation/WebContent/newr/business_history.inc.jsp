<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<style>

/* fullcalendar */
#calendar {
	width: 100%;
}

#seldate {
	border: none;
	font-size: 20px;
	width: 105px;
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
</style>
<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
		response.sendRedirect("index.jsp");
	else{
%>

			<div id='calendar'></div>
			
			<%
			request.setCharacterEncoding("utf-8");
			
			String dbUrl = "jdbc:mysql://localhost:3306/newr";
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				PreparedStatement pstmt1 = null;
				PreparedStatement pstmt2 = null;
				PreparedStatement pstmt3 = null;
				ResultSet rs = null;
				ResultSet rs1 = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				
				//shop_num 불러오기
				int shop_num = 0;
				pstmt = conn.prepareStatement("select shop_num from shop where business_id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) shop_num = rs.getInt(1);
				
				//day 불러오기
				pstmt1 = conn.prepareStatement("select day from reserveview where shop_num = ? order by day asc, start_time asc");
				pstmt1.setInt(1, shop_num);
				rs1 = pstmt1.executeQuery();
				%>
				<select id="day" name="day" style="display: none;">
				<%
				while(rs1.next()){
					Date day = rs1.getDate(1);
					//SimpleDateFormat df = new SimpleDateFormat("yy.MM.dd");
					//String date = df.format(day);
					%>
					<option value="<%=day%>"><%=day%></option>
					<%
				}
				%>
				</select>
				
				<%
				//start_time 불러오기
				pstmt2 = conn.prepareStatement("select start_time from reserveview where shop_num = ? order by day asc, start_time asc");
				pstmt2.setInt(1, shop_num);
				rs2 = pstmt2.executeQuery();
				%>
				<select id="start" name="start" style="display: none;">
				<%
				while(rs2.next()){
					Time start_time = rs2.getTime(1);
					SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
					String start = df2.format(start_time);
					%>
					<option value="<%=start%>"><%=start%></option>
					<%
				}
				%>
				</select>
				
				<%
				
				//end_time 불러오기
				pstmt3 = conn.prepareStatement("select end_time from reserveview where shop_num = ? order by day asc, start_time asc");
				pstmt3.setInt(1, shop_num);
				rs3 = pstmt3.executeQuery();
				%>
				<select id="end" name="end" style="display: none;">
				<%
				while(rs3.next()){
					Time end_time = rs3.getTime(1);
					SimpleDateFormat df3 = new SimpleDateFormat("HH:mm");
					String end = df3.format(end_time);
					%>
					<option value="<%=end%>"><%=end%></option>
					<%
				}
				%>
				</select>				
			
			<!-- 선택한 날짜에 따른 예약내역 -->
			<form name="dform" id="dform" action="business_history.jsp" method="post">
				<div id="changecancel">
					<input type="hidden" id="seldate" name="seldate"></a>
				</div>
			</form>
			
		<%
			rs1.close();
			rs2.close();
			rs3.close();
	        stmt.close();
	        conn.close();

        } catch(SQLException e) {
			out.print(e.toString());
        }
		%>


<script>
$(document).ready(function() {
	//오늘날짜 표시
	var now = new Date();
	var yyyy = now.getFullYear();
	var MM = now.getMonth()+1;
	var dd = now.getDate();
	var today = yyyy+"-"+MM+"-"+dd;
	if(dd<10) {
		today = yyyy+"-"+MM+"-0"+dd;
	}
	$("#seldate").val(today);

	$('#calendar').fullCalendar({
		locale: 'ko',
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		
		dayClick: function(date, jsEvent, view) {
			//클릭한 날짜 표시
	        //$(this).css('background-color', '##ff2424');
			var clickday = date.format();
            $('#seldate').val(clickday);            
            document.getElementById('dform').submit();
            
	    },
	    events: function(start, end, timezone, callback) {
			var events =[
			 {
				 title : '수경쓰 벌스데이',
				 start : '2017-04-01'
			 },
			 {
				 title : '효봉쓰 벌스데이',
				 start : '2017-09-13'
			 }];
					
			//달력에 마크추가
			var dayArray = document.getElementById('day').options;
			var dateArray = [];
			var startArray = document.getElementById('start').options;
			var sArray = [];
			var endArray = document.getElementById('end').options;
			var eArray = [];
			
			for(var i=0; i<dayArray.length; i++){
				dateArray[i] = dayArray[i].value;
				sArray[i] = startArray[i].value;
				eArray[i] = endArray[i].value;
				events.push({
					title: sArray[i]+'~'+eArray[i],
					start: dateArray[i],
					color: '#C2185B'
				});
				
			}
 			callback(events);			
	    }//events function 끝
	});
});
</script>
<%
			}
}catch(Exception e){
	e.printStackTrace();
}
%>