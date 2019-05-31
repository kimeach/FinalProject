<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>후기/평점</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
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
	function fn_remove_review(url, reviewNO){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
	    var reviewNOInput = document.createElement("input");
	    reviewNOInput.setAttribute("type","hidden");
	    reviewNOInput.setAttribute("name","reviewNO");
	    reviewNOInput.setAttribute("value", reviewNO);
		 
	    form.appendChild(reviewNOInput);
	    document.body.appendChild(form);
	    
	    var isDel = confirm("삭제하시겠습니까?");
	    if(isDel) form.submit();
	    else return;
	}
</script>
<body>
	<div class="container">
		<form name="frmReview" method="POST" action="${contextPath}" enctype="multipart/form-data">
			<div align="right">
				<input type="button" value="후기 작성" onclick="javascript:location.href='${contextPath}/review/reviewForm.do';" class="btn btn-secondary" >
			</div>
			<c:choose>
				<c:when test="${reviewList==null}">
					<div class="row">				
						<p align="center">
           	 				<b><span style="font-size:9pt;">등록된 후기가 없습니다.</span></b>
        				</p>
        			</div>	
				</c:when>
				<c:when test="${reviewList!=null}">
				<div class="row">
					<c:forEach var="review" items="${reviewList}" varStatus="reviewNum">
						<div class="col-md-4" style="border-style:solid; 
							border-color:gray; margin:5px;">
							<c:choose>
								<c:when test="${not empty review.imageFileName && review.imageFileName!='null'}">
									<img src="${contextPath}/download.do?reviewNO=${review.reviewNO}&imageFileName=${review.imageFileName}"
										id="preview" style="width:100%; height:30%;"/>
								</c:when>
							</c:choose>
							<h5>${review.reviewNO} ${review.name}</h5>
							${review.zipcode}<br>
							${review.address}<br>
							이용 후기 평점 : ${review.point}<br>
							<img src="${contextPath}/resources/image/review_repo/like.png" style="width:14px; height:15px">${review.love}<br>
							<img src="${contextPath}/resources/image/review_repo/dislike.png" style="width:12px; height:12px">${review.dislove}<br>
							${review.writeDate}<br>
							${review.id}<br>
							<input type=button value="수정" 
								onClick="javascript:location.href='${contextPath}/review/viewReview.do?reviewNO=${review.reviewNO}';" class="btn btn-default" >
							<input type=button value="삭제하기" 
								onClick="fn_remove_review('${contextPath}/review/removeReview.do', ${review.reviewNO})" class="btn btn-default" >
						</div>
					</c:forEach>
				</div>
				</c:when>
			</c:choose>
		</form>	
	</div>
</body>
</html>