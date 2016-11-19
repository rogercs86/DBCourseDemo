<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String loginFlag = (String)session.getAttribute("loginFlag");
	
	boolean isLogin = null == loginFlag ||loginFlag.length()==0 ?false:true;
	System.out.println("isLogin==="+isLogin);
	System.out.println("hahahah");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style>
#block{margin-left:38%;margin-top:13%;}
</style>
<title>Product</title>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>
<div id='block'>
<h3>Welcome  <span id='welcome'>${user.custid}</span></h3>
<form action="<c:url value="/pages/product.controller" />" method="get">
<%if(isLogin){ %>
	<input type="submit" name="prodaction" value="Sign Out"/>
<%}else{%>
	<input type="submit" name="prodaction" value="Home" />
<%}%>

<h3>Product Table</h3>
<table>
	<tr>
		<td>ID* : </td>
		<td><input type="text" name="id" value="${param.id}"></td>
		<td><span class="error">${errors.id}</span></td>
	</tr>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.name}"></td>
		<td></td>
	</tr>

	<tr>
		<td>Price : </td>
		<td><input type="text" name="price" value="${param.price}"></td>
		<td><span class="error">${errors.price}</span></td>
	</tr>
	<tr>
		<td>Make : </td>
		<td><input type="text" name="make" value="${param.make}"></td>
		<td><span class="error">${errors.make}</span></td>
	</tr>
	<tr>
		<td>Expire : </td>
		<td><input type="text" name="expire" value="${param.expire}"></td>
		<td><span class="error">${errors.expire}</span></td>
	</tr>
	<tr>
	<%if(isLogin){ %>
		<td>
			<input type="submit" display='none' name="prodaction" value="Insert">
			<input type="submit" name="prodaction" value="Update">
			<input type="submit" name="prodaction" value="Delete">
		</td>
		<%} %>
		<td>
			
	
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>
</div>

<h3><span class="error">${errors.action}</span></h3>

<c:if test="${delete}">
<h3>Delete 1 row(s) Success</h3>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty insert}">
<h3>Insert 1 row(s) Success</h3>
<table border="1">
	<tr><td>Id</td><td>${insert.id}</td></tr>
	<tr><td>Name</td><td>${insert.name}</td></tr>
	<tr><td>Price</td><td>${insert.price}</td></tr>
	<tr><td>Make</td><td>${insert.make}</td></tr>
	<tr><td>Expire</td><td>${insert.expire}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty update}">
<h3>Update 1 row(s) Success</h3>
<table border="1">
	<tr><td>Id</td><td>${update.id}</td></tr>
	<tr><td>Name</td><td>${update.name}</td></tr>
	<tr><td>Price</td><td>${update.price}</td></tr>
	<tr><td>Make</td><td>${update.make}</td></tr>
	<tr><td>Expire</td><td>${update.expire}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

</body>
</html>