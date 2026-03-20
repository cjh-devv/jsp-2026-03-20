<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- variable.jsp -->
	<h2>변수!</h2>
	<%!
		int num1 = 5;
		int num2 = 10;
	%>
	<h3>두 수의 곱은 <%= num1 * num2 %></h3>
</body>
</html>