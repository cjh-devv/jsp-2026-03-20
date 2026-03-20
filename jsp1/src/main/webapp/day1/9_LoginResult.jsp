<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 독립적으로 실행되는 페이지가 아니다!  아디 비번 받아야 하니까 -->
	<!-- id가 test, pwd 1234 면 '로그인 성공' 출력 -->
	<!-- 아니면 '로그인 실패' 출력 -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		if(userId.equals("test") && pwd.equals("1234")){
			out.println("로그인 성공!");
		} else{
			out.println("로그인 실패!");
		}
		
		
	%>
	<%-- 로그인 성공!
	<div>아이디 : <%= userId %></div>
	<div>비밀번호 : <%= pwd %></div> --%>
</body>
</html>