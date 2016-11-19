<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style>
#login{
		margin-left:40%;
		margin-top:15%;
}
</style>
<title>Login</title>
</head>
<body >
<div id='login'>
<h3>Login</h3>


<form action="<c:url value="/secure/login.controller" />" method="get">

<table>
	<tr>
		<td>ID : </td>
		<td><input type="text" name="username" value="${param.username}">
		<td><span class="error">${errors.username}</span></td>
	</tr>
	<tr>
		<td>PWD : </td>
		<td><input type="text" name="password" value="${param.password}"></td>
		<td><span class="error">${errors.password}</span></td>
	</tr>
	<tr>
		<td>　</td>
		<td align="right"><input type="submit" class="btn btn-default" value="submit"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>