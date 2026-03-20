<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 디렉티브 include  -->
	<!-- 파일을 한곳에 다 모은다음(코드를 다 모은다) 컴파일(실행) -->
	<!-- 코드만 복사. num1,2 넘어온다 -->
	<%-- <%@ include file="variable.jsp" %> --%>

	<!-- 액션 include -->
	<!-- 각 파일에서 먼저 컴파일 한 후 결과를 합친다. 따라서 num1,2 안넘어옴 -->
	 <jsp:include page="variable.jsp"></jsp:include>
	
 	<%-- <%= num1 + num2 %> --%>
	
</body>
</html>