<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp 핵심 => form 태그 데이터 전송 매개 액션필수 버튼눌렀을때 이동할 페이지 -->
	<!-- form태그 내의 submit버튼 클릭 시 action페이지로 이동 -->
	<!-- 이때, form태그 내부에 있는 input에 있는 값을 request객체에 담아서 이동 -->
	<!-- input의 name속성이 키(key), 입력받은 값이 value -->
	
	<!-- method는 옵션, get방식과 post방식, 디폴트는 get -->
	<!-- get방식은 url(주소)에 값을 담아서 보낸다. 보안에 취약하지만 빠르다. -->
	<!-- 사용자 개인정보나 패스워드 등을 전송할때는 사용하면 안된다. -->
	
	<!-- post는 데이터를 숨겨서 보낸다. -->
	
	<!-- 실습할때는 데이터 확인을 위해 get을 주로 쓸래요  name속성이 필수다 이 파일이 백엔드-->
	<form action="LoginResult.jsp" name="login" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name ="pwd" type="password"></label>
		</div>
		<div>
			<!-- submit 버튼은 클릭하면 form 태그의 action에 있는 페이지로 이동한다.-->
			<input type="submit" value="로그인!">
		</div>
	</form>
	
</body>
</html>
<script>
</script>