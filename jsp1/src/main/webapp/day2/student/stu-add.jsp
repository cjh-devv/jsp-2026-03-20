<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table, th, tr, td {
			border : 1px solid black;
			padding : 5px 10px;
			border-collapse: collapse;
			text-align : center;
		}
	th {
		background-color: #eee;
		width : 50px;
	}
	td {
		width : 200px;
	}
</style>
<body>
	<form action="stu-add-result.jsp" name="form">
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
			</tr>
			<tr>
				<td><input name="stuNo" placeholder="학번을 입력하세요"></td>
				<td><input name="stuName" placeholder="이름을 입력하세요"></td>
				<td><input name="stuDept" placeholder="학과를 입력하세요"></td>
				<td><input name="stuGrade" placeholder="학년을 입력하세요"></td>
			</tr>	
		</table>
		<input type="button" onclick="fnAdd()" value="추가하기">
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form
		if(form.stuNo.value.length != 8){
			alert("학번은 8자리임!")
			return;
		}
		form.submit();
	}
</script>