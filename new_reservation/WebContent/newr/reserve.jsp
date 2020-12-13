<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="newr.login.LoginDBBean"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW RESERVATION</title>
<link href="/ebban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="/ebban/assets/slick-1.6.0/slick/slick.css" rel="stylesheet">
<link href="/ebban/assets/slick-1.6.0/slick/slick-theme.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- <link href="/bban/assets/fullcalendar-3.4.0/fullcalendar.min.css" rel="stylesheet">
<link href="/bban/assets/fullcalendar-3.4.0/fullcalendar.print.min.css" rel="stylesheet" media="print"> -->

<style>
.main {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
}
/* 선택창 고정 */
.selector{
/*  	position: fixed; */
/*  	right: 150px; */
/*  	width: 350px; */
	position:absolute;
	width: 295px;
}
.fixed {
    position: fixed;
    top: 30px;
    width: 295px;
    z-index: 100;
}
.page-header > h1 {
	font-size: 2em;
}
#texta {
    height:100px;
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
<script src="/ebban/assets/js/jquery-3.2.1.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>


<%
String id ="";
try{
	id = (String)session.getAttribute("id");
	
	if(id==null || id.equals("")){
	%>	
		<jsp:include page="optionbar.inc.jsp" flush="false"/>
	<%}
	else{
		LoginDBBean login = LoginDBBean.getInstance();
		boolean check= login.loginCheck(id);
		if(check==true) {%>
			<jsp:include page="optionbar_clogin.inc.jsp" flush="false"/>
		<%}
		else { %>
			<jsp:include page="optionbar_blogin.inc.jsp" flush="false"/>
		<% }
		}%>

<div class="main">

	<jsp:include page="header.inc.jsp" flush="false"/>
	<jsp:include page="navi.inc.jsp" flush="false"/>
	
	<!--s row-->
	<div class="row">
		<!--s col-md-8-->
		<div class="col-md-8">
			<jsp:include page="reserve.inc.jsp" flush="false"/>
		</div>
		<!--e col-md-8-->

<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("shop_num"));

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//사업자 아이디 불러오기
	String bid = null;
	pstmt = conn.prepareStatement("select business_id from shop where shop_num = ? ");
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		bid = rs.getString(1);
	}
	rs.close();
	
	
	//매장명 불러오기
	String name = null;
	pstmt = conn.prepareStatement("select shop_name from shop where shop_num = ? ");
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		name = rs.getString(1);
	}
	rs.close();
	
	//시술 불러오기(1=네일, 2=속눈썹, 3=왁싱)
	int kind_num = 0;
	String surgery = null;
	pstmt = conn.prepareStatement("select distinct(staff_kind) from staffview where shop_num  = ? ");
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();
%>
		<!--s col-md-4-->
		<div class="col-md-4">
		<div class="selector">
			<div class="page-header">
				<h1><%=name%>
					<%
					if(id==null || id.equals("")){
					%>
						<a href="#" title="쪽지보내기" onclick="loginFunction()" style="cursor: pointer; color: black; font-size: 20px; margin-left: 10px;">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</a>
					<%}
					else{
						LoginDBBean login = LoginDBBean.getInstance();
						boolean check= login.loginCheck(id);
						if(check==true) {%>
							<a href="#" title="쪽지보내기" onclick="msgFunction()" data-target="#sendModal" data-toggle="modal" style="cursor: pointer; color: black; font-size: 20px; margin-left: 10px;">
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</a>
						<%}
						else { %>
							<a href="#" title="쪽지보내기" onclick="businessFunction()" style="cursor: pointer; color: black; font-size: 20px; margin-left: 10px;">
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</a>
						<% }
						}%>
				</h1>
			</div>
			
			<form id="selform" name="selform">
				<input type="hidden" name="session_id" value="<%=id%>">
				<input type="hidden" name="shop_num" value="<%=num%>">

				<div class="form-group">
					<select class="form-control" name="kind" id="kind">
						<option selected>시술을 선택하세요.</option>
						<%
						while(rs.next()){
							kind_num = rs.getInt(1);
							if(kind_num == 1) surgery = "네일";
							if(kind_num == 2) surgery = "속눈썹";
							if(kind_num == 3) surgery = "왁싱";
						%>
						<option value="<%=kind_num%>"><%=surgery%></option>
						<%}rs.close();%>
					</select>
				</div>
				
				<script>
				//선택한 시술 보기
				$("#kind").change(function() {
					$("#detail option[name='detail_op']").remove();
				    $("#staff option[name='staff_op']").remove();
				    $("#date option[name='date_op']").remove();
				    $("#time option[name='time_op']").remove();
				    $("#take").text("");
	    			$("#selected").val("");
				    
					var num = $('input[name=shop_num]').val();
					var kind_value = $("#kind option:selected").val();
				    var kind_text = $("#kind option:selected").text();
				    if (isNaN(kind_value)) kind_value = 0;
				    
				    //surgery_detail 불러오기
				    var xhttp;    
					xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							var strdetail = this.responseText;
							var detailArray = strdetail.split(';');
							
							//surgery_num 불러오기
							var xhttp;    
							xhttp = new XMLHttpRequest();
							xhttp.onreadystatechange = function() {
								if (this.readyState == 4 && this.status == 200) {
									var strsurnum = this.responseText;
									var surnumArray = strsurnum.split(';');
									
									$("#detail option[name='detail_op']").remove();																						
									for(var i=0; i<detailArray.length-1; i++){
										$("#detail").append("<option name='detail_op' value="+surnumArray[i]+">"+detailArray[i]+"</option>");
									}//surgery_detail for문 끝
									
									$("#detail").change(function() {
										$("#staff option[name='staff_op']").remove();
										$("#date option[name='date_op']").remove();
										$("#time option[name='time_op']").remove();
										$("#take").text("");
										$("#selected").val("");
										
										var detail_value = $("#detail option:selected").val();
									    var detail_text = $("#detail option:selected").text();
									    if (isNaN(detail_value)) detail_value = 0;
									    
									    //staff_name 불러오기
									    var xhttp;    
									    xhttp = new XMLHttpRequest();
									    xhttp.onreadystatechange = function() {
									    	if (this.readyState == 4 && this.status == 200) {
									    		var strstaff = this.responseText;
									    		var staffArray = strstaff.split(';');
									    		
									    		//staff_num 불러오기
									    		var xhttp;    
									    		xhttp = new XMLHttpRequest();
									    		xhttp.onreadystatechange = function() {
									    			if (this.readyState == 4 && this.status == 200) {
									    				var strstaffnum = this.responseText;
											    		var staffnumArray = strstaffnum.split(';');
									    		
											    		$("#staff option[name='staff_op']").remove();
											    		
											    		for(var i=0; i<staffArray.length-1; i++){
												    		$("#staff").append("<option name='staff_op' value="+staffnumArray[i]+">"+staffArray[i]+"</option>");
											    		}//staff_name for문 끝
											    		
											    		$("#staff").change(function() {
											    			$("#date option[name='date_op']").remove();
											    			$("#time option[name='time_op']").remove();
											    			$("#take").text("");
											    			$("#selected").val("");
											    			
											    			var staff_value = $("#staff option:selected").val();
											    			var staff_text = $("#staff option:selected").text();
											    			if (isNaN(staff_value)) staff_value = 0;
				
															//시술소요시간 불러오기
												    		var xhttp;
												    		xhttp = new XMLHttpRequest();
												    		xhttp.onreadystatechange = function() {
												    			if(this.readyState == 4 && this.status == 200) {
												    				var strtime = this.responseText;
												    				$("#sugery_time").val(strtime);
												    				var timeArray = strtime.split(':');
												    				var hour = Number(timeArray[0]);
											    					var min = Number(timeArray[1]);
														    		if(min == 0) min = "00";
														    		
														    		//가격 불러오기
														    		var xhttp;    
														    		xhttp = new XMLHttpRequest();
														    		xhttp.onreadystatechange = function() {
														    			if (this.readyState == 4 && this.status == 200) {
														    				var surgery_price = this.responseText;
														    				$("#take").text(hour+"시간 "+min+"분 소요, "+surgery_price+"원");
														    				$("#surgery_price").val(surgery_price);
												    			
															    			//날짜 추가하기
															    			var today ="";
																		    var now = new Date();
															    			var yyyy = now.getFullYear();
															    			var MM = now.getMonth()+1;
															    			var dd = now.getDate();
															    			$("#date option[name='date_op']").remove();
								
																		    for(var i=0; i<14; i++){
																		    	today = yyyy+"-"+MM+"-"+dd;
																		    	if(dd<10) {
																		    		today = yyyy+"-"+MM+"-0"+dd;
																		    	}
																		    	$("#date").append("<option name='date_op' value="+dd+">"+today+"</option>");
																		    	//$("#date").append("<option name='date_op' id='day'>"+today+"</option>");
																		    	//$("#day").val(i+1);
																		    	dd = dd+1;
																		    	if(dd>31) {
																		    		dd = 1;
																		    		MM = MM + 1;
																		    	}
																    		}//날짜 추가 for문 끝
																    		
																    		var hh = now.getHours();
															    			var mm = now.getMinutes();
																    		$("#date").change(function() {
																    			$("#time option[name='time_op']").remove();
																    			$("#selected").val("");
																    			
																    			var date_value = $("#date option:selected").val();
																    			var date_text = $("#date option:selected").text();
																    			if (isNaN(date_value)) date_value = 0;
																    			
																    			var ddd = now.getDate();
																    			if(date_value == ddd && mm <= 30){
																    				for(var i=0; i<10; i++){
																    					if(i+hh>20) break;
																    					else if((i+hh+1)>=20){
																    						$("#time").append("<option name='time_op' id='start_time00'>"+(i+hh+1)+":00 </option>");
																    						$("#start_time00").val((i+hh+1)+":00");
																    						break;
																    					}
																    					else {
																    						$("#time").append("<option name='time_op' id='start_time00'>"+(i+hh+1)+":00 </option>");
																    						$("#start_time00").val((i+hh+1)+":00");
																    						$("#time").append("<option name='time_op' id='start_time30'>"+(i+hh+1)+":30 </option>");
																    						$("#start_time30").val((i+hh+1)+":30");
																    					}
																    				}//오늘날짜 선택, 30분 이전 시 시간 for문 끝
																    			}//오늘날짜 선택, 30분 이전 시 시간 추가 끝
	
																    			else if(date_value == ddd && mm > 30){
																    				for(var i=0; i<10; i++){
																    					if(i+hh>20) break;
																    					else if((i+hh+2)>=20){
																    						$("#time").append("<option name='time_op' id='start_time30'>"+(i+hh+1)+":30 </option>");
																    						$("#start_time30").val((i+hh+1)+":30");
																    						$("#time").append("<option name='time_op' id='start_time00'>"+(i+hh+2)+":00 </option>");
																    						$("#start_time00").val((i+hh+2)+":00");
																    						break;
																    					}
																    					else {
																    						$("#time").append("<option name='time_op' id='start_time30'>"+(i+hh+1)+":30 </option>");
																    						$("#start_time30").val((i+hh+1)+":30");
																    						$("#time").append("<option name='time_op' id='start_time00'>"+(i+hh+2)+":00 </option>");
																    						$("#start_time00").val((i+hh+2)+":00");
																    					}
																    				}//오늘날짜 선택, 30분 이후 시 시간 for문 끝
																    			}//오늘날짜 선택, 30분 이후 시 시간 추가 끝
																    			
																    			else {
																    				$("#time").append("<option name='time_op' value='11:00'>11:00</option>");
																					$("#time").append("<option name='time_op' value='11:30'>11:30</option>");
																					$("#time").append("<option name='time_op' value='12:00'>12:00</option>");
																					$("#time").append("<option name='time_op' value='12:30'>12:30</option>");
																					$("#time").append("<option name='time_op' value='13:00'>13:00</option>");
																					$("#time").append("<option name='time_op' value='13:30'>13:30</option>");
																					$("#time").append("<option name='time_op' value='14:00'>14:00</option>");
																					$("#time").append("<option name='time_op' value='14:30'>14:30</option>");
																					$("#time").append("<option name='time_op' value='15:00'>15:00</option>");
																					$("#time").append("<option name='time_op' value='15:30'>15:30</option>");
																					$("#time").append("<option name='time_op' value='16:00'>16:00</option>");
																					$("#time").append("<option name='time_op' value='16:30'>16:30</option>");
																					$("#time").append("<option name='time_op' value='17:00'>17:00</option>");
																					$("#time").append("<option name='time_op' value='17:30'>17:30</option>");
																					$("#time").append("<option name='time_op' value='18:00'>18:00</option>");
																					$("#time").append("<option name='time_op' value='18:30'>18:30</option>");
																					$("#time").append("<option name='time_op' value='19:00'>19:00</option>");
																					$("#time").append("<option name='time_op' value='19:30'>19:30</option>");
																					$("#time").append("<option name='time_op' value='20:00'>20:00</option>");
																    			}
																    			
																				//예약된 시간(start_time)불러오기
																				var xhttp;
																				xhttp = new XMLHttpRequest();
																				xhttp.onreadystatechange = function() {
																					if (this.readyState == 4 && this.status == 200) {
																						//document.getElementById("test3").innerHTML = this.responseText;
																						var starttime = this.responseText;
																						
																    					var size = document.getElementById("time").length;
																    					var txtArray = ["0"];
																    					for(var k=1; k<size; k++){
																    						var tArray = document.getElementById("time").options;
																    						txtArray.push(tArray[k].text);
																    					}
																    					
																    					if(starttime != "") {
																		    				var startArray = starttime.split(':');
																		    				var leng = (startArray.length-1)/3;
																		    				var delArray = [];
																	    					for(var j=0; j<leng; j++){
																		    					var delhour = startArray[3*j];
																		    					var delmin = startArray[3*j+1];
																		    					delArray.push(delhour +":"+ delmin);
																		    				}
																						}
																    					
																    					//추가된 시간과 start_time 비교하여 삭제
																    					for(var m=0; m<delArray.length; m++){
																    						for(var n=0; n<txtArray.length; n++){
																    							if(delArray[m] == txtArray[n]){
																    								eval("amt"+m+"=delArray["+m+"]");
																    								//console.log(eval("amt"+m));
																    								var element = $( "#time option:contains('"+ eval("amt"+m) +"')" );
																    								element.remove();
																    							}
																    						}
																    					}
																					}//start_time if끝
																				};//start_time xhttp.onreadystatechange = function()끝
																				xhttp.open("GET", "http://localhost/newr/schedule.php?shop_num=" +num + "&staff_kind=" +kind_value + "&surgery_detail=" +detail_text + "&staff_name=" +staff_text + "&day=" +date_text, true);
																				xhttp.send();
																				
																				$("#time").change(function() {
														    						$("#selected").val("");

														    						time_value = $("#time option:selected").val();
														    						time_text = $("#time option:selected").text();
														    						var timeArray = time_text.split(':');
														    						var start_hour = Number(timeArray[0]);
														    						var start_min = Number(timeArray[1]);
																					
																					//끝나는 시간 계산
																					min = Number(min);
																					var end_hour = hour + start_hour;
																					var end_min = min + start_min;
																					if(end_min == 0) {
																						end_min = "00";
																						//$("#end").text("~ "+end_hour+":"+end_min);
																					}
																					else if(end_min == 60){
																						end_hour  = end_hour + 1;
																						end_min = "00";
																						//$("#end").text("~ "+end_hour+":"+end_min);
																					}
																					//else
																					//$("#end").text("~ "+end_hour+":"+end_min);
																					$("#end_hour").val(end_hour);
																					$("#end_min").val(end_min);

														    						$("#texta").val(kind_text+" - "+detail_text+"\n"+staff_text+"\n"+date_text+" "+time_text+"~"+end_hour+":"+end_min+"\n"+surgery_price+"원");

														    					});//$("#time").change끝
												    						});//$("#date").change끝
														    			}//가격 if끝
														    		};//가격 xhttp.onreadystatechange = function()끝
														    		xhttp.open("GET", "http://localhost/newr/price.php?shop_num=" +num + "&staff_kind=" +kind_value + "&surgery_detail=" +detail_text + "&staff_name=" +staff_text, true);
														    		xhttp.send();
												    			}//소요시간 if끝
												    		};//소요시간 xhttp.onreadystatechange = function()끝
												    		xhttp.open("GET", "http://localhost/newr/time.php?shop_num=" +num + "&staff_kind=" +kind_value + "&surgery_detail=" +detail_text + "&staff_name=" +staff_text, true);
												    		xhttp.send();
											    		});//$("#staff").change끝
									    			}//staff_num if끝
									    		};//staff_num xhttp.onreadystatechange = function()끝
									    		xhttp.open("GET", "http://localhost/newr/staff_num.php?shop_num=" +num + "&staff_kind=" +kind_value + "&surgery_detail=" +detail_text, true);
											    xhttp.send();
									    	}//staff_name if끝
									    };//staff_name xhttp.onreadystatechange = function()끝
									    xhttp.open("GET", "http://localhost/newr/staff.php?shop_num=" +num + "&staff_kind=" +kind_value + "&surgery_detail=" +detail_text, true);
									    xhttp.send();
									});//$("#detail").change끝
								}//surgery_num if끝
							};//surgery_num xhttp.onreadystatechange = function()끝
							xhttp.open("GET", "http://localhost/newr/surgery_num.php?shop_num=" +num + "&staff_kind=" +kind_value, true);
							xhttp.send();
						}//surgery_detail if끝
					};//surgery_detail xhttp.onreadystatechange = function()끝
					xhttp.open("GET", "http://localhost/newr/surgery_kind.php?shop_num=" +num + "&staff_kind=" +kind_value, true);
					xhttp.send();
				});//$("#kind").change 끝
				</script>
				
				<div class="form-group">
					<select class="form-control" id="detail" name="detail">
						<option selected>시술 종류를 선택하세요.</option>
					</select>
				</div>

				<div class="form-group">
					<select class="form-control" id="staff" name="staff">
						<option selected>디자이너를 선택하세요.</option>
					</select>
					<div id="take"></div>
					<input type="hidden" name="sugery_time" id="sugery_time">
					<input type="hidden" name="surgery_price" id="surgery_price">
				</div>

				<div class="form-group">
					<select class="form-control" id="date" name="date">
						<option selected>날짜를 선택하세요.</option>
					</select>
				</div>

				<div class="form-group">
					<select class="form-control" id="time" name="time">
						<option selected>시작 시간을 선택하세요.</option>
					</select>
					<input type="hidden" name="end_hour" id="end_hour">
					<input type="hidden" name="end_min" id="end_min">
				</div>

				<div class="form-group">
					<textarea id="texta" name="texta" class="form-control" readonly="readonly" placeholder="시술, 디자이너, 날짜, 시간을 차례로 선택 후 예약하기 버튼을 클릭해주세요."></textarea>
				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-default btn-block btn-lg" value="예약하기">
				</div>
			</form>
		</div><!-- selector -->
		</div><!--s col-md-4-->
	</div><!--e row-->
