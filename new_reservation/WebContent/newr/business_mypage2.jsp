<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
#inform_label {
	width: 15%;
	text-align: left;
	vertical-align: top;
}
#inform_300 {
	width: 300px;
}
#inform_200 {
	width: 200px;
}
#inform_120 {
	width: 120px;
}
#inform_80 {
	width: 80px;
}
#inform_80p {
	width: 80%
}
.adddetailinfo{
	width: 550px;
	display: block;
	margin: 10px 150px 0px 110px;
}
.filebox input[type="file"] { 
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;/* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
.sm_button {
	width: 500px;
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
				<h3>매장정보수정</h3>
			</div>

			<form method="post" class="form-horizontal" action="modifyBusiness2.jsp" enctype="multipart/form-data">

<%  
				String dbUrl = "jdbc:mysql://localhost:3306/newr";
				Class.forName("com.mysql.jdbc.Driver");
				try {   
				Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
				Statement stmt = conn.createStatement();
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				PreparedStatement pstmt3 = null;
				PreparedStatement pstmt4 = null;

				ResultSet rs = null;
				ResultSet rs2 = null;
				ResultSet rs3 = null;
				ResultSet rs4 = null;

				pstmt = conn.prepareStatement(
				"select * from shop where business_id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(rs.next()){
				
				String shop_name = rs.getString(3);
				String shop_addr = rs.getString(4);
				String shop_phone = rs.getString(5);
				String shop_intro = rs.getString(6);
%>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">매장명</label>
					<input type="text" class="form-control" id="inform_80p" name="shop_name" value="<%=shop_name%>">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">매장 주소</label>
					<input type="text" class="form-control" id="sample6_postcode" readonly="readonly">
					<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-default" value="검색">
				</div>
				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">주소</label>
					<input type="text" class="form-control" id="sample6_address" value="<%=shop_addr%>" name="shop_addr1" readonly="readonly" style="width:80%">
				</div>
				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">상세주소</label>
					<input type="text" class="form-control inform_80p" id="sample6_address2" value="" name="shop_addr2" style="width:80%">
				</div>
				

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">매장 전화번호</label>
					<input id="inform_120" type="text" class="form-control" name="shop_phone" id="phone" value="<%=shop_phone%>">
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">매장 소개글</label>
					<textarea class="form-control" id="inform_80p" name="shop_intro" rows="5"><%=shop_intro%></textarea>
				</div>

				<div class="form-inline" id="inform" name="s_img">
<%						
					pstmt3 = conn.prepareStatement(
					"select * from imgview where business_id = ?");
					pstmt3.setString(1, id);
					rs3 = pstmt3.executeQuery();
					
					for(int simg=1; simg<6; simg++){
						while(rs3.next()){
						String ssimg = rs3.getString(4);
%>
						<div class="filebox fb<%=simg%>">
							<%if(simg==1){%>
							<label class="control-label" id="inform_label">매장 사진</label>
							<%} else{%>
							<label class="control-label" id="inform_label" style="color:white">매장 사진</label>
							<%}%>
							<input type="text" class="upload-name ul<%=simg%>" readonly="readonly" value="<%=ssimg%>">
							<label for="ex_filename<%=simg%>" class="form-control">찾아보기</label>
							<input type="file" id="ex_filename<%=simg%>" class="upload-hidden<%=simg%>" name="s_img_path<%=simg%>"> 

							<input type="button" class="form-control" id="removepicture<%=simg%>" value="-">
						</div>
<%						break;
						}
					}
%>
				</div>

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label" name="hasy">해시태그</label>
<%						
					pstmt2 = conn.prepareStatement(
					"select * from tagview where business_id = ?");
					pstmt2.setString(1, id);
					rs2 = pstmt2.executeQuery();
					
					for(int shc=1; shc<4; shc++){
					while(rs2.next()){
						String tag = rs2.getString(4);
%>
						<input type="text" class="form-control" id="inform_120" name="shop_hash_content<%=shc%>" value="<%=tag%>">
<%
						break;
						}
					}
%>
				</div>


<%						
					pstmt4 = conn.prepareStatement(
					"select * from shop where business_id = ?");
					pstmt4.setString(1, id);
					rs4 = pstmt4.executeQuery();

					while(rs4.next()){
					String shop_kind = rs4.getString(8);
%>
						<div>
							<label class="control-label" id="inform_label">시술종류</label>
							<input type="radio" value="1" name="shop_kind"<% if(shop_kind.equals("1")) out.print(" checked=\"checked\"");%>> Nail&nbsp;&nbsp;&nbsp;
							<input type="radio" value="2" name="shop_kind"<% if(shop_kind.equals("2")) out.print(" checked=\"checked\"");%>> Eyelash&nbsp;&nbsp;&nbsp;
							<input type="radio" value="3" name="shop_kind"<% if(shop_kind.equals("3")) out.print(" checked=\"checked\"");%>> Waxing
						</div>
<%				
					}
				
				}
				
		        rs.close();
		        pstmt.close();
		        conn.close();



		        } catch(SQLException e) {
					out.print(e.toString());
		        }

%>
				<br><br>
				<div class="container sm_button">
					<input type="submit" class="btn btn-default pull-right sm_button" value="수정">
				</div>
			</form>

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수
            var newZonecode = data.zonecode;

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = newZonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>

<script>
$(document).ready(function(){
	if($('input:text[name="shop_hash_content1"]').length == 0){

		$('label[name="hasy"]').parent().append('<input type="text" class="form-control" id="inform_120" name="shop_hash_content1" value="#">');
	}

	if($('input:text[name="shop_hash_content2"]').length == 0){

		$('label[name="hasy"]').parent().append('<input type="text" class="form-control" id="inform_120" name="shop_hash_content2" value="#">');
	}

	if($('input:text[name="shop_hash_content3"]').length == 0){

		$('label[name="hasy"]').parent().append('<input type="text" class="form-control" id="inform_120" name="shop_hash_content3" value="#">');
	}

	if($('input:file[name="s_img_path1"]').length == 0){
		$('div[name="s_img"]').append('<div class="filebox fb1"><label class="control-label" id="inform_label">매장 사진</label>&nbsp<input type="text" class="upload-name ul1"  readonly="readonly">&nbsp<label for="ex_filename1" class="form-control">찾아보기</label>&nbsp<input type="file" id="ex_filename1" class="upload-hidden1" name="s_img_path1"><input type="button" class="form-control" id="removepicture1" value="-"></div>');
		
	}

	if($('input:file[name="s_img_path2"]').length == 0){

		$('div[name="s_img"]').append('<div class="filebox fb2"><label class="control-label" id="inform_label" style="color:white">매장 사진</label>&nbsp<input type="text" class="upload-name ul2" readonly="readonly">&nbsp<label for="ex_filename2" class="form-control">찾아보기</label>&nbsp<input type="file" id="ex_filename2" class="upload-hidden2" name="s_img_path2"><input type="button" class="form-control" id="removepicture2" value="-"></div>');
		
	}
	if($('input:file[name="s_img_path3"]').length == 0){

		$('div[name="s_img"]').append('<div class="filebox fb3"><label class="control-label" id="inform_label" style="color:white">매장 사진</label>&nbsp<input type="text"class="upload-name ul3 uuuu3" readonly="readonly">&nbsp<label for="ex_filename3" class="form-control">찾아보기</label>&nbsp<input type="file" id="ex_filename3" class="upload-hidden3" name="s_img_path3"><input type="button" class="form-control" id="removepicture3" value="-"></div>');
		
	}
	if($('input:file[name="s_img_path4"]').length == 0){

		$('div[name="s_img"]').append('<div class="filebox fb4"><label class="control-label" id="inform_label" style="color:white">매장 사진</label>&nbsp<input type="text" class="upload-name ul4" readonly="readonly">&nbsp<label for="ex_filename4" class="form-control">찾아보기</label>&nbsp<input type="file" id="ex_filename4" class="upload-hidden4" name="s_img_path4"><input type="button" class="form-control" id="removepicture4" value="-"></div>');
		
	}
	if($('input:file[name="s_img_path5"]').length == 0){

		$('div[name="s_img"]').append('<div class="filebox fb5"><label class="control-label" id="inform_label" style="color:white">매장 사진</label>&nbsp<input type="text" class="upload-name ul5" readonly="readonly">&nbsp<label for="ex_filename5" class="form-control">찾아보기</label>&nbsp<input type="file" id="ex_filename5" class="upload-hidden5" name="s_img_path5"><input type="button" class="form-control" id="removepicture5" value="-"></div>');
		
	}

});
</script>
<script>
// 사진 제거 스크립트
$(document).on('click', '#removepicture1', function(){
    $(this).siblings('.ul1').val(null);
});
$(document).on('click', '#removepicture2', function(){  
    $(this).siblings('.ul2').val(null);
});
$(document).on('click', '#removepicture3', function(){  
    $(this).siblings('.ul3').val(null);
});
$(document).on('click', '#removepicture4', function(){
    $(this).siblings('.ul4').val(null);
});
$(document).on('click', '#removepicture5', function(){
    $(this).siblings('.ul5').val(null);
});
</script>
<script>
// 사진첨부
$(document).ready(function(){
	var fileTarget = $('.fb1 .upload-hidden1');

	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
	});

	var fileTarget2 = $('.fb2 .upload-hidden2');

	fileTarget2.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename2 = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename2 = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.ul2').val(filename2);
	});

	var fileTarget3 = $('.fb3 .upload-hidden3');

	fileTarget3.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename3 = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename3 = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.ul3').val(filename3);
	});


	var fileTarget4 = $('.fb4 .upload-hidden4');

	fileTarget4.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename4 = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename4 = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.ul4').val(filename4);
	});
 

	var fileTarget5 = $('.fb5 .upload-hidden5');

	fileTarget5.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename5 = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename5 = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.ul5').val(filename5);
	});
}); 
</script>
</body>
</html>
<%
	}
		}catch(Exception e){
			e.printStackTrace();
	}
%>