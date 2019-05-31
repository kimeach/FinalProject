<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>매물 조회하기</title>
<style>
a {
	color: black;
}
</style>
</head>
<body>
	<div class="container" style="padding-left: 10%;">
		<h1>매물 조회</h1>
		<div class="search">
			<table class="table" style="width: 80%">
				<tr>
					<td><span style="margin-right: 3%">거래종류 :</span> <select
						class="" name="" style="width: 100px">
							<option value="">전체</option>
							<option value="">매매</option>
							<option value="">전세</option>
							<option value="">월세</option>
					</select> <br> <span style="margin-right: 7%"> 주소 : </span> <input
						type="text" id="sample5_address" placeholder="주소"
						style="width: 200px"> &nbsp; &nbsp; <input type="button"
						onclick="sample5_execDaumPostcode()" class="btn btn-primary"
						value="주소검색"><br>
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

						<span style="margin-right: 7%"> 가격 : </span> <input type="text"
						name="" value="" style="width: 60px"> 만원 ~ <input
						type="text" name="" value="" style="width: 60px"> 만원
					<td rowspan="2" colspan="2"><input type="button" name=""
						class="btn btn-primary" value="검색"
						style="width: 100px; height: 50px; margin: 5% 0 0 35%;"></td>
				</tr>
			</table>
		</div>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>

		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="#">사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#"> 지역명 </a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="#">서초구 잠원동 , 15 / 15 층 |
						공급면적 101㎡ 전용면적 84㎡</a></td>
			</tr>
		</table>

	</div>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">이전</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
