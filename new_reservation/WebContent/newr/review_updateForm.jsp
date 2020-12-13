<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
	       response.sendRedirect("index.jsp");
	else{
%>

<%
	request.setCharacterEncoding("utf-8");
	int rnum = Integer.parseInt(request.getParameter("review_num"));
	
	String dbUrl = "jdbc:mysql://localhost:3306/newr";
	Class.forName("com.mysql.jdbc.Driver");
	try {
		Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
		Statement stmt = conn.createStatement();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from review where review_num = ?");
		pstmt.setInt(1, rnum);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			int scnum = rs.getInt(2);
			String title = rs.getString(3);
			String content = rs.getString(4);
			int star = rs.getInt(5);
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
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
.main {
  width: 940px;
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 0;
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
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

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
				<h3>후기 수정</h3>
			</div>

			<form class="form-horizontal" method="post" action="review_updatePro.jsp" onsubmit="return writeSave()">
			<input type=hidden name="review_num" value="<%=rnum %>">
			<input type=hidden name="schedule_num" value="<%=scnum %>">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>

					<div class="col-sm-10">
						<input class="form-control" type="text" name="review_title" value="<%=title%>">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">별점</label>
					<div class="col-sm-5">
						<fieldset class="rating">
							<input type="radio" id="star5" name="review_star" value="5"><label class = "full" for="star5"></label>
							<input type="radio" id="star4" name="review_star" value="4"><label class = "full" for="star4"></label>
							<input type="radio" id="star3" name="review_star" value="3"><label class = "full" for="star3"></label>
							<input type="radio" id="star2" name="review_star" value="2"><label class = "full" for="star2"></label>
							<input type="radio" id="star1" name="review_star" value="1"><label class = "full" for="star1"></label>
						</fieldset>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="review_content" rows="10"><%=content%></textarea>
					</div>
				</div>

				<div class="form-group text-center">
					<input type="button" class="btn btn-default" value="취소" OnClick="history.go(-1)">
					<input type="submit" class="btn" style="background-color: black; color: white;" value="수정">
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>

<%
		}
	}catch(Exception e){}%>

</body>
</html>
<% 
		}
    }catch(Exception e){
		e.printStackTrace();
	}
%>