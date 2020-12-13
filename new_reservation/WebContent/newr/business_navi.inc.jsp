<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.business_ui{
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: white;
    border-right: 1px solid lightgray;
}

.business_li {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
}

.business_active {
    background-color: red;
    color: white;
    text-align: center;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.business_li:hover:not(.active) {
    background-color: red;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.high {
    height: auto;
}
</style>
</head>
<body>

<ul class="business_ui high">
	<li class="text-center" style="font-weight: bold; font-size: 20px; margin-top: 30px; margin-bottom: 10px;">마이페이지</li>

    <li><a href="business_mypage1.jsp" class="business_li">기본정보수정</a></li>
    <li><a href="business_mypage2.jsp" class="business_li">매장정보수정</a></li>
    <li><a href="business_mypage3.jsp" class="business_li">시술정보수정</a></li>
<!--     <li><a href="business_mypage4.jsp" class="business_li">스케줄정보수정</a></li> -->
    <li><a href="business_history_.jsp" class="business_li">예약내역</a></li>
<!--     <li><a href="" class="business_li">블랙리스트</a></li> -->
    <li><a href="business_contract.jsp" class="business_li">계약</a></li>
    <li><a href="business_leave.jsp" class="business_li">회원탈퇴</a></li>
</ul>