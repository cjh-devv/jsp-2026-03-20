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
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		String sql = "SELECT * FROM TBL_USER "
				+ "WHERE USERID = '" + userId + "'"
				+ " AND PWD = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.print("로그인 성공");
		}else{
			out.print("로그인 실패");
		}
		
		/* String sqll = "SELECT USERID, PWD FROM TBL_USER"; 
		ResultSet rs2 = stmt.executeQuery(sqll);
		
		if(!rs2.getString("USERID").contains(userId)){
			out.print("해당 아이디는 존재하지 않습니다.");
		}
		if(rs2.getString("USERID").contains(userId) && rs2.getString("PWD").(pwd)) */
		
		String sql2 = "SELECT * FROM TBL_USER "
				+ "WHERE USERID = '" + userId + "'";
				ResultSet rs2 = stmt.executeQuery(sql);
		
		if(rs2.next()){
			/* 아이디는 있는 경우 */
			if(pwd.equals(rs2.getString("PWD"))){
				/* 비밀번호도 같을때 */
				out.println("로그인 성공");
			} else {
			/* 비밀번호는 다를 때 */
			out.println("비밀번호를 확인해주세요.");
			}
		}else{
			out.print("해당 아이디는 존재하지 않습니다.");
		}
		
		/* TBL_USER 테이블에 USERID, PWD 컬럼값과 비교하여  */
		/* 동일한 데이터 있으면 '로그인 성공' 출력 */
		/* x 둘 중 하나라도 다르면 '로그인 실패' 출력 */
		
		/* 아이디 없는 경우 : '해당 아이디는 존재하지 않습니다.' */
		/* 아이디는 있는데 비밀번호 다른 경우 : '비밀번호를 확인해주세요.' */
		
%>
</body>
</html>