<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
$("#checkJson").click(function(){
var member = {id:"pack",
name:"박지성"	,
pwd:"1234",
email:"pack@test.com"};
$.ajax({type:"post",
	url:"${contextPath}/item/test.do",
	contentType: "application/json",
	data : JSON.stringify(member),
	success:function (data,textStatus){
	},
	error:function(data,textStatus){
		alert("에러가 발생했습니다.");
	},
	complete:function(data,textStatus){
	}
	});
});
});

</script>
</head>
<body>
	<input type="button" id="checkJson" value="회원정보 보내기" />
	<br>
	<br>
	<div id="output"></div>
</body>
</html>