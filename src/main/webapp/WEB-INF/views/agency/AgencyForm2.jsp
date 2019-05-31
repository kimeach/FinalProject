<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=1">
<title>AgencyList</title>
</head>
<script>
function fu(){
if(document.getElementById('ChooseEmail').value == "write"){
	document.getElementById('selfEmail').style.display="inline-block";
	document.getElementById('ChooseEmail').style.display="none";
}
}
</script>
<body>
	<div class="container">
		<h2>중개 사무소 등록</h2>
		<form action="addAgency.do" method="post">
			<table>
				<tr height="50px">
					<td style="width: 300px;">대표자 주소</td>
					<td><input type="text" id="postcode" placeholder="우편번호">
						<input type="text" id="address" placeholder="주소"><br>
						<input type="text" id="extraAddress" placeholder="참고항목"> <input
						type="text" id="detailAddress" placeholder="상세주소"> <input
						type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script></td>
				</tr>
				<tr height="50px">
					<td style="width: 300px;">대표자 번호</td>
					<td><select name="selectNum">
							<script>
for(var i=10;i<20;i++){
document.write("<option value='i'> 0"+i+"</option>");
}
</script>
					</select> <span>&nbsp;-&nbsp;</span><input type="text" size="5"><span>&nbsp;-&nbsp;</span><input
						type="text" size="5"></td>
				</tr>
				<tr height="50px">
					<td style="width: 300px;">대표자 이메일</td>
					<td><input type="text" size="8"> <span>&nbsp;@&nbsp;</span>
						<select id="ChooseEmail" name="rpEmail" onchange="fu();">
							<script>
document.write("<option value='naver.com'>네이버(naver.com)</option>");
document.write("<option value='daum.net'>다음(daum.net)</option>");
document.write("<option value='hanmail.net'>한메일(hanmail.net)</option>");
document.write("<option value='write' style='display:inline-block;'>직접입력</option>");
</script>
					</select> <input type="text" placeholder="이메일을 입력하세요."
						style="display: none;" id="selfEmail"></td>
				</tr>
				<tr height="50px">
					<td style="width: 300px;">주 거래 매물</td>
					<td><input type="checkbox" value="아파트" name="rpChoose">아파트
						&nbsp; <input type="checkbox" value="다세대/다가구" name="rpChoose">다세대/다가구&nbsp;
						<input type="checkbox" value="오피스텔/도시형생활주택" name="rpChoose">오피스텔/도시형생활주택&nbsp;
						<input type="checkbox" value="빌라" name="rpChoose">빌라
						&nbsp; <input type="checkbox" value="기타" name="rpChoose">기타
						&nbsp;</td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input type="submit" class="btn btn-primary"
						value="등록하기"> &nbsp; <input type="button"
						class="btn btn-primary" onclick="history.go(-1);" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>