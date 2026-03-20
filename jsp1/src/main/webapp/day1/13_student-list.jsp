<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
		String sql = "SELECT * FROM STUDENT";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
		<div><%= rs.getString("STU_NO") %> <%= rs.getString("STU_NAME") %></div>
	<%
		}
	%>
	
</body>
</html>