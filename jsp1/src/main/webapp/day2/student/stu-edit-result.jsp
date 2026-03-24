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
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		
		String sql = "UPDATE STUDENT SET "
					+ "STU_NAME = '" + stuName + "',"
					+ "STU_DEPT = '" + stuDept + "',"	
					+ "STU_GRADE = '" + stuGrade + "' "
					+ "WHERE STU_NO = " + stuNo;	//이거 변수 숫자면 ''안붙여도 되고 붙여도 된다는데
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			response.sendRedirect("stu-list.jsp");
		} else {
			out.println("에러 발생!");
		}
		
	%>
</body>
</html>