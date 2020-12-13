<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.customer.CustomerMessageDBBean"%>
<%@ page import="newr.customer.CustomerMessageDataBean"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="newr.login.LoginDBBean"%>

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
a:link, a:visited, a:active {
	color: black;
	text-decoration: none;
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
				<h3>보낸 쪽지함
					<!-- Trigger/Open The Modal -->
					<button type="button" class="btn btn-danger btn-sm" data-target="#sendModal" data-toggle="modal">쪽지보내기</button>
				</h3>
			</div>
			
<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;

				int total = 0;
				ResultSet rs = null;

				pstmt = conn.prepareStatement(
				"select count(*) from msg2 where sender = ? and msg_del != 1");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(rs.next()){
				total = rs.getInt(1);
				}
				rs.close();

				pstmt = conn.prepareStatement(
				"select * from msg2 where sender = ? and msg_del != 1 order by msg_time desc");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
%>
				<div class="sendmessege" data-example-id="striped-table">
					<table class="table table-hover" style="table-layout: fixed;">
						<thead>
							<tr>
							<td width=5%><input type="checkbox" name="check_group" onclick="CheckAll()"></td>
							<td width=10% class="text-center">no.</td>
							<td width=15% class="text-center">받은 사람</td>
							<td class="text-center">제목</td>
							<td width=30% class="text-center">날짜</td>
							</tr>
						</thead>
<%
				if(total==0) {
%>
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">보낸 쪽지가 없습니다.</td>
					</tr>

<%  			} else {
					int number = 0;

					while(rs.next()){
						String idx = rs.getString(1);
						String sender = rs.getString(2);
						String receiver = rs.getString(3);
						String msg_title = rs.getString(4);
						String msg_content = rs.getString(5);
						String msg_time = rs.getString(6);
						number++;
%>
						<tbody>
							<tr>
								<td><input type="checkbox" value="<%=idx%>" name="msg_check"></td>
								<td class="text-center"><%=number%></td>
								<td class="text-center"><%=receiver%></td>
								<td style="text-overflow: ellipsis; overflow: hidden; cursor: pointer;"><nobr><a href="msg_scontent.jsp?idx=<%=idx%>&answer=<%=sender%>"><%=msg_title%></a></nobr></td>
								<td class="text-center"><%=msg_time%></td>
							</tr>
						</tbody>
<%					}
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
				<button type="button" class="btn btn-default pull-right" id="deleteBtn">삭제</button>
		
			

	    </div>
	</div>
</div>
<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<form method="post" action="writeMessagePro.jsp">
	<div class="modal" role="dialog" id="sendModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">쪽지쓰기</h3>
				</div>

				<div class="modal-body container">
					<div class="form-horizontal">
						<label for="name" class="receiver">받는 사람</label>
						<input type="text" class="form-control getsearch" id="name" name="msg_receiver" placeholder="받는 사람의 아이디">
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

				<input type="hidden" name="sender" value="<%=id %>">

				<div class="modal-footer" style="text-align: center;">
					<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-default" style="background-color: black; color: white;">전송</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
function CheckAll(){             
	var gChk = document.getElementsByName("check_group");    //체크박스의 name값
	var nChk = document.getElementsByName("msg_check");                   
	
	if(gChk[0].checked){ 
		for(i=0; i<nChk.length;i++){                                    
			nChk[i].checked = true;     //체크되어 있을경우 설정변경
		}
	}else{
		for(i=0; i<nChk.length;i++){                                            
			nChk[i].checked = false;                                              
		}  
	}
}
</script>
<script>
$("#deleteBtn").click(function() {
    var nums = "";

    if(!confirm("정말로 삭제하시겠습니까?")) {
      return;
    }
    
    $("input:checkbox[name=msg_check]").each(function(index) {
		if($(this).prop("checked")) {
			nums += nums == "" ? $(this).val() : ","+ $(this).val();
		};
    });

    if(nums == "") {
		alert("삭제 쪽지를 선택해주세요.");
		return;
    }

    $.ajax({
		url: "sender_delMessagePro.jsp",
		type: "POST",
		data: {
			nums :  nums,
			encoding : "utf-8"
		},
		async: false,
		success: function(data) {
			if(data.isError) {
				alert(data.message);
			} else {
				window.location.reload(); 
			}
		},
		error : function(html) {
			alert("error:"+html);
		}
    });
}); //deleteBtn

</script>
</body>
</html>






<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>