<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
				<h3>후기 작성</h3>
			</div>
			
			<%
			int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
			%>

			<form class="form-horizontal" method="post" name="f" action="review_writePro.jsp">
				<div class="form-group">
					<input type="hidden" name="schedule_num" value="<%=schedule_num%>">
					<label class="col-sm-2 control-label" style="text-align: left;">제목</label>

					<div class="col-sm-10">
						<input class="form-control" type="text" name="review_title">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label" style="text-align: left;">별점</label>
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
					<label class="col-sm-2 control-label" style="text-align: left;">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="review_content" rows="10"></textarea>
					</div>
				</div>

				<!-- <div class="form-group">
					<label class="col-sm-2 control-label">사진</label>
					<div class="col-sm-10">
						<input type="file" name="m_file">
					</div>
				</div> -->

				<div class="form-group text-center">
					<input type="submit" class="btn btn-default" value="취소" OnClick="history.go(-1)">
					<input type="submit" class="btn" style="background-color: black; color: white;" value="등록">
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>

</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>