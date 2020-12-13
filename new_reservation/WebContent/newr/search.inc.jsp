<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
.search {
	border-bottom: 1px solid;
	border-top: 1px solid;
	padding: 20px 0;
}
.condition {
	background-color: #eee;
	padding: 3px 5px;
	margin-top: 3px;
}
.remove {
	color: black;
}
</style>

<!-- <div class="input-group">
	<input type="text" id="serachbox" class="search-query form-control" placeholder="검색어를 입력하세요" />
	<span class="input-group-btn">
		<button class="btn btn-danger" type="button">
		<span class=" glyphicon glyphicon-search"></span>
		</button>
	</span>
</div> -->

<form class="form-horizontal search" action="searchShop.jsp">
	<div class="form-group">
		<label class="col-sm-2 control-label">시술종류</label>
		<div class="col-sm-10">
			<label class="radio-inline">
				<input type="radio" id="inlineCheckbox1" value="1" name="shop_kind"> 네일
			</label>
			<label class="radio-inline">
				<input type="radio" id="inlineCheckbox2" value="2" name="shop_kind"> 속눈썹
			</label>
			<label class="radio-inline">
				<input type="radio" id="inlineCheckbox3" value="3" name="shop_kind"> 왁싱
			</label>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">매장명</label>
		<div class="col-sm-10">
			<div class="form-inline">
				<input type="text" class="form-control" name="shop_name">
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">지역</label>
		<div class="col-sm-10">
			<div class="form-inline">
				<input type="text" class="form-control" name="shop_addr1" placeholder="ex) 성동구">		
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">시간대</label>
		<div class="col-sm-10">
			<div class="form-inline">
				<select class="form-control">
					<option>시</option>
					<option>11</option>
					<option>12</option>
					<option>13</option>
					<option>14</option>
					<option>15</option>
					<option>16</option>
					<option>17</option>
					<option>18</option>
					<option>19</option>
					<option>20</option>
				</select>
				:
				<select class="form-control">
					<option>분</option>
					<option>00</option>
					<option>30</option>
				</select>
				~
				<select class="form-control">
					<option>시</option>
					<option>11</option>
					<option>12</option>
					<option>13</option>
					<option>14</option>
					<option>15</option>
					<option>16</option>
					<option>17</option>
					<option>18</option>
					<option>19</option>
					<option>20</option>
				</select>
				:
				<select class="form-control">
					<option>분</option>
					<option>00</option>
					<option>30</option>
				</select>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">해시태그</label>
		<div class="col-sm-10">
			<div class="form-inline">
				<input type="text" class="form-control" placeholder="#검색어" value="" name="shop_hasy_content">
				
			</div>
		</div>
	</div>

	<div class="text-center">
		<input type="submit" class="btn btn-default" value="검색" style="width: 85%;">
	</div>
</form>