<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd1");
		String userName = request.getParameter("name");
		String gender = request.getParameter("gender");
		
		/* String sql = "INSERT INTO TBL_USER(USERID, PWD, USERNAME, GENDER) "
				+ "VALUES (\'%s\', \'%s\', \'%s\', \'%s\')".formatted(userId, pwd, userName, gender); */
		String sql = String.format(
				"INSERT INTO TBL_USER(USERID, PWD, USERNAME, GENDER) VALUES('%S', '%S', '%S', '%S')"
				, userId, pwd, userName, gender);
		out.println(sql);		
		int result = stmt.executeUpdate(sql);
		if(result >0){
			out.println("가입 축하!!");
		} else {
			out.println("오류 발생!!");
		}
	%>
	
</body>
</html>