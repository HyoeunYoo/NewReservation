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
.surgery_info {
	border: 1px solid lightgray;
	width: 150px;
	height: 150px;
	border-radius: 25px;
	cursor: pointer;
	margin-top: 50px;
}
.sg_select {
	text-align: center;
	margin-top: 50px;
	font-size: 1.5em;
}
.sg_detail {
	text-align: center;
	font-size: 1em;
	color: gray;
	margin-top: -30px;

}
#join {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	/*padding-right: 40px;*/
}

.cusjoin, .busijoin {
	width: 	100px;
	height: 100px;
}
.nailcontainer, .eyelashconatiner, .waxingcontainer {
	margin-left: -15px;
}
a:link, a:visited, a:active {
	color: black;
	text-decoration: none;
}

</style>
</head>
<body>

<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>

<div class="main">
	<jsp:include page="header.inc.jsp" flush="false"/>

	<jsp:include page="navi.inc.jsp" flush="false"/>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="business_navi.inc.jsp" flush="false"/>
		</div>

		<div class="col-md-9">
			<div class="page-header">
				<h3>EYELASH 직원</h3>
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
				"select count(*) from staffview where business_id = ?  and staff_kind = 2");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(rs.next()){
				total = rs.getInt(1);
				}
				rs.close();

				pstmt = conn.prepareStatement(
				"select * from staffview where business_id = ?  and staff_kind = 2");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
%>
			<table class="table table-hover">
				<thead>
					<tr>
						<td class="text-center"><input type="checkbox" name="check_group"onclick="CheckAll()"></td>
						<td class="text-center">no.</td>
						<td class="text-center">직원이름</td>
						<td class="text-center">시술이름</td>
						<td class="text-center">시술가격</td>
						<td class="text-center">시술시간</td>
					</tr>
				</thead>
<%
				if(total==0) {
%>
					<tr>
						<td colspan="6" class="text-center">등록된 직원이 없습니다.</td>
					</tr>

<%  			} else {
					int number = 0;

					while(rs.next()){
						String idx = rs.getString(4);
						String staff_name = rs.getString(3);
						String surgery_detail = rs.getString(6);
						String surgery_price = rs.getString(8);
						String surgery_time = rs.getString(7);
						number++;

%>
				<tbody>
					<tr>
						<td class="text-center"><input type="checkbox" value="<%=idx%>" name="surgery_check"></td>
						<td class="text-center"><%=number%></td>
						<td class="text-center"><%=staff_name%></td>
						<td class="text-center"><%=surgery_detail%></td>
						<td class="text-center"><%=surgery_price%></td>
						<td class="text-center"><%=surgery_time%></td>
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

			
			<input type="button" class="btn btn-default pull-right"  onclick="delStaff()" value="삭제">
			

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>
<script>
function CheckAll(){             
	var gChk = document.getElementsByName("check_group");    //체크박스의 name값
	var nChk = document.getElementsByName("surgery_check");                   
	
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

function delStaff(){  
    var nums = "";

    if(!confirm("정말로 삭제하시겠습니까?")) {
      return;
    }
    
    $("input:checkbox[name=surgery_check]").each(function(index) {
		if($(this).prop("checked")) {
			nums += nums == "" ? $(this).val() : ","+ $(this).val();
		};
    });

    if(nums == "") {
		alert("삭제 쪽지를 선택해주세요.");
		return;
    }


    
    $.ajax({
		url: "delStaffPro.jsp",
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
}; //deleteBtn

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>