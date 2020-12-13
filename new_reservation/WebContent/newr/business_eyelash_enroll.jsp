<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
#inform_180 {
	width: 180px;
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
.sg_after {
	margin-left: -15px;
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
				<h3>시술정보 등록 - EYELASH</h3>
			</div>

			<form action="insertStaff2.jsp" method="post" class="form-horizontal">

				<div class="form-inline" id="inform">
					<label class="control-label" id="inform_label">직원 추가</label>
					<input id="inform_180" type="text" class="form-control" placeholder="이름을 입력해주세요." style="margin:3px" name="staff_name">
					<input type="button" class="btn btn-default" value="확인" onclick="staff_add()">	
				</div>
				
			
				<div class="form-inline" id="inform">
					<input type="hidden" name="sg_before">

				</div>
				
				<br>
				<div class="container sm_button">
					<input type="submit" class="btn btn-default pull-right sm_button" value="등록하기">
				</div>
			</form>

		</div><!-- col-md-9 끝 -->
	</div><!-- row 끝 -->
</div>


<jsp:include page="footer.inc.jsp" flush="false"/>
<jsp:include page="ari.inc.jsp" flush="false"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ebban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
var count = 0;

var add1_count = 10;
var	add2_count = 20;
var	add3_count = 30;
var	add4_count = 40;
var	add5_count = 50;



// 직원추가
function staff_add(){
	if(count > 4){
		count = 0;	
	}
	count++;

	var a = $('input[name="staff_name"]').val();
	var b = $('input[id="lastCount"]').length;
	var check = $('div[name=removecheck'+count+']').length;

	if (a) {
		// alert(a);

		if(b < 5) {
			if(check == 0){	
				$('input[name="sg_before"]').before('<div class="container sg_after" name="removecheck'+count+'"><div class="container sg_after"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px" name="staff_names'+count+'">'+a+'</label><input type="hidden" name="staff_names'+count+'" value="'+a+'"><input id="inform_200" type="text" class="form-control" name="sg_detail'+count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+count+'()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="+" onclick="surgery_add'+count+'()"><input type="hidden" class="form-control" name="last'+count+'" id="lastCount"></div></div>');
				document.getElementById('inform_180').value = null;
			} else {
				staff_add();
			}

		} else{
			alert('더이상 추가할 수 없습니다.')
		}
	} else {
		alert('직원이름을 입력해주세요.');
		$('input[name="staff_name"]').focus();
	}
	
}

// 상세시술 추가
function surgery_add1(){
	if(add1_count >= 14){
		add1_count = 10;	
	}
	add1_count++;

	var detail = $('input[name="last1"]').length;
	var check = $('div[name=sg'+add1_count+']').length;


	if(detail < 5){
		if(check == 0){
			$('label[name="staff_names1"]').parent().parent().append('<div class="container sg_after" name=sg'+add1_count+' id="r1_check"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px"></label><input id="inform_200" type="text" class="form-control" name="sg_detail'+add1_count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+add1_count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+add1_count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+add1_count+'()"><input type="hidden" class="form-control" name="last1"></div>');
		} else {
			surgery_add1();
		}
	} else {
		alert('최대 5개까지 추가 가능합니다.')
	}
}

function surgery_add2(){
	if(add2_count >= 24){
		add2_count = 20;	
	}
	add2_count++;

	var detail = $('input[name="last2"]').length;
	var check = $('div[name="sg2'+add2_count+'"]').length;

	if(detail < 5){
		if(check == 0){
			$('label[name="staff_names2"]').parent().parent().append('<div class="container sg_after" name=sg2'+add2_count+' id="r2_check"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px"></label><input id="inform_200" type="text" class="form-control" name="sg_detail'+add2_count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+add2_count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+add2_count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+add2_count+'()"><input type="hidden" class="form-control" name="last2"></div>');
		} else {
			surgery_add2();
		}
	} else {
		alert('최대 5개까지 추가 가능합니다.')
	}
}
function surgery_add3(){
	if(add3_count >= 34){
		add3_count = 30;	
	}
	add3_count++;

	var detail = $('input[name="last3"]').length;
	var check = $('div[name=sg3'+add3_count+']').length;

	if(detail < 5){
		if(check == 0){	
			$('label[name="staff_names3"]').parent().parent().append('<div class="container sg_after" name=sg3'+add3_count+' id="r3_check"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px"></label><input id="inform_200" type="text" class="form-control" name="sg_detail'+add3_count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+add3_count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+add3_count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+add3_count+'()"><input type="hidden" class="form-control" name="last3"></div>');
		} else {
			surgery_add3();			
		}
	} else {
		alert('최대 5개까지 추가 가능합니다.')
	}
}

function surgery_add4(){
	if(add4_count >= 44){
		add4_count = 40;	
	}
	add4_count++;

	var detail = $('input[name="last4"]').length;
	var check = $('div[name=sg4'+add4_count+']').length;

	if(detail < 5){
		if(check == 0){
			$('label[name="staff_names4"]').parent().parent().append('<div class="container sg_after" name=sg4'+add4_count+' id="r4_check"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px"></label><input id="inform_200" type="text" class="form-control" name="sg_detail'+add4_count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+add4_count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+add4_count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+add4_count+'()"><input type="hidden" class="form-control" name="last4"></div>');
		} else {
			surgery_add4();
		}
	} else {
		alert('최대 5개까지 추가 가능합니다.')
	}
}

function surgery_add5(){
	if(add5_count >= 54){
		add5_count = 50;	
	}
	add5_count++;

	var detail = $('input[name="last5"]').length;
	var check = $('div[name=sg5'+add5_count+']').length;

	if(detail < 5){
		if(check == 0){
			$('label[name="staff_names5"]').parent().parent().append('<div class="container sg_after" name=sg5'+add5_count+' id="r5_check"><label class="control-label staff_count" id="inform_label" style="margin-right:-32px"></label><input id="inform_200" type="text" class="form-control" name="sg_detail'+add5_count+'" placeholder="상세 시술명" style="margin:3px">&nbsp;<select class="form-control" id="inform_120" name="sg_time'+add5_count+'"><option>::소요시간::</option><option>00:30:00</option><option>01:00:00</option><option>01:30:00</option><option>02:00:00</option><option>02:30:00</option><option>03:00:00</option></select>&nbsp;<input id="inform_80" type="text" class="form-control" name="sg_price'+add5_count+'" placeholder="가격"> 원&nbsp;&nbsp;&nbsp;<input type="button" class="form-control" value="-" onclick="surgery_remove'+add5_count+'()"><input type="hidden" class="form-control" name="last5"></div>');
		} else {
			surgery_add5();
		}
	} else {
		alert('최대 5개까지 추가 가능합니다.')
	}
}
function surgery_remove11() {
	$('div[name="sg11"]').remove();
}
function surgery_remove12() {
	$('div[name="sg12"]').remove();
}
function surgery_remove13() {
	$('div[name="sg13"]').remove();
}
function surgery_remove14() {
	$('div[name="sg14"]').remove();
}

function surgery_remove21() {
	$('div[name="sg221"]').remove();
}
function surgery_remove22() {
	$('div[name="sg222"]').remove();
}
function surgery_remove23() {
	$('div[name="sg223"]').remove();
}
function surgery_remove24() {
	$('div[name="sg224"]').remove();
}

function surgery_remove31() {
	$('div[name="sg331"]').remove();
}
function surgery_remove32() {
	$('div[name="sg332"]').remove();
}
function surgery_remove33() {
	$('div[name="sg333"]').remove();
}
function surgery_remove34() {
	$('div[name="sg334"]').remove();
}

function surgery_remove41() {
	$('div[name="sg441"]').remove();
}
function surgery_remove42() {
	$('div[name="sg442"]').remove();
}
function surgery_remove43() {
	$('div[name="sg443"]').remove();
}
function surgery_remove44() {
	$('div[name="sg444"]').remove();
}

function surgery_remove51() {
	$('div[name="sg551"]').remove();
}
function surgery_remove52() {
	$('div[name="sg552"]').remove();
}
function surgery_remove53() {
	$('div[name="sg553"]').remove();
}
function surgery_remove54() {
	$('div[name="sg554"]').remove();
}

// 직원 삭제
function surgery_remove1(){
	var rm = $('div[id=r1_check]').length;
	
	if(rm != 0) {
		$('input[name=sg_detail1]').val(null);
		$('input[name=sg_price1]').val(null);	
		$('select[name=sg_time1]').val('::소요시간::').prop("selected", true);
	} else {
		$('div[name=removecheck1]').remove();
	}
}

function surgery_remove2(){
	var rm = $('div[id=r2_check]').length;
	
	if(rm != 0) {
		$('input[name=sg_detail2]').val(null);
		$('input[name=sg_price2]').val(null);	
		$('select[name=sg_time2]').val('::소요시간::').prop("selected", true);
	} else {
		$('div[name=removecheck2]').remove();
	}
}

function surgery_remove3(){
	var rm = $('div[id=r3_check]').length;
	
	if(rm != 0) {
		$('input[name=sg_detail3]').val(null);
		$('input[name=sg_price3]').val(null);	
		$('select[name=sg_time3]').val('::소요시간::').prop("selected", true);
	} else {
		$('div[name=removecheck3]').remove();
	}
}

function surgery_remove4(){
	var rm = $('div[id=r4_check]').length;
	
	if(rm != 0) {
		$('input[name=sg_detail4]').val(null);
		$('input[name=sg_price4]').val(null);	
		$('select[name=sg_time4]').val('::소요시간::').prop("selected", true);
	} else {
		$('div[name=removecheck4]').remove();
	}
}

function surgery_remove5(){
	var rm = $('div[id=r5_check]').length;
	
	if(rm != 0) {
		$('input[name=sg_detail5]').val(null);
		$('input[name=sg_price5]').val(null);	
		$('select[name=sg_time5]').val('::소요시간::').prop("selected", true);
	} else {
		$('div[name=removecheck5]').remove();
	}
}
</script>
</body>
</html>	