</div>

<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<!-- 쪽지모달 -->
<form method="post" action="writeMessagePro2.jsp">
	<input type="hidden" name="url" id="url" value="">
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
						<input type="hidden" id="name" name="msg_receiver" value="<%=bid%>">
						<input type="text" class="form-control getsearch" value="<%=name%>">
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

<script>
function loginFunction() {
    alert("로그인 후 이용해 주세요.");
}

function msgFunction() {
	//쪽지 보낸 후 다시 돌아오기 위해 url을 저장
	var CurrentFileName = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 30);
	$("#url").val(CurrentFileName);
}

function businessFunction() {
    alert("사업자 회원님은 이용하실 수 없습니다.");
}
</script>

<script src="/ebban/assets/slick-1.6.0/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
	// $('#slick').slick({
	// 	dots: true,
	// 	autoplay: true,
	// 	autoplaySpeed: 500,
	// 	speed: 500
	// });

	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		autoplay: true,
		autoplaySpeed: 1300,
		asNavFor: '.slider-nav'
	});
	$('.slider-nav').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: false,
		centerMode: true,
		focusOnSelect: true
	});
});
</script>
<script>
$("#selform").submit(function(){
	var ttt = $("#texta").val();
	if(ttt == null || ttt ==""){
		alert("예약사항을 선택해주세요.");
		return false;
	}
	else{
		var link = document.location.href;
		document.selform.action = "reserve_chk.jsp";
		document.selform.method = "post";
		document.selform.submit();
	}
});

var num = 100; //number of pixels before modifying styles
$(window).bind('scroll', function () {
    if ($(window).scrollTop() > num) {
        $('.selector').addClass('fixed');
    } else {
        $('.selector').removeClass('fixed');
    }
});
</script>

</body>
</html>
<%

}catch(Exception e){
e.printStackTrace();
}
}catch(Exception e){
e.printStackTrace();
}
%>