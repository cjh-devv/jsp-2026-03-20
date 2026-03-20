<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String[] hobby = request.getParameterValues("hobby");
		
		for(int i=0; i<hobby.length;i++){
			out.println(hobby[i]);
		}
	%>
	<div> 아이디 : <%= userId %></div>
	<div> 이름 : <%= name %></div>
</body>
</html>