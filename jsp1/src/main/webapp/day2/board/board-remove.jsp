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
	<% String boardNo = request.getParameter("boardNo");
		String sql = "DELETE FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		int result = stmt.executeUpdate(sql);
		if(result>0){
			out.println("삭제 완료!");
		}else{
			out.println("삭제 실패!");
		}
	%>
	<a href="board-list.jsp"><button>되돌아가기</button></a>
</body>
</html>