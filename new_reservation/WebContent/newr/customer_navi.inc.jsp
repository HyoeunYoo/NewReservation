<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.customer_ui{
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: white;
    border-right: 1px solid lightgray;
}

.customer_li {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
}

.customer_active {
    background-color: red;
    color: white;
    text-align: center;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.customer_li:hover:not(.active) {
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

<ul class="customer_ui high">
	<li class="text-center" style="font-weight: bold; font-size: 20px; margin-top: 30px; margin-bottom: 10px;">마이페이지</li>

    <li><a href="" class="customer_li">정보수정</a></li>
    <li><a href="customer_history.jsp" class="customer_li">예약내역</a></li>
    <li><a href="review_list.jsp" class="customer_li">후기</a></li>
    <li><a href="customer_leave.jsp" class="customer_li">회원탈퇴</a></li>
</ul>