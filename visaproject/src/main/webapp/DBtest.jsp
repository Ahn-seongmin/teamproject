<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="model.*" %> 
   <%@ page import="java.sql.*" %>
   <%@ page import="java.util.*" %>
   
    <%
    
    Connection conn = DBM.getInstance();
    if(conn != null){
    	out.print("ok");
    }else{
    	out.print("fail");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>