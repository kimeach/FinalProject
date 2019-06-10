<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
	<title>헤더</title>
</head>
<body>
<table border=0  width="100%">
  <tr>
     <td>
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/duke_swing.gif"  />
		</a>
     </td>
     <td>
       <font size=20>스프링실습 홈페이지!!</font>
     </td>
     
     <td>
     	<span>
     		<a href="${contextPath}/main/main.do"><h4>메인</h4></a> 
     	</span>    	         
	     	<c:choose>
	          <c:when test="${isLogOn == true  && member!= null}">
	           <div> <h4>환영합니다. ${member.name }님!</h4>
	            <a href="${contextPath}/member/logout.do"><h4>로그아웃</h4></a></<div>
	          </c:when>
	          <c:otherwise>
		       <<div>> <a href="${contextPath}/member/loginForm.do"><h4>로그인</h4></a> </<div>   
		      </c:otherwise>
		  	</c:choose>     		
     </td>
  </tr>
</table>


</body>
</html>