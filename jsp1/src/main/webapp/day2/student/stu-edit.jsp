<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
	    width: 50px;
		text-align: center;	
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();  // rs.next() 이걸 실행을 해야 밑으로 내려감
		String stuGrade = rs.getString("STU_GRADE");
	%>
	<form action="stu-edit-result.jsp">
		<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
		<!-- 학번을 disabled 했기에 서밋해도 학번이 안넘어감  그래서 학번 따로 따고 안보이게--!>
		<!-- 학번바꾸고싶어도 db의 제약조건에 있는지 없는지 몰라서-->
		<!-- 애초에 학번을 수정하는게 이상하기때문에 -->
		<div>
			<label>학번 : <input name="stuNo" value="<%= rs.getString("STU_NO") %>" disabled></label>
		</div>
		<div>
			<label>이름 : <input name="stuName" value="<%= rs.getString("STU_NAME") %>"></label>
		</div>
		<div>
			<label>학과 : <input name="stuDept" value="<%= rs.getString("STU_DEPT") %>"></label>
		</div>
		<div>
			<label>학년 : 
				<select name="stuGrade">
					<option value="1" <%= stuGrade.equals("1") ? "selected" : "" %>> 1 </option>
					<option value="2" <%= stuGrade.equals("2") ? "selected" : "" %>> 2 </option>
					<option value="3" <%= stuGrade.equals("3") ? "selected" : "" %>> 3 </option>
				</select>
			</label>
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>
</body>
</html>