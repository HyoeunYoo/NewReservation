<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.page-title {
	font-size: 30px;
	text-align: center;
	margin: 80px 0 20px;
}

.nav-tabs{
	font-size:14px;
}
/*.nav-tabs > li {
	float: none;
	display: inline-block;
}*/
.nav-tabs > li > a {
	color: #414141;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.nav-tabs > li > a:hover {
	background-color: #ff2424 !important;
	color: #fff !important;
}

.best_thumb {
	display: block;
	margin: 0 auto;
}
.thumbnail {
	border: none;
}
.info {
	font-size: 16px;
	text-align: left;
	margin-top: 10px;
}

/*figure style*/
.snip1273 {
	position: relative;
	float: left;
	/*margin: 10px 1%;*/
	margin-top: 20px;
	min-width: 290px -40px;
	max-width: 290px;
	width: 100%;
	color: #ffffff;
	text-align: left;
	background-color: #000000;
	font-size: 16px;
}
.snip1273 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.3s ease-in;
	transition: all 0.3s ease-in;
}
.snip1273 img {
	position: relative;
	max-width: 100%;
	vertical-align: top;
}
.snip1273 figcaption {
	position: absolute;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	padding: 20px 30px;
}
.snip1273 figcaption:before,
.snip1273 figcaption:after {
	width: 1px;
	height: 0;
}
.snip1273 figcaption:before {
	right: 0;
	top: 0;
}
.snip1273 figcaption:after {
	left: 0;
	bottom: 0;
}
.snip1273 h3,
.snip1273 p {
	line-height: 2em;
}
.snip1273 h3 {
	margin: 0 0 5px;
	font-weight: 700;
	text-transform: uppercase;
}
.snip1273 p {
	font-size: 0.8em;
	font-weight: 500;
	margin: 0 0 15px;
}
.snip1273 a {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	z-index: 1;
}
.snip1273:before,
.snip1273:after,
.snip1273 figcaption:before,
.snip1273 figcaption:after {
	position: absolute;
	content: '';
	background-color: #ffffff;
	z-index: 1;
	-webkit-transition: all 0.4s ease-in;
	transition: all 0.4s ease-in;
	opacity: 0.8;
}
.snip1273:before,
.snip1273:after {
	height: 3px;
	width: 0%;
}
.snip1273:before {
	top: 0;
	left: 0;
}
.snip1273:after {
	bottom: 0;
	right: 0;
}
.snip1273:hover img,
.snip1273.hover img {
	opacity: 0.4;
}
.snip1273:hover figcaption,
.snip1273.hover figcaption {
	opacity: 1;
}
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
	height: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after {
	width: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after,
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
	opacity: 0.1;
}
</style>

<div class="page-title">BEST SHOP</div>

<ul class="nav nav-tabs nav-justified" id="myTab">
	<li role="presentation" class="active">
		<a href="#nail" data-toggle="tab" role="tab">Nail</a>
	</li>
	<li role="presentation">
		<a href="#eyelash" data-toggle="tab" role="tab">Eyelash</a>
	</li>
	<li role="presentation">
		<a href="#waxing" data-toggle="tab" role="tab">Waxing</a>
	</li>
</ul>

<div class="tab-content">

	<!-- nail -->
	<div class="tab-pane active" id="nail" role="tabpanel">
		<div class="row best_thumb">
			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/nail2.png" width="300px" height="200px">
					<figcaption>
						<h3>리가네일</h3>
						<p>서울시 양천구 신정동</p>
						<p>평일 11:00 ~ 21:00 주말 11:00 ~ 20:00 (매주 일요일 휴무)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=12"></a>
				</figure>
			</div>

			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/nail1.png" width="300px" height="200px">
					<figcaption>
						<h3>네일 보니또</h3>
						<p>서울시 동작구 흑석동</p>
						<p>평일/주말 11:00 ~ 21:00 (연중 무휴)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=5"></a>
				</figure>
			</div>

			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/nail3.png" alt="" width="300px" height="200px">
					<figcaption>
						<h3>골든네일</h3>
						<p>서울 강남구 역삼동 838</p>
						<p>평일 11:00 ~ 22:00 주말 11:00 ~ 20:00 (연중 무휴)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=8"></a>
				</figure>
			</div>
		</div>
	</div>

	<!-- eyelash -->
	<div class="tab-pane" id="eyelash" role="tabpanel">
		<div class="row best_thumb">
			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/me2.jpg" alt="" width="300px" height="200px">
					<figcaption>
						<h3>미를 그리다</h3>
						<p>서울 마포구 공덕동 423-29</p>
						<p>11:00 ~ 20:00 (매주 일요일 및 공휴일 휴무)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=11"></a>
				</figure>
			</div>

			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/eye4.png" alt="" width="300px" height="200px">
					<figcaption>
						<h3>YOU & EYE</h3>
						<p>서울 중구 다동 111</p>
						<p>11:00 ~ 20:00 (매주 일요일 및 공휴일 휴무)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=13"></a>
				</figure>
			</div>
			
			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/eye6.png" alt="" width="300px" height="200px">
					<figcaption>
						<h3>보니타 속눈썹</h3>
						<p>서울 강서구 화곡동 377-42</p>
						<p>평일/주말 10:30 ~ 21:00 (매주 일요일 휴무)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=10"></a>
				</figure>
			</div>
		</div>
	</div>
	
	<!-- waxing -->
	<div class="tab-pane" id="waxing" role="tabpanel">
		<div class="row best_thumb">
			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/waxing5.jpg" alt="" width="300px" height="200px">
					<figcaption>
						<h3>GOOD Waxing</h3>
						<p>서울 노원구 중계동 511-3</p>
						<p>평일/주말 10:30 ~ 20:00 (매주 일요일 휴무)</p>
					</figcaption>
					<a href="reserve.jsp?shop_num=9"></a>
				</figure>
			</div>
					
			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/waxing9.jpg" alt="" width="300px" height="200px">
					<figcaption>
						<h3>ZOOT WAXING</h3>
						<p>서울특별시 마포구 동교동 165-8 LG팰리스빌딩 306-2호</p>
						<p>평일/주말 11:00 ~ 21:00 (연중 무휴)</p>
					</figcaption>
					<a href="#"></a>
				</figure>
			</div>

			<div class="col-xs-6 col-md-4">
				<figure class="snip1273">
					<img src="img/waxing2.png" alt="" width="300px" height="200px">
					<figcaption>
						<h3>메리 왁싱</h3>
						<p>서울특별시 광진구 화양동 47-54번지 지층</p>
						<p>평일/주말 11:00 ~ 21:00 (연중 무휴)</p>
					</figcaption>
					<a href="#"></a>
				</figure>
			</div>
			
		</div>
	</div>
</div>

<script>
$('#myTab a').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
	$('#myTab a[href="#nail"]').tab('show') // Select tab by name
	$('#myTab a[href="#eyelash"]').tab('show') // Select tab by name
	$('#myTab a[href="#waxing"]').tab('show') // Select tab by name
})

/* Demo purposes only */
$(".hover").mouseleave(
	function () {
		$(this).removeClass("hover");
	}
);
</script>