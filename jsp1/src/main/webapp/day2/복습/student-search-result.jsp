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
		String stuNo = request.getParameter("stuNo");
		String sql = String.format("SELECT * FROM STUDENT WHERE STU_NO = '%s'", stuNo);
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("해당 학생의 이름은 " + rs.getString("STU_NAME") + "입니다");
		}else{
			out.println("조회에 실패했습니다");
		}
	
	%>
</body>
</html>