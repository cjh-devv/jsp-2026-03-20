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
	th {
		width : 50px;
	}
	td {
		width : 200px;
	}
</style>
</head>
<body>
	<form action="board-add-result.jsp" name="form">
		<table>
			<tr>
				<th>종 류</th>
				<td>
				 	<label><input name="kind" value="1" type="radio" checked>공지사항</label>
				 	<label><input name="kind" value="2" type="radio">자유게시판</label>
				 	<label><input name="kind" value="3" type="radio">문의게시판</label>
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<th><input type="text" name="title"></th>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="40" name="contents"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" value="작성" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="board-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목 및 내용 입력하세요.");
			return;
		}
		form.submit();
	}

</script>