<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<% 
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("이미 사용중인 학번입니다.");
			out.println("<input id='check' value='N' hidden>");
		}else {
			out.println("사용 가능한 학번입니다.");
			out.println("<input id='check' value='Y' hidden>");
		}		
	%>
	<input type="button" value="되돌아가기" onclick="fnClose()">
</body>
</html>
<script>
	function fnClose(){
		let flg = document.querySelector("#check").value;
		window.opener.fnReturn(flg);
		window.close();
	}
</script>