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
<title>헤더</title>
</head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<body>
<table border=0  width="100%">
  <tr>
     <td>
		<a href="${contextPath}/review/reviewList.do">
			<img src="${contextPath}/resources/image/main.jpg" style="width: 70px; height: 70px"/>
		</a>
     </td>
     <td>
       <h1><font size=30>노숙자가 되지말자</font></h1>
     </td>
     <td>
       <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <h3>환영합니다. ${member.name }님!</h3>
            <a href="${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
          </c:when>
          <c:otherwise>
	        <a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
	      </c:otherwise>
	   </c:choose>     
     </td>
  </tr>
</table>


</body>
</html>