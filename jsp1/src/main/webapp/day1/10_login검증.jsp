<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="9_LoginResult.jsp" name="login" method="get"> <!-- 저거 소문자임 -->
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name ="pwd" type="password"></label>
		</div>
		<!-- 써밋은 누르면 무조건 액션을 실행함 근데 써밋을 하긴 해야 정보를 제출가능-->
		<div>
			<!-- 웬만하면 폼태그에선 인풋 버튼으로 버튼만들기 -->
			<input type="button" value="로그인!" onclick="fnCheck()">
		</div>
	</form>
	
</body>
</html>
<script>
	function fnCheck(){
		/* let userId = document.querrySelector("#userId").value;*/
		let login = document.login;
		                      /*form태그의 name인 login을 의미. 쟤는 걍 변수고 폼태그 객체 생성 하는거*/
		console.log(login.userId.value);
		if(login.userId.value.length == 0){
			alert("아이디 입력하셈");
			login.userId.focus();
			return;
		}
		if(login.pwd.value.length == 0){
			alert("비밀번호 입력하셈");
			login.pwd.focus();
			return;
		}
		//위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		login.submit();
	}
</script>