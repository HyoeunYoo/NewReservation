<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
/*인기,후기,최신순*/
.align > .nav > li {
	font-size: 12px;
	float: right;
	margin-bottom: 15px;
}
.align > .nav > li > a {
	padding: 0;
	margin-right: 10px;
	color: gray;
}
.align > .nav > li > a:hover{
	color: black;
	background-color: white;
}

/*결과썸네일*/
.search_thumb {
	margin-bottom: 30px;
}
.thumbnail {
	border: none;
}
.info {
	font-size: 16px;
	text-align: left;
	margin-top: 10px;
}
.detail {
	font-size: 12px;
	margin-top: 10px;
}
</style>

<div class="page-header">
	<h3>검색결과</h3>
</div>