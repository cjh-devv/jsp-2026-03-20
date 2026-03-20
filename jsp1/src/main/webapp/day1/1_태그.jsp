<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 선언문 -->
	<!-- 자바문법으로 변수나 메소드를 선언 -->
	<%!
		String name = "홍길동";
		int sum(int x, int y){
			return x+y;
		}
	%>
	<!-- 2. 표현식 -->
	<!-- 선언문이나 스크립틀릿에서 선언된 값(변수 or 메소드)를 출력  -->
	<!-- 메소드는 리턴이 있는 메소드 호출 가능  -->
	
	<div style="color : blue;"><%= name %></div>
	<h2><%=sum(3,5) %></h2>
	
	<!-- 3. 스크립틀릿  -->
	<!-- 자바의 실행문을 그대로 표현(자바 문법 그대로. ex, print문)  -->	
	<!-- 변수 선언은 가능하나 지역변수 메소드는 선언 불가(호출은 가능) -->
	
	<%
		System.out.println(name + " 입니다.");// 콘솔창에 출력  
									//브라우저에 출력하고 싶으면 시스템 뺴야됨
		out.println("<h1>" + name + "입니다. </h1>");
		
		for(int i = 1; i<=10; i++){
			out.print(i + " ");	
		}
	%>
</body> 
</html>