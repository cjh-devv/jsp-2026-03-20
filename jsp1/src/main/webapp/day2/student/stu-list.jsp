<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:30px
	}
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
		String kind = request.getParameter("kind");
		kind = kind != null ? kind : "";
	%>
<form action="stu-list.jsp" name="form">	
	<div>
		<select name="kind" onchange="fnKind()">
		<!-- 원래 전체 누르면 sql이 전부 조회하는걸로 되서 전 목록이 떠야하는데 -->
		<!-- 셀렉트 누를때마다 주소는 kind=기계 이거면서 전체가 선택된채로 되서 -->
		<!-- 이때 다른 옵션 누르고 다시 전체 눌러도 전체목록이 안뜸 -->
		<!-- 이걸 막기 위해서 <%= kind.equals("기계") ? "selected" : "" %>이거 하라고 하는거 -->
		<!-- 이래야 주소의 kind기계  옵션 기계  선택되서 전체 누르면 전체목록 뜯ㅁ -->
			<option value ="">:: 전체 ::</option>
			<option value ="기계" <%= kind.equals("기계") ? "selected" : "" %>>기계</option>
			<option value ="전기전자" <%= kind.equals("전기전자") ? "selected" : "" %>>전기전자</option>
			<option value ="컴퓨터정보" <%= kind.equals("컴퓨터정보") ? "selected" : "" %>>컴퓨터정보</option>
		</select>
	</div>

	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	<%
		String sql = "SELECT * FROM STUDENT WHERE 1=1 ";
		if(kind != null && !kind.equals("")){
			sql += "AND STU_DEPT = '" + kind + "' ";
		}
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STU_NO") %></td>
			<td><a href="stu-view.jsp?stuNo=<%= rs.getString("STU_NO") %>"><%= rs.getString("STU_NAME") %></a></td>
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
</form>			
</body>
</html>
<script>
	function fnAdd(){
		location.href="stu-add.jsp";
	}
	function fnKind(){
		document.form.submit();
	}
</script>