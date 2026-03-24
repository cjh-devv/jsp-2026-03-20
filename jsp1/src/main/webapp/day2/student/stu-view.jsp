<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
	}
	th {
		width : 50px;
		background-color: #eee;
	}
	td {
		width : 250px;
	}
	.btn-area {
		margin-top : 5px;
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
	%>
		<table>
			<tr>
				<th>학번</th>
				<td><%= rs.getString("STU_NO") %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= rs.getString("STU_NAME") %></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><%= rs.getString("STU_DEPT") %></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><%= rs.getString("STU_GRADE") %></td>
			</tr>
		</table>
		
		<div class="btn-area">
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="button" value="삭제하기" onclick="fnRemove()">
		</div>
	<%		
		} else {
			out.println("해당 학생 없음!");
		}
	%>
</body>
</html>
<script>
	function fnEdit(){
		location.href = "stu-edit.jsp?stuNo=<%= stuNo %>";
	}
	function fnRemove(){
		location.href = "stu-remove.jsp?stuNo=<%= stuNo %>";
	}
</script>