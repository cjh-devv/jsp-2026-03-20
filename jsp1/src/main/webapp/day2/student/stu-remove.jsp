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
		String sql = "DELETE FROM STUDENT WHERE STU_NO = " + stuNo;
		
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			out.println("삭제 됨!");
	%>
			<a href="stu-list.jsp"><button>리스트로</button></a>
	<%		
		} else {
			out.println("삭제 실패!");
		}
	%>
</body>
</html>