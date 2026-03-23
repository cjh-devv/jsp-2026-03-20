<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td {
			border : 1px solid black;
			padding : 5px 10px;
			border-collapse: collapse;
			text-align : center;
		}
	.search-area{
		margin : 10px 0px;
	}
</style>
</head>
<!-- 학생목록 : stu-list.jsp  STU_NO, STU_NAME, STU_DEPT, STU_GRADE 4개를 기준으로 CRUD -->
<!-- 학생삽입 : stu-add.jsp, stu-add-result.jsp -->
<!-- 상세보기 : stu-view.jsp -->
<!-- 삭제하기 : stu-remove.jsp -->
<!-- 수정하기 : stu-edit.jsp, stu-edit-result.jsp -->
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String keyword = request.getParameter("keyword");
	%>
	<%-- <div class="search-area">
		<label>검색어 : <input name="keyword" value="<%= keyword !=null? keyword : "" %>"></label>
		<input type="submit" value="검색">
	</div> --%>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	<%
		String sql = "SELECT STU_NO, STU_NAME, STU_DEPT, STU_GRADE FROM STUDENT WHERE 1=1 ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STU_NO") %></td>
			<td><%= rs.getString("STU_NAME") %></td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("STU_GRADE") %></td>
		</tr>
	<%
		}
	%>
	</table>	
		<div>
			<input type="button" value="학생추가" onclick="fnAdd()">
		</div>
</body>
</html>
<script>
	function fnAdd(){
		location.href="stu-add.jsp";
	}
</script>