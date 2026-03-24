<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width : 800px;
		margin : 10px auto;
	}
	table{
		width : 100%;
		margin : 0 auto;
	}
	.select-area{
		text-align : right;
		margin-bottom : 5px;
	}
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color: #eee;
	}
	.paging-area {
		margin-top : 5px;
		text-align: center
	}
	.paging-area a {
		padding : 5px;
		text-decoration: none;
		color : #4c4848;
		font-size : 20px;
	}
	.paging-area .active{
		font-weight: bold;
		color : black;
		font-size : 30px;
	}
</style>
</head>
<body>
<%@ include file="../../db.jsp" %>
<div id="container">
	<form action="board-list-paging.jsp" name="form">
		<%
			int pageSize = 5;
			if(request.getParameter("pageSize") !=null){
			pageSize = Integer.parseInt(request.getParameter("pageSize"));				
		}
		%>
		<div class = "select-area">
			<select name="pageSize" onchange="fnPageSize()">
				<%
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
					<option value="<%= arr[i] %>" <%= pageSize == arr[i] ? "selected" : "" %>> <%= arr[i] %> 개씩 </option>
				<%}	%>
			</select>
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
			ResultSet rsCnt = stmt.executeQuery(
					"SELECT COUNT(*) AS TOTAL FROM TBL_BOARD "
					);
			rsCnt.next();
			int total = rsCnt.getInt("TOTAL");
			
			int pageList = (int) Math.ceil((double) total / pageSize);
						// 이건 ceil 리턴하면 더블이라 그럼
			
			int currentPage = 1;
						//문자로 넘어왔기에 숫자로 변경해야함
			if(request.getParameter("page") !=null){
				currentPage = Integer.parseInt(request.getParameter("page"));				
			}
			int offset = (currentPage -1) * pageSize;
						
		
			String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
						+ "FROM TBL_BOARD B WHERE 1=1 ";
			
			if(true){
				sql += "ORDER BY BOARDNO ASC ";	
			}
			
			if(true){
				sql += "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
			}
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("BOARDNO") %></td>
					<td><%= rs.getString("TITLE") %></td>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("CNT") %></td>
					<td><%= rs.getString("CDATE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
			<%-- <%if(currentPage != 1){ %> 이걸로 덮어서--%>
			<a href="?page=<%= currentPage == 1? 1 : currentPage - 1 %>&pageSize=<%= pageSize %>" <%= currentPage == 1? "hidden" : ""%>>◀</a>
			<%
				for(int i=1; i<=pageList; i++){
			%>
			<!-- 내 페이지로 그대로 이동할때는 이름 생략가능 -->
				<a href="?page=<%= i %>&pageSize=<%= pageSize %>"><%= i %></a>
			<%		
				}
			%>
			<a href="?page=<%= currentPage == pageList ? pageList : currentPage + 1 %>&pageSize=<%= pageSize %>" <%= currentPage == pageList ? "hidden" : ""%>>▶</a>
			<!-- 현재페이지-1대신 1페이지에서는 안보이기   현재페이지 +1 대신 막페이지에서는 안보이기 -->
			<%-- <%if(currentPage != pageList){ %> 이걸로 덮어서--%>
		</div>
	</form>
</div>
</body>
</html>
<script>
	function fnPageSize(){
		document.form.submit();
	}
</script>