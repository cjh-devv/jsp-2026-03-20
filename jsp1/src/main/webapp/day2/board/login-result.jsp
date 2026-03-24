<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- db와 연결하기 때문에 db관련 jsp 인클루드해야 -->
	<%@ include file="../../db.jsp" %>
	<!-- 여기서 아이디 패스워드 받아서 검증 독립적으로 못쓴다. 근데 넘겨받을거 주소창에 직접넣으면 그거 인식하긴함  -->
	<!-- 근데 파라미터 받은거만 바뀌지 않으면 로그인부터 켤 필요 없다 새로고침만 해도된다!!! -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		/*  out.println(userId + " " + pwd); */
		/* String sql = "SELECT * FROM TBL_USER "
					+ "WHERE USERID = '" + userId + "' "
					+ "AND PWD = '" + pwd + "'"; */
		String sql = String.format("SELECT * FROM TBL_USER WHERE USERID = '%s' AND PWD = '%s'", userId, pwd);
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("로그인 성공!");
			String sessionId = rs.getString("USERID");
			String sessionRole = rs.getString("ROLE");
			
			session.setAttribute("sessionId", sessionId);
			session.setAttribute("sessionRole", sessionRole);
			session.setMaxInactiveInterval(60 * 30); //30분 1800해도되는데 보기편하니까
			
			response.sendRedirect("board-list.jsp");
		} else{
			out.println("로그인 실패!");
		}
					%>
</body>
</html>