<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.navi {
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 5px 0;
}
.main_search {
	padding-top: 3px;
}


li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    background-color: white;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    position: absolute;
    vertical-align: top;
    padding: 20px;
    text-align: left;
    margin-left: auto;
    margin-right: auto;
    white-space: nowrap;
}

.dropdown-content a {
    color: black;
    padding: 1px 1px;
    text-decoration: none;
    display: inline;
    text-align: left;
}



.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown-content-inner > div {
    width: 33%;
    float: left;
    padding: 0 2em 0;
}

.dropdown-content-inner{
    width: 90%;
    max-width: 70em;
    margin: 0 auto;
    padding: 0 1.875em;
}

.nav-column {
	float: left;
	width: 33%;
	padding: 4%;
}

.nav-column h3 {
	margin: 20px 0 10px 0;
	line-height: 18px;
	font-weight: bold;
	font-size: 15px;
	color: #372f2b;
}

.nav-column li a {
	line-height: 26px;
	font-size: 13px;
	color: #888888;
	text-align: center;
	margin-left:5px;
}

.nav-column li a:hover {
	color: pink;
}
</style>

<nav class="navbar navbar-default navbar-static-top navi">
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="searchNailShop.jsp">NAIL</a></li>
			<li><a href="searchEyelashShop.jsp">EYELASH</a></li>
			<li><a href="searchWaxingShop.jsp">WAXING</a></li>

			<!-- 바로가기 -->
			<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">Search</a>
			    <div class="dropdown-content" >
				    <div class="dropdown-content-inner" style="margin-left: -10px;">
					    
						<div class="nav-column">
							<h3>지역별 바로 검색</h3>
							<ul>
								<li><a href="#">강남구</a></li>
								<li><a href="#">종로구</a></li>
								<li><a href="#">중구</a></li>
								<li><a href="#">마포구</a></li>
								<li><a href="#">용산구</a></li>
								<li><a href="#">성동구</a></li>
								<li><a href="#">광진구</a></li>
							</ul>
						</div>
				    </div>
			    </div>
		    </li>
		    <!-- 바로가기 끝 -->
		</ul>

		<!-- 검색창 -->
		<ul class="nav navbar-nav pull-right main_search">
			<li><input type="text" class="form-control" placeholder="Search"></li>
			<li><button class="btn btn-default" type="button" OnClick="window.location='search.jsp'"><span class="glyphicon glyphicon-search"></span></button></li>
		</ul>
	</div>
</nav>