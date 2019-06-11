<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${path}/resources/jquery.js"></script>
<script>
	var cnt=0;
/* function fu(){
var value = document.frmkeyword.textKeyword.value;
alert(value);
$.ajax({
	type:"post",
	async:"true",
	data:{keyword:value},
	url:"${path}/test/testValResult",
	success:function(data,textStatus){
		alert("성공");
		
	},
	error:function(data,textStatus){
		alert("실패");
	},
	complete:function(){
		alert("완료");
	}
});
} */

$(function(){
$("# ").submit(function(){
	
})	
})

function fa(){
	if(cnt ==0){
	$("#pk").append("<br>"+"<input type='file' name='mainImage' />");
	}
	else {
	$("#pk").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	}
	cnt++;
}
</script>
<body>

<!-- <form name="frmkeyword" action="">
<input type="text" name="textKeyword" onkeyup="fu();">
<input type="submit" value="전송">
</form>
 -->
 <form>	
 
<input type="button" value="파일 추가" onclick="fa();">
<div id="pk"></div>
<input type="file" >
 </form>

</body>
</html>