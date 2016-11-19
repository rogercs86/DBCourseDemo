<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String loginFlag = (String)session.getAttribute("loginFlag");
	boolean isLogin = null == loginFlag ||loginFlag.length()==0 ?false:true;
	//add test3
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
	#block{margin-left:41%;margin-top:15%;}
	#welcome{color: blue;}
</style>
<title>Home</title>
</head>
<body>
<div id='block'>
<h3>Welcome <span id='welcome'>${user.custid}</span></h3>
<%if(!isLogin){ %>
<h3><a href="<c:url value="/secure/login.jsp" />">Login</a></h3>
<%}%>
<h3><a href="<c:url value="/pages/product.jsp" />">View Product</a></h3>
</div>
</body>
</html>