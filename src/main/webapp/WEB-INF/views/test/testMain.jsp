<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${path}/resources/jquery.js"></script>
<script>
/* $(function(){
$("#btn").click(function(){
	$.ajax({
		type:"DELETE",
		url:"${path}/test/${pg}",
		success:function(data,textStatus){
			alert("성공");
			alert(data);
			
		},
		error:function(data,textStatus){
			alert("에러발생");
		},
		complete:function(){
		}
	});
});
}); */
var txt = document.getElementById('search_text').value;
$(function(){
	$("#search_btn").click(function(){
		var forms = $("#search_form")
	$.ajax({
		type:"GET",
		url:"${path}/test/testMain",
		data:forms,
		success:function(data,textStatus){
			alert("성공");
			alert(data);
		},
		error:function(data,textStatus){
			alert("오류");
		},
		complete:function(){
			
		}
	});
	});
});
</script>
<body>
<h1>게시판</h1>
<form action ="" id="search_form">
<input type="text" id="search_text" placeholder="검색어 입력">
<input type="button" id="search_btn" value="검색">
</form>
</body>
</html>