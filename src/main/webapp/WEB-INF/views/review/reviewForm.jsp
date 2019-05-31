<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function readURL(input){
		if(input.files && input.files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />'");
		cnt++;
	}
</script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
</script>
<body>
	<div class="container">
		<form name="reviewForm" method="POST" action="${contextPath}/review/addNewReview.do" 
				enctype="multipart/form-data" class="form-horizontal">
			<div>
				<img  id="preview" src="#" width=100 height=100 />
			</div>		
			<div class="form-group row">
				<label class="col-sm-2">IMAGEFILE</label>
				<div class="col-sm-3">	
					<input type="file" name="imageFileName" onchange="readURL(this);"  class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">STORE</label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="OO부동산" maxlength="30" name="name" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">ZIPCODE</label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="11111" maxlength="30" name="zipcode" id="sample4_postcode"/>
				</div>
				<div>
					<input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">ADDRESS</label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="Address" maxlength="30" name="address" id="sample4_roadAddress"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">POINT</label>
				<div class="col-sm-3">
					<select name="point">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10" selected>10</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">LOVE</label>
				<div>	
					<textarea name="love" placeholder="장점" rows="10" cols="30" maxlength="30"></textarea>
				</div>	
				<label class="col-sm-2">DISLOVE</label>
				<div>	
					<textarea name="dislove" placeholder="단점" rows="10" cols="30" maxlength="30"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">REGDATE</label>
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
				<input type="text" name="writeDate" value="<c:out value='${today}' />" readonly />
			</div>
			<div class="form-group row">
				<label class="col-sm-2">NAME</label>
				<input type="text" placeholder="작성자" name="id" />
			</div>	 
			<div>
				<input type="submit" class="btn btn-default" value="후기 등록"  />
				<input type="button" class="btn btn-default" value="후기 목록" onclick="javascript:location.href='${contextPath}/review/reviewList.do';" />		
			</div>
		</form>
	</div>
</body>
</html>