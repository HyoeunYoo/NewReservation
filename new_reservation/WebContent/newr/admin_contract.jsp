<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))
	       response.sendRedirect("admin.jsp");
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
.main {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}

table > tbody {
	cursor: pointer;
}
.btn_contain {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 150px;
}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="optionbar_alogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="admin_header.inc.jsp" flush="false"/>

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="admin_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>사업자 계약관리</h3>
			</div>
			
			<form>
			<table class="table table-hover">
				<thead>
					<tr>
						<td width=5%><input type="checkbox" name="check_group" onclick="CheckAll()"></td>
						<th class="text-center">no.</th>
						<th class="text-center">사업자아이디</th>
						<th class="text-center">매장이름</th>
						<th class="text-center">계약상태</th>
					</tr>
				</thead>
<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {
					Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
					Statement stmt = conn.createStatement();
					PreparedStatement pstmt = null;
					PreparedStatement pstmt2 = null;
	
					int total = 0;
					ResultSet rs = null;
					ResultSet rs2 = null;
	
					pstmt = conn.prepareStatement(
					"select count(*) from business");
					rs = pstmt.executeQuery();
	
					if(rs.next()){
						total = rs.getInt(1);
					} else{
						total = 0;
					}
					rs.close();
					out.print("총 사업자 : " + total + "명");
					
					pstmt = conn.prepareStatement(
					"select business_id from business");
					rs = pstmt.executeQuery();
					
					if(total==0){
	%>
						<tbody>
							<tr>
								<td colspan="4">등록된 사업자가 없습니다.</td>
							</tr>
						</tbody>
	
	<%				}else {
						int number = 0;
					
						while(rs.next()){
							String business_id = rs.getString(1);
							number++;
		
							pstmt2 = conn.prepareStatement(
							"select * from contractview where business_id = ? ");
							pstmt2.setString(1, business_id);
							rs2 = pstmt2.executeQuery();
		
		
							while(rs2.next()){
							String b_id = rs2.getString(2);
							String shop_name = rs2.getString(3);
							int contract_ck = rs2.getInt(9);
	%>
								<tbody>
									<tr>
										<td><input type="checkbox" value="<%=b_id%>" name="msg_check"></td>
										<td class="text-center"><%=number%></td>
										<td class="text-center"><%=b_id%></td>
										<td class="text-center"><%=shop_name%></td>
									<%if(contract_ck == 0){%>
										<td class="text-center">계약중</td>
									<%} else {%>
										<td class="text-center">만료</td>
	
									<%}%>
									</tr>
								</tbody>
		<%					
	
							}
						}
					}
	
			        rs.close();
			        stmt.close();
			        conn.close();

		        } catch(SQLException e) {
					out.print(e.toString());
		        }
%>
			</table>
			
			<div class="container btn_contain">
				<button type="button" class="btn btn-default" id="deleteBtn">계약</button>
				<button type="button" class="btn btn-default" id="deleteBtn2">만료</button>
			</div>
			</form>
		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
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

    if(!confirm("계약상태를 변경하시겠습니까?")) {
      return;
    }
    
    $("input:checkbox[name=msg_check]").each(function(index) {
		if($(this).prop("checked")) {
			nums += nums == "" ? $(this).val() : ","+ $(this).val();
		};
    });

    if(nums == "") {
		alert("변경할 사업자를 선택해주세요.");
		return;
    }


    $.ajax({
		url: "changeContractPro_ing.jsp",
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
<script>
$("#deleteBtn2").click(function() {
    var nums = "";

    if(!confirm("계약상태를 변경하시겠습니까?")) {
      return;
    }
    
    $("input:checkbox[name=msg_check]").each(function(index) {
		if($(this).prop("checked")) {
			nums += nums == "" ? $(this).val() : ","+ $(this).val();
		};
    });

    if(nums == "") {
		alert("변경할 사업자를 선택해주세요.");
		return;
    }


    $.ajax({
		url: "changeContractPro_expired.jsp",
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