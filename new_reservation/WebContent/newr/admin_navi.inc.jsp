<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.board_ui{
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: white;
    border-right: 1px solid lightgray;
}

.board_li {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
}

.board_active {
    background-color: red;
    color: white;
    text-align: center;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.board_li:hover:not(.active) {
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

<ul class="board_ui high">
	<li class="text-center" style="font-weight: bold; font-size: 20px; margin-top: 30px; margin-bottom: 10px;">사업자 회원 관리</li>
	<li><a href="admin_contract.jsp" class="board_li">사업자 계약관리</a></li>
	
	<li class="text-center" style="font-weight: bold; font-size: 20px; margin-top: 30px; margin-bottom: 10px;">고객센터 관리</li>
    <li><a href="admin_faq.jsp" class="board_li">FAQ 관리</a></li>
    <li><a href="admin_1to1.jsp" class="board_li">1:1 문의 관리</a></li>
</ul>