<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      #container {
        width: 98%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 0px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        background-color: #EAEAEA;
      }
      #content {
        width: 100%;
        height:600px;
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      
      #sidebar-down {
        padding: 3px 0px ;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        background-color: #EAEAEA;
        width: 100%;     
        font-size:10px;  
       /*  padding: 5px;       
     	margin-right: 5px;
        float: left; 
        background-color: #E7E7E7;
        border: 0px solid #bcbcbc;
        font-size:10px; */
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #EAEAEA;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-down">
          <tiles:insertAttribute name="side"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>