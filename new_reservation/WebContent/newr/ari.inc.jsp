<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.tab {
    position:fixed;
    right:0px;
    height:5px;
    padding: 0;
    margin: 0;
    bottom: 0;
}

.tab td {
    font-size:9pt;
}

.tab ul {
    list-style-type: none;
    padding:0;
    margin:0;
}

.tab ul li a {
    color:#666;
    text-decoration:none;
}

.a {
 width:82px;
}
</style>


<script>
// 오른쪽 퀵메뉴 여닫기
function go_top(orix,oriy,desx,desy) {
    var Timer;
    if (document.body.scrollTop == 0) {
        var winHeight = document.documentElement.scrollTop;
    } else {
        var winHeight = document.body.scrollTop;
    }
    if(Timer) clearTimeout(Timer);
    startx = 0;
    starty = winHeight;
    if(!orix || orix < 0) orix = 0;
    if(!oriy || oriy < 0) oriy = 0;
    var speed = 7;
    if(!desx) desx = 0 + startx;
    if(!desy) desy = 0 + starty;
    desx += (orix - startx) / speed;
    if (desx < 0) desx = 0;
    desy += (oriy - starty) / speed;
    if (desy < 0) desy = 0;
    var posX = Math.ceil(desx);
    var posY = Math.ceil(desy);
    window.scrollTo(posX, posY);
    if((Math.floor(Math.abs(startx - orix)) < 1) && (Math.floor(Math.abs(starty - oriy)) < 1)){
        clearTimeout(Timer);
        window.scroll(orix,oriy);
    }else if(posX != orix || posY != oriy){
        Timer = setTimeout("go_top("+orix+","+oriy+","+desx+","+desy+")",15);
    }else{
        clearTimeout(Timer);
    }
}

$(function () {
    $('#scrollToBottom').bind("click", function () {
        $('html, body').animate({ scrollTop: $(document).height() }, 1200);
        return false;
    });
    
});
</script>

<body>
<div id="container">
	<div class="sub_content">
	
		<!-- 메뉴 -->
		<div class="quick_menu">
			<table class="tab" cellspacing=0 cellpadding=0>
				<tr>
					<td width=120></td>
					<td bgcolor=silver width=30>
					<ul>
						<li><a style="cursor: pointer; margin-left:5px;font-size: 21px;color:white;"><span class="glyphicon glyphicon-chevron-up" onclick="go_top();"></span></a></li>
					</ul>
					</td>
				</tr>
				 
				 
				<tr>
					<td width=120></td>
					<td bgcolor=silver width=30>
					<ul>
						<li><a style="cursor: pointer; margin-left:5px;font-size: 21px;color:white;"><span class="glyphicon glyphicon-chevron-down" id="scrollToBottom"></span></a></li>
					</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
