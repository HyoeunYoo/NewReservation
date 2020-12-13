<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
footer {
	width: 100%;
	margin-top: 80px;
	padding-top: 30px;
	padding-bottom: 30px;
	background-color: #eee;
	vertical-align: middle;
	color: gray;
	line-height: 30px;
}
.footer {
	width: 940px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.footer_title, .footer_index {
	font-weight: bold;
}
.footer_info, .footer_index {
	font-size: 12px;
}
.footer_margin {
	margin-left: 7px;
}

.copyright {
	min-height: 40px;
	background-color: #d6d6d6;
	bottom: 0;
}
.copyright p {
	font-size: 12px;
	text-align: left;
	color: #fff;
	margin-bottom: 0;
	padding: 10px 0;
}
.bottom_ul {
	color: #fff;
	font-size: 12px;
	float: right;
	margin-bottom: 0;
}
.bottom_ul > li {
	list-style-type: none;
	float: left;
	line-height: 40px;
}
.bottom_ul > li:after {
	content: "/";
	margin-right: 8px;
	margin-left: 8px;
}
.footer_info > a {
	color: black;
	text-decoration: none;
}

.bottom_ul > li > a {
	color: white;
	text-decoration: none;
}
</style>

<footer>
	<div class="row footer">
		<!-- <div class="col-md-4">
			<div class="footer_title">CALL CENTER</div>
			<div><span class="footer_index">1666-3166</span></div>
			<div><span class="footer_index">OPEN </span><span class="footer_info">am 09:00 - pm 06:00</span></div>
			<div><span class="footer_index">LUNCH </span><span class="footer_info">pm 01:00 - pm 02:00</span></div>
			<div><span class="footer_index">OFF </span><span class="footer_info">Sat, Sun, Holiday</span></div>
			<div><span class="footer_index">문의사항은 1대 1 문의게시판을 이용바랍니다.</span></div>
		</div> -->

		<div class="col-md-4">
			<div class="footer_title">BANK INFO</div>
			<div>
				<span class="footer_index">농협</span> <span class="footer_info">355-0016-2587-83</span>
				<span class="footer_index">신한</span> <span class="footer_info">140-009-507875</span>
			</div>
			<div>
				<span class="footer_index">국민</span> <span class="footer_info">229337-04-000997</span>
				<span class="footer_index">우리</span> <span class="footer_info">1005-301-979888</span>
			</div>
			<div><span class="footer_index">예금주</span> <span class="footer_info">NEWR</span></div>
		</div>

		<div class="col-md-8">
			<div class="footer_title">COMPANY INFO</div>
			<div>
				<span class="footer_index">Company</span> <span class="footer_info">NEW Reservation</span>
				<span class="footer_index footer_margin">Company License</span> <span class="footer_info">467-87-00183</span>
			</div>
			<div>
				<span class="footer_index">통신판매업 신고</span> <span class="footer_info">2017-서울강남-00885</span> <span class="footer_info"><a href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2016322016230200885&area1=&area2=&currpage=1&searchKey=04&searchVal=4678700183&stdate=&enddate=" target="_blank" style="color: gray;">[사업자정보확인]</a></span>
			</div>
			<div>
				<span class="footer_index">Address</span> <span class="footer_info">서울특별시 성동구 살곶이길 200</span>
				<span class="footer_index footer_margin">WebMaster</span> <span class="footer_info">개인정보관리책임자</span> <span class="footer_info"><a href="mailto:{$cpo_email}" style="color: gray;"> 5조(NEWR@naver.com)</a></span>
			</div>
		</div>
	</div>
</footer>

<div class="copyright">
	<div class="footer">
		<div class="col-md-6">
			<p>© 2017 NEW Reservation All rights reserved</p>
		</div>
		<div class="col-md-6">
			<ul class="bottom_ul">
				<li><a href="#">Home</a></li>
				<li><a href="#">Terms of Use</a></li>
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Guide</a></li>
			</ul>
		</div>
	</div>
</div>