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
	input[readOnly]{
		background-color : #ccc;
		border-color : white;
	}
</style>
<body>
	<form action="stu-add-result.jsp" name="form">
				<div>
				<label>학번 : <input name="stuNo"></label>
				<input type="button" onclick="fnCheck()" value="중복체크">
				</div>
				<div>
					<label>이름 : <input name="stuName"></label>
				</div>
				<div>
					<label>학과 : <input name="stuDept"></label>
				</div>
				<div>
				<label>학년 : 
					<select name="stuGrade">
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
					</select>
				</label>
				</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let addFlg = "N";
	function fnAdd(){
		let form = document.form;
		if(addFlg == "N"){
			alert("중복체크후 추가해주세요.");
			return;
		}
		form.submit();
	}	
	function fnCheck(){
		let form = document.form;
		let stuNo = form.stuNo.value;
		if(form.stuNo.value.length != 8){
			alert("학번은 8자리임!")
			return;
		}
		
		window.open("student-check.jsp?stuNo="+stuNo,"check", "width=400, height=400");
	}
	
	function fnReturn(flg){
		let form = document.form;
		if(flg == "Y"){
			form.stuNo.readOnly = true;  //디저블과 비슷하지만 디저블은 서밋하면 데이터못넘겨 
										// 얘는 넘기는데 스타일이좀 불편해서 클래스 따서 수정
			addFlg = flg;
		}
	}
</script>