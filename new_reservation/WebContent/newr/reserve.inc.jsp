<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<style>
#side-nav > .nav > li > a {
	color: black;
}
#side-nav > .nav > li > a:hover{
	color: white;
	background-color: #ff2424;
}

#side-nav {
	position: relative;
	overflow: hidden;
}
#side-nav:before,
#side-nav:after {
	content: ' ';
	display: table;
}
#side-nav:after {
 	clear: both;
}

section {
	height: 350px;
	padding: .5em 1em .5em 1em;
}
section + section {
	height: 2350px; /* note the section height here! */
}

section + section + section {
	height: 420px;
}

section h2 {
	font-size: 2em;
	line-height: 2.5em;
}

section p {
	line-height: 1.6em;
	width: 100%;
}

button.accordion {
    background-color: white;
    cursor: pointer;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: white;
}

div.panel {
    padding: 5px 0 0 5px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.slider-for {
	margin-top: 30px;
	margin-bottom: 10px;
	height: 400px;
}
.slider-for img {
	height: 400px;
}

.slider-nav {
	margin-bottom: 10px;
	width: 300px;
	height: 50px;
	margin-left: auto;
	margin-right: auto;
}
.slider-nav img {
	height: 50px;
}
</style>

<%
int num = Integer.parseInt(request.getParameter("shop_num"));

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
	
	//사진 개수 불러오기
	int total = 0;
	pstmt1 = conn.prepareStatement("select count(s_img_path) from shop_img where shop_num = ? ");
	pstmt1.setInt(1, num);
	rs1 = pstmt1.executeQuery();
	if(rs1.next()) total = rs1.getInt(1);
	%>
	
	<div class="slider-for">
	<%
	if(total > 0) {
		//사진 불러오기
		pstmt = conn.prepareStatement("select s_img_path from shop_img where shop_num = ? ");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String shop_img_path = rs.getString(1);
			%>
			<img src="img/<%=shop_img_path%>">
			<%
		}
		rs.close();
		%>
		</div>
		
		<div class="slider-nav">
		<%
		//사진 불러오기
		pstmt = conn.prepareStatement("select s_img_path from shop_img where shop_num = ? ");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String shop_img_path = rs.getString(1);
		%>
			<img src="img/<%=shop_img_path%>">
		<%
		}
		rs.close();
	%>
		</div>
	<%} %>
	
			<div id="side-nav">
				<ul class="nav nav-tabs">
					<li><a href="#one">기본정보</a></li>
					<li><a href="#two">상세정보</a></li>
					<li><a href="#three">이용안내</a></li>
					<li><a href="#four">후기</a></li>
				</ul>		
			</div>

			<section id="one">
				<h2>기본정보</h2>
				<%
				//기본정보 불러오기
				pstmt = conn.prepareStatement("select * from shop where shop_num = ? ");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String addr = rs.getString(4);
					String phone = rs.getString(5);
					String intro = rs.getString(6);
				%>
				<h5><strong style="margin-right: 122px;">영업시간</strong><%=intro%></h5>
				<h5><strong style="margin-right: 150px;">주소</strong><%=addr%></h5>
				<h5><strong style="margin-right: 90px;">인근 지하철역</strong>한양대역(2호선)</h5>
				<h5><strong style="margin-right: 117px;">오시는 길</strong>한양대역 2번 출구 도보 15분</h5>
				<h5><strong style="margin-right: 137px;">연락처</strong><%=phone%></h5>
				<br>
				<h5><strong>
				<%
				}
				rs.close();
				
				pstmt2 = conn.prepareStatement("select shop_hasy_content from shop_hasy where shop_num = ? ");
				pstmt2.setInt(1, num);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()){
					String hasy = rs2.getString(1);
				%>
				<span><%=hasy%>&nbsp;</span>
				<%
				}
				rs2.close();
				%>
				</strong>
				</h5>
			</section>

			<section id="two">
				<hr>
				<h2 >상세정보</h2>
				<table>
				<%
				//시술정보 불러오기
				pstmt = conn.prepareStatement("SELECT DISTINCT(surgery_detail) FROM staffview WHERE shop_num = ?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String detail = rs.getString(1);
					
					//시술에 따른 가격 정보 불러오기
					pstmt2 = conn.prepareStatement("SELECT DISTINCT(surgery_price) FROM staffview WHERE shop_num = ? and surgery_detail= ?");
					pstmt2.setInt(1, num);
					pstmt2.setString(2, detail);
					rs2 = pstmt2.executeQuery();
					while(rs2.next()){
						String price = rs2.getString(1);
				%>
						<tr>
							<td style="font-weight: bold; text-align: right; padding-right: 30px;"><%=detail%></td>
							<td>·····························</td>
							<td style="padding-left: 10px;"><%=price%></td>
						</tr>
					<%
					}
				}
				rs.close();
				rs2.close();
				%>
				</table>
				<br>

				<img src="reserve_pic1.png" style="width: 100%; margin-bottom: 10px;">
				<img src="reserve_pic2.png" style="width: 100%; margin-bottom: 10px;">
				<img src="reserve_pic3.png" style="width: 100%; margin-bottom: 10px;">
				<img src="reserve_pic4.png" style="width: 100%; margin-bottom: 10px;">
				<img src="reserve_pic5.png" style="width: 100%; margin-bottom: 10px;">
			</section>

			<section id="three">
				<hr>
				<h2>이용안내</h2>
				<h5><dd> ▶ 예약 후 변경을 원할 시 취소 후 재예약 해주셔야 합니다.</dd></h5>
				<h5><dd> ▶ 예약 취소는 [마이페이지 - 예약내역] 또는 매장과의 연락을 통해서 할 수 있습니다.</dd></h5>
				<h5><dd> ▶ 예약 당일 연락 없이 방문하지 않을 경우(노쇼), 추후 불이익을 받으실 수 있으니</dd>
				<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부득이하게 방문하지 못할 경우 미리 취소하거나 샵에 연락을 취해주시기 바랍니다.</dd></h5>
				<h5><dd> ▶ 추가서비스는 추가비용이 발생합니다. (파츠, 글리터 등)</dd></h5>
				<h5><dd> ▶ 현장 추가 결제 가능 합니다.</dd></h5>
				<h5><dd> ▶ 디자인에 따라 시술시간에 변경되므로 현장에서 디자인 변경을 원하실 경우,</dd>
				<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약 상황에 따라 불가능 하실 수 있습니다.</dd></h5>
				<h5><dd> ▶ 샵과의 상담을 원할 경우, 쪽지를 통해 상담하실 수 있습니다. (샵명 오른쪽 쪽지버튼 이용)</dd></h5>
			</section>
			
			<!-- 후기 -->
			<%
			//후기가 있는지 검색
			int rtotal = 0;
			pstmt = conn.prepareStatement("select count(review_num) from reviewview where shop_num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) rtotal = rs.getInt(1);
			
			//후기가 없으면
			if(rtotal == 0) {
				%>
				<section id="four" style="height: 200px;">
					<hr>
					<h2>후기</h2>
					<h5>후기가 없습니다.</h5>
				</section>
				<%
			}
			//후기가 있으면
			else {
				%>
				<section id="four" style="height: 450px;">
					<hr>
					<h2>후기</h2>
					<%
					pstmt2 = conn.prepareStatement("SELECT * FROM reviewview WHERE shop_num = ?");
					pstmt2.setInt(1, num);
					rs2 = pstmt2.executeQuery();
					while(rs2.next()){
						//예약 사항 불러오기
						int scnum = rs2.getInt(2);
						String title = rs2.getString(3);
						String content = rs2.getString(4);
						int star = rs2.getInt(5);
						Date date = rs2.getDate(7);
						
						SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");					
						String cv_date = df.format(date);
						
						pstmt3 = conn.prepareStatement("select * from reserveview where schedule_num = ?");
						pstmt3.setInt(1, scnum);
						rs3 = pstmt3.executeQuery();
	
						while(rs3.next()){
							String staff = rs3.getString(11);
							int kind = rs3.getInt(12);
							String detail = rs3.getString(14);
							
							String skind = null;
							if(kind==1) skind = "네일";
							if(kind==2) skind = "속눈썹";
							if(kind==3) skind = "왁싱";
							
							%>
							<button class="accordion">
								<%
								for (int i = 0; i < star; i++){%>
									<div style="float: left; color: #FFD700;">★</div>
								<%
								}
								for (int j = 0; j < 5-star; j++){%>
									<div style="float: left; color: silver;">★</div>
								<%
								}
								%>
								&nbsp;&nbsp;&nbsp;<%=title%>
								<div style="font-size: 85%; margin-top: 10px;"><%=content%></div>
							</button>
					
							<div class="panel">
								<table style="font-size: 85%;">
									<tr>
										<td style="font-weight: bold; text-align: right; padding-right: 10px;">받은 시술</td>
										<td>&nbsp;&nbsp;&nbsp;<%=skind%>&nbsp;_&nbsp;<%=detail%></td>
									</tr>
									<tr>
										<td style="font-weight: bold; text-align: right; padding-right: 10px;">선택 직원</td>
										<td>&nbsp;&nbsp;&nbsp;<%=staff%></td>
									</tr>
									<tr>
										<td style="font-weight: bold; text-align: right; padding-right: 10px;">받은 날짜</td>
										<td>&nbsp;&nbsp;&nbsp;<%=cv_date%></td>
									</tr>
								</table>
							</div>
							
							<%
						}
					}
				%>
				</section>
				<%
			}
					
	rs.close();
	stmt.close();
	conn.close();

} catch(SQLException e) {
out.print(e.toString());
}
%>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
	acc[i].onclick = function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.maxHeight){
			panel.style.maxHeight = null;
		} else {
			panel.style.maxHeight = panel.scrollHeight + "px";
		} 
	 }
}
</script>