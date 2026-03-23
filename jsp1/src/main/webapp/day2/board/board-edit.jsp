<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 수정은 글쓰기와 같다 내용이 남아있는거 빼고 -->
<style>
	table, th, tr, td {
			border : 1px solid black;
			padding : 5px 10px;
			border-collapse: collapse;
			text-align : center;
		}
	th {
		background-color : #eee;
		width : 50px;
	}
	td {
		width : 200px;
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String boardNo = request.getParameter("boardNo");
		String sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			String kind = rs.getString("KIND");
		
	%>
	<form action="board-edit-result.jsp" name="form">
		<input name="boardNo" value"<%= boardNo %>" hidden>
		<table>
			<tr>
				<th>종 류</th>
				<td>
				 	<label><input name="kind" value="1" type="radio" <%= kind.equals("1")? "checked" : "" %>>공지사항</label>
				 	<label><input name="kind" value="2" type="radio" <%= kind.equals("2")? "checked" : "" %>>자유게시판</label>
				 	<label><input name="kind" value="3" type="radio" <%= kind.equals("3")? "checked" : "" %>>문의게시판</label>
				</td>
			</tr>
			<tr>
			<!--인풋은 열고 안닫아 -> value에 값들어가 textarea은 열고 닫아   >< 사이에 값들어가   -->
				<th>제 목</th>
				<th><input type="text" name="title" value="<%= rs.getString("TITLE") %>"></th>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="40" name="contents"><%= rs.getString("CONTENTS") %></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="reset" value="초기화">
			<a href="board-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
	<%
		} else{
			out.println("데이터 조회 실패!");
		}
	%>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목 및 내용 입력하세요.");
			return;
		}
		form.submit();
	}

</script>