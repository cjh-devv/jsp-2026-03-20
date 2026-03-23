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
		String stuNo = request.getParameter("STU_NO");
		String stuName = request.getParameter("STU_NAME");
		String stuDept = request.getParameter("STU_DEPT");
		String stuGrade = request.getParameter("STU_GRADE");
		
		String sql = String.format("INSERT INTO STUDENT"
				/* + "(STU_NO, STU_NAME, STU_DEPT, STU_GRADE)" */
				+ "VALUES(%s, %s, %s, %s, "", "", "", "")", stuNo, stuName, stuDept, stuGrade);
		
		int result = stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	let result = <%= result%>
	if(result>0){
		alert("입력성공!");
	} else{
		alert("입력실패!");
	}
	location.href="stu-list.jsp"
</script>