<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
</head>
<body>

	<table border="1">
		<tr>
			<th>직원번호</th>
			<th>이름</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>직급</th>
		<tr>
		<c:forEach var="l" items="${article }">
		<tr>
			<td>${l.emp_no }</td>
			<td>${l.emp_name}</td>
			<td>${l.emp_number}</td>
			<td>${l.emp_email}</td>
			<td>${l.emp_position}</td>
		</tr>
		</c:forEach>
		
		
	</table>


</body>
</html>