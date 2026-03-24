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
		text-align: right;
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
</style>
</head>
<body>
<div id="container">
	<form action="board-list-paging2" name="form">
		<%@ include file="../../db.jsp" %>
		<div class="select-area">
			<select name="pageSize">
				<%
					int currentPage = 1;
					int pageSize = 5;
					if(request.getParameter("pageSize")!=null){
						pageSize = Integer.parseInt(request.getParameter("pageSize"));
					}
					
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
						<option value="<%= arr[i] %>"> <%= arr[i] %> 개씩 </option>
				<%		
					}
				%>
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
			
			String sql = "SELECT * "
						+ "FROM STUDENT S WHERE 1=1 ";
			if(true){
				sql += "ORDER BY STU_NO ASC ";	
			}
			
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
		<div class="paging-area">
		<%	
			sql = "SELECT COUNT(*) as CNT FROM STUDENT";
			rs = stmt.executeQuery(sql);
			rs.next();
			int totalPage = rs.getInt("CNT"); 
			int pageList = (int) Math.ceil((double) totalPage / pageSize);		
			for(int i=1; i<=pageList; i++){	
		%>	
			<a href="?page=<%= i %>&pageSize=<%= pageSize %>"><%= i %></a>
		<%}%>
		<%
			int currentpage =1;
			if(request.getParameter("page")!=null){
				currentpage = Integer.parseInt(request.getParameter("page"));
			}
		%>	
		</div>
	</form>
</div>
</body>
</html>
<script>
</script>