<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<style>
#custom_leave_form {
	width: 80%;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#inform_200 {
	width: 200px;
}

.b_pwd_input, .b_pwd_btn {
	margin-top: 20px;
	float: left;
}
.custom_leave_align {
	width: 315px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>


<div class="page-header">
	<h3>회원탈퇴</h3>
</div>

<form action="deleteBusinessPro.jsp" method="post" class="form-horizontal">
	<div class="agreeArea">
		<div class="agree">
				<h6 align="left">
				<strong>NEW RESERVATION 회원 탈퇴가 완료되면 회원님의 개인정보는 즉시 삭제됩니다.</strong><br><br>
				회원 탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며,<br><br>
				재 가입은 탈퇴일로부터 24시간 후에 가능하고 탈퇴한 id는 재사용이 불가합니다.<br><br>
				<strong>회원 탈퇴 전에 아래 사항을 반드시 확인해 주시기 바랍니다.</strong><br><br>
				회원탈퇴를 하시게 되면 NEWR 에서 제공하는 모든 회원 서비스를 이용할 수 없습니다.<br><br>
				기존 id 및 결제 내역, 쿠폰은 모두 소멸되어 이용하실 수 없으며, 결제내역은 환불되지 않습니다.
				</h6>
		</div>
		
		<p class="check">위 사항에 동의하십니까? <input type="checkbox" id="leave_agree"><label>동의함</label></p>
	</div>


	<div class="container" id="custom_leave_form">
		<div class="container custom_leave_align">
			<input type="password" placeholder="비밀번호를 입력해주세요." class="form-control b_pwd_input" id="inform_200" name="passwd">
			<input type="submit" class="btn btn-default b_pwd_btn" value="탈퇴하기">
		</div>
	</div>

</form>

<script>
$('.c_pwd_btn').click(function(){
	if($('input:checkbox[id="leave_agree"]').is(":checked") == false) {
		alert('이용약관에 동의해주세요.');
		return false;
	}
});
</script>