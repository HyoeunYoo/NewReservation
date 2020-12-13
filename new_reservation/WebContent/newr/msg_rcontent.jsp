<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.login.LoginDBBean"%>
<%@ page import="newr.customer.CustomerMessageDBBean"%>
<%@ page import="newr.customer.CustomerMessageDataBean"%>
<%@ page import="java.util.List" %>
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

	int idx = Integer.parseInt(request.getParameter("idx"));
	String answer = request.getParameter("answer");

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>

<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.main {
	display: block;
	width: 940px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}

/*쪽지*/
.receiver, .msgcontent{
	display: block;
	float: left;
	padding-top: 8px;
	font-size: 15px;
	width: 80px;
	text-align: center;
}
.getsearch, .msgcontent_word {
	width: 470px;
}
.msg_title {
	width: 470px;
	margin-top: 10px;
}
.msgcontent_contain {
/*margin-top: 50px;*/
	margin-top: 10px;
}
.searchicon {
	display: block;
	float: left;
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
/*테두리검은색*/
.msgcontent_word:focus, .getsearch:focus{
	border-color: inherit;
	-webkit-box-shadow: none;
	box-shadow: none;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<%
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

	<div class="row">
		<div class="col-sm-3">
			<jsp:include page="msg_navi.inc.jsp" flush="false"/>
		</div>
	 
	    <div class="col-sm-9">
			<div class="page-header">
				<h3>받은 쪽지</h3>
			</div>




<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				ResultSet rs = null;

			
				pstmt = conn.prepareStatement(
				"select * from msg2 where msg_num = ? ");
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();

					while(rs.next()){
						
						String sender = rs.getString(2);
						String receiver = rs.getString(3);
						String msg_title = rs.getString(4);
						String msg_content = rs.getString(5);
						String msg_time = rs.getString(6);


%>						
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" value="<%=msg_title%>" readonly="readonly">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">보낸 사람</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" value="<%=sender%>" readonly="readonly">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">날짜</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" value="<%=msg_time%>" readonly="readonly">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="10" readonly="readonly"><%=msg_content%></textarea>
								</div>
							</div>
							
							<!-- Trigger/Open The Modal -->
							<div class="text-center">
								<button type="button" class="btn btn-default" onclick="history.go(-1)">목록으로</button>
								<button type="button" class="btn btn-default" data-target="#msg_answer" data-toggle="modal" style="background-color: black; color: white;">답장쓰기</button>
							</div>
						</form>
<%					}
				

		        rs.close();
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

<form method="post" action="writeMessagePro.jsp">
	<div class="modal" role="dialog" id="msg_answer" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">답장쓰기</h3>
				</div>

				<div class="modal-body container">
					<div class="form-horizontal">
						<label for="name" class="receiver">받는 사람</label>
						<input type="text" class="form-control getsearch" id="name" name="msg_receiver" value="<%=answer%>">
					</div>

					<div class="form-horizontal">
						<label for="title" class="receiver">제목</label>
						<input type="text" class="form-control msg_title" id="title" name="msg_title">
					</div>

					<div class="form-horizontal msgcontent_contain">
						<label for="name" class="msgcontent">내용</label>
						<textarea class="form-control msgcontent_word" rows="5" name="msg_content"></textarea>
					</div>
				</div>

				<input type="hidden" name="sender" value="<%=id%>">

				<div class="modal-footer" style="text-align: center;">
					<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-default" style="background-color: black; color: white;">전송</button>
				</div>
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