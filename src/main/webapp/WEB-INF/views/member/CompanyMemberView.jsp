<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<c:set var="path" value="${pageContext.request.contextPath}">
</c:set>

<meta charset="utf-8">
<title>매물 보여주기</title>
</head>
<script src="${path}/resources/jquery.js"></script>
<script type="text/javascript">
  
  
  $(function() {
	$(".desc").click(function(){
		$.ajax({
		type:"get",
		async : true,
		url :"${path}/ItemList.do",
		data:{keyword:value},
		success : function(value,textStatus){
		alert('전송 성공'+value);
		},
		error : function(value,textStatus){		
		
		}
		})
	})  
  });
  </script>
<body>

	<div class="container" style="padding-left: 10%">
		<div class="">
			<h5>
				<b><a href="ItemInsert.do"
					style="color: black; display: inline-block; margin: 0 0 0 75%;">매물
						등록</a></b>
			</h5>
		</div>
		<h1>
			<b>중개사무소 찾기</b>
		</h1>
		<br>
		<!-- 좋아요 많은 중개소 -->

		<div class="">
			<div class="" style="margin: 0 0 0 65%;">

				<h5>
					<b><a href="#" class="desc" style="color: black;" value="aa">추천순</a></b>
					&nbsp; <b><a href="#" class="desc" style="color: black;">최신순</a></b>
					&nbsp; <b><a href="#" class="desc" style="color: black;">매물순</a></b>
				</h5>
			</div>
			<table class="table table-hover"
				style="width: 20%; height: 100%; display: inline-block;">
				<tr>
					<td style="height: 150px;"><img src=""></td>
				</tr>
				<tr>
					<td style="width: 20%;">대표자</td>
				</tr>
				<tr>
					<td style="width: 20%;">주소</td>
				</tr>
				<tr>
					<td style="width: 20%;"><span>보유 매물 (매:0/전:0/월:0)</span> <span
						style="margin: 0 0 0 10%"></span> <input type="button"
						class="btn btn-primary" value="매물 보기"
						onclick="javascript:location.href='ItemSelect.do'"
						style="margin-left: 15%"></td>
				</tr>
			</table>

			<table class="table table-hover"
				style="width: 20%; height: 100%; display: inline-block;">
				<tr>
					<td style="height: 150px;">사진</td>
				</tr>
				<tr>
					<td style="width: 20%;">대표자</td>
				</tr>
				<tr>
					<td style="width: 20%;">주소</td>
				</tr>
				<tr>
					<td style="width: 20%;"><span>보유 매물 (매:0/전:0/월:0)</span> <span
						style="margin: 0 0 0 10%"></span> <input type="button"
						class="btn btn-primary" value="매물 보기"
						onclick="javascript:location.href='ItemSelect.jsp'"
						style="margin-left: 15%"></td>
				</tr>
			</table>

			<table class="table table-hover"
				style="width: 20%; height: 100%; display: inline-block;">
				<tr>
					<td style="height: 150px;">사진</td>
				</tr>
				<tr>
					<td style="width: 20%;">대표자</td>
				</tr>
				<tr>
					<td style="width: 20%;">주소</td>
				</tr>
				<tr>
					<td style="width: 20%;"><span>보유 매물 (매:0/전:0/월:0)</span> <span
						style="margin: 0 0 0 10%"></span> <input type="button"
						class="btn btn-primary" value="매물 보기"
						onclick="javascript:location.href='ItemSelect.jsp';"
						style="margin-left: 15%"></td>
				</tr>
			</table>

			<table class="table table-hover"
				style="width: 20%; height: 100%; display: inline-block;">
				<tr>
					<td style="height: 150px;">사진</td>
				</tr>
				<tr>
					<td style="width: 20%;">대표자</td>
				</tr>
				<tr>
					<td style="width: 20%;">주소</td>
				</tr>
				<tr>
					<td style="width: 20%;"><span>보유 매물 (매:0/전:0/월:0)</span> <span
						style="margin: 0 0 0 10%"></span> <input type="button"
						class="btn btn-primary" value="매물 보기"
						onclick="javascript:location.href='ItemSelect.html'"
						style="margin-left: 15%"></td>
				</tr>
			</table>
		</div>
		<!-- 검색 -->
		<table class="table" style="width: 80%;">
			<tr>
				<td><select class="" name="" style="width: 20%; height: 40px;">
						<option value="">전체</option>
						<option value="">주거전문</option>
						<option value="">상업전문</option>
				</select> <input type="text" style="width: 67%; height: 40px;"
					placeholder="지역명을 입력하세요."> <input type="button"
					class="btn btn-primary" style="width: 10%; height: 40px;"
					value="검색"></td>
			</tr>
		</table>

		<h4>서울 특별시 서초구에 대한 중개사무소 검색결과 입니다.</h4>

		<c:forEach var="item" items="${list}">
			<table class="table table-hover" style="width: 80%">
				<tr>
					<td rowspan="4" style="width: 30%;">사진</td>
				</tr>
				<tr>
					<td style="width: 70%;">${item.name}</td>
				</tr>
				<tr>
					<td style="width: 70%;">${item.address}</td>
				</tr>
				<tr>
					<td style="width: 70%;"><span>보유 매물 (매: 0 / 전: 0 /월 :
							0)</span> <span style="margin: 0 0 0 40%"></span> <input type="button"
						class="btn btn-primary" value="매물 보기"
						onclick="javascript:location.href='ItemSelect.html'"></td>
				</tr>
			</table>
		</c:forEach>

		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="4" style="width: 30%;">사진</td>
			</tr>
			<tr>
				<td style="width: 70%;">대표자</td>
			</tr>
			<tr>
				<td style="width: 70%;">주소</td>
			</tr>
			<tr>
				<td style="width: 70%;"><span>보유 매물 (매: 0 / 전: 0 /월 : 0)</span>
					<span style="margin: 0 0 0 40%"></span> <input type="button"
					class="btn btn-primary" value="매물 보기"
					onclick="javascript:location.href='ItemSelect.html'"></td>
			</tr>
		</table>
	</div>
	<div class="text-center ">
		<ul class="pagination">
			<c:forEach var="count" begin="1" end="${pageNum}">
				<li><a href="#">이전</a></li>
				<li><a href="./CompanyMemberView.do&pg=${count}">${count}</a></li>
				<li><a href="#">다음</a></li>
			</c:forEach>
		</ul>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
