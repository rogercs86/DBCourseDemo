<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<style type="text/css">
#title{margin-left:30%;margin-top:2%;}
#product{margin-left:20%;}
#foot{margin-left:35%;}
</style>

<title>Display</title>
</head>
<body>
<div id='title'>
<h3>Select Result : ${fn:length(select)} row(s) selected</h3>
</div>
<c:if test="${not empty select}">
<div id='product'>
<table>
	<thead>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Price</th>
		<th>Make</th>
		<th>Expire</th>
	</tr>
	</thead>
	<tbody>
	
	<c:forEach var="row" items="${select}">
		<c:url value="/pages/product.jsp" var="path">
			<c:param name="id" value="${row.id}" />
			<c:param name="name" value="${row.name}" />
			<c:param name="price" value="${row.price}" />
			<c:param name="make" value="${row.make}" />
			<c:param name="expire" value="${row.expire}" />
		</c:url>
	<tr>
		<td><a href="${path}">${row.id}</a></td>
		<td>${row.name}</td>
		<td>${row.price}</td>
		<td>${row.make}</td>
		<td>${row.expire}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
</c:if>
<div id='foot'>
<h3><a href="<c:url value="/pages/product.jsp" />">Modify Product</a></h3>
</div>
</body>
</html>