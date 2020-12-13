<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "java.util.List" %>
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
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
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
    padding: 10px;
    width: 100%;
    border: 1px solid #e5e5e5;
    border-radius: 5px;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

div.panel {
    padding: 0 18px;
    background-color: white;
    border: 1px solid #e5e5e5;
    border-radius: 5px;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
	float: right; 
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

<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>
	
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="customer_navi.inc.jsp" flush="false"/>
		</div>
		
		<div class="col-md-9">
			<div class="page-header">
				<h3>후기</h3>
			</div>
			
			<%  
			String dbUrl = "jdbc:mysql://localhost:3306/newr";
			Class.forName("com.mysql.jdbc.Driver");
			try {
			Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
			Statement stmt = conn.createStatement();
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			
			ResultSet rs = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			
			int total = 0;
			pstmt = conn.prepareStatement(
			"select count(*) from reviewview where customer_id = ? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			if(total == 0) {
				%>
				<form>
					<label class="control-label">작성된 후기가 없습니다.</label>
				</form>
				<%
			}
			else {
				pstmt2 = conn.prepareStatement(
						"select * from reviewview where customer_id = ? order by day desc");
				pstmt2.setString(1, id);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()){
					int rnum = rs2.getInt(1);
					int scnum = rs2.getInt(2);
					String title = rs2.getString(3);
					String content = rs2.getString(4);
					int star = rs2.getInt(5);
					int snum = rs2.getInt(6);
					Date date = rs2.getDate(7);
					String sname = rs2.getString(11);
					
					SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");					
					String cv_date = df.format(date);
					
					pstmt3 = conn.prepareStatement(
							"select * from reserveview where schedule_num = ?");
					pstmt3.setInt(1, scnum);
					rs3 = pstmt3.executeQuery();
					
					while(rs3.next()){
						String staff = rs3.getString(11);
						int kind = rs3.getInt(12);
						String detail = rs3.getString(14);
					%>
						<button class="accordion">▶ <%=cv_date%>&nbsp;&nbsp;&nbsp;<%=sname%>&nbsp;(
						<%if(kind == 1){%>네일 - 
						<%} else if(kind == 2){%>속눈썹 - 
						<%} else{%>왁싱 - 
						<%}%>
						<%=detail%>, <%=staff%>)<%
							for (int i = 0; i < 5-star; i++){%>
								<div style="float: right; color: silver;">★</div>
							<%
							}
							for (int j = 0; j < star; j++){%>
								<div style="float: right; color: #FFD700;">★</div>
							<%
							}
							%>
						</button>
						
						<div class="panel">
							<form class="form-horizontal" method="post" style="margin: 20px 0 10px 0;">
								<div class="form-group">
									<label class="col-sm-2 control-label" style="text-align: left;">제목</label>
									<div class="col-sm-10">
										<input class="form-control" type="text" name="review_title" value="<%=title%>" readonly="readonly">
									</div>
								</div>
			
								<div class="form-group">
									<label class="col-sm-2 control-label" style="text-align: left;">별점</label>
									<div class="col-sm-10">
										<fieldset class="rating">
											<%
											for (int k = 0; k < 5-star; k++){%>
												<input type="radio" id="star1" name="review_star" value="1" /><label class = "full" for="star1" style="color: #ddd"></label>
											<%}
											for (int l = 0; l < star; l++){%>
												<input type="radio" id="star1" name="review_star" value="1" /><label class = "full" for="star1" style="color: #FFD700"></label>
											<%}%>
										</fieldset>
									</div>
								</div>
		
								<div class="form-group">
									<label class="col-sm-2 control-label" style="text-align: left;">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" name="review_content" rows="8" readonly="readonly"><%=content%></textarea>
									</div>
								</div>
								
								<div style="margin-left: 250px;">
									<input type="button" value="수정" class="btn btn-default" onclick="document.location.href='review_updateForm.jsp?review_num=<%=rnum%>'">
									<input type="button" value="삭제" class="btn" style="background-color: black; color: white;" onclick="deleteFunction(<%=rnum%>)" data-toggle="modal" data-target="#deleteModal">
								</div>
							</form>
						</div>
					<%
					}
				}
			}
			
			rs.close();
			rs2.close();
	        stmt.close();
	        conn.close();

	        } catch(SQLException e) {
				out.print(e.toString());
	        }
			%>
		</div>
		
	</div>
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script>
function deleteFunction(rnum) {
    $('input[name=review_num]').val(rnum);
}
</script>
			
<form method="post" action="review_delete.jsp" class="form-inline">
	<div class="modal" role="dialog" id="deleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">후기 삭제</h3>
					<h5>삭제한 후기는 복구가 불가합니다.</h5>
					<h5>정말 삭제 하시겠습니까?</h5>
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
				<input type="hidden" name="review_num">
			</div>
		</div>
	</div>
</form>

<% 
	}
	}catch(Exception e){
		e.printStackTrace();
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
</body>
</html>