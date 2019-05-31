<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function ajaxExample(){
var userid = $("#userId").val();

var checkboxValues = [];
$("input[name='hobby']:checked").each(function(i)){
	
});


var allDate = {"userId": userId, "checkArray": checkboxValues};

$.ajax({
url:"goUrl.do",
type='GET',
data: allData,
success:function(data){
	alert('완료');
	window.opener.loaction.reload();
	self.close();
	
	
},
error:function(jqXHR, textStatus, errorThrown){
	alert("에러 발생 ~~\n"+ textStatus+":"+errorThrown);
	self.close();	
}
});

</script>

<body>
	<form action="" onsubmit="ajaxExample();">
		<h1>메인화면입니다.</h1>
		<input type="hidden" id="userId" value="abcd"> <input
			type="checkbox" name="hobby" value="독서"> <input
			type="checkbox" name="hobby" value="운동"> <input
			type="checkbox" name="hobby" value="요가">
	</form>


</body>
</html>