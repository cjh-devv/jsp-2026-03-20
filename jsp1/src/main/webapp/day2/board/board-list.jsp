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
	.search-area{
		margin : 10px 0px;
	}
</style>
<body>
<!-- <% %> 이걸로 안쪽에 자바 꼽사리 끼게할수 있다는 것을 이용해서 많은 일을 할 수 있다. -->
<!--  바디 태그안이라면 어디든지 쓸 수 있다-->
<form action="board-list.jsp">
	<%@ include file="../../db.jsp" %>
	<%
		String keyword = request.getParameter("keyword");
	%>
	<div class="search-area">
		<label>검색어 : <input name="keyword" value="<%= keyword !=null? keyword : "" %>"></label>
		<input type="submit" value="검색">
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		
	<%
		
		String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE " 
				+ "FROM TBL_BOARD B WHERE 1=1 ";
		if(keyword != null){
			sql += "AND TITLE LIKE '%" + keyword + "%'";
			 
		}
		//조건이 2개 3개 되면 where가 중복되기 때문에 맨 앞에 where 1=1(참이라 실행) 놓고 추가 시퀀스 앞을 
				// where 대신 and로 해주면 중복없이 추가 가능!
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("BOARDNO") %></td>
				<td><a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)"> <%= rs.getString("TITLE") %></a></td>
				<td><%= rs.getString("USERID") %></td>
				<td><%= rs.getString("CNT") %></td>
				<td><%= rs.getString("CDATE") %></td>
			</tr>
	<%
		}
	%>
	</table>
	<div>
		<input type="button" value="글쓰기" onclick="fnAdd()">
	</div>
</form>	
</body>
</html>
<script>
	function fnAdd(){
		location.href="board-add.jsp";
	}
	function fnView(boardNo){
		location.href = "board-view.jsp?boardNo=" + boardNo
	}
</script>