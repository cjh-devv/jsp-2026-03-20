<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--필수 숙지 액션메소드네임 -->
	<form action="login-result.jsp" method="get" name="login">
		<div>
		<!-- name에 있는 값을 key로 해서 넘김  인풋에서 입력한건 밸류 -->
			아이디 : <input name="userId">
		</div>
		<div>
			비밀번호 : <input name="pwd" type="password">
		</div>
		<div>
		<!-- 누를때 검증할거 있음 버튼이 낫다 액션은 바로 가니까 &nbsp; 공백임-->
			<input type="submit" value="submit버튼">
			&nbsp;&nbsp;
			<input type="button" value="그냥 버튼" onclick="fnLogin()">
		</div>
	</form>
</body>
</html>
<script>
	function fnLogin(){
		/*이런식으로 폼태그 객체 만들면 쿼리셀렉터 일일히 안해도됨  */
		let form = document.login;
		/*폼태그 안의 유저아이디 안의 밸류  */
		/*  alert(form.userId.value);*/
		if(form.userId.value.length == 0){
			alert("아이디 입력하세요.");
			return;
		}
		if(form.pwd.value.length == 0){
			alert("비밀번호 입력하세요.");
			return;
		}
		/* 서밋을 해야 보내면서 페이지이동함. 폼태그안에 서브밋함수가 있어서...  */
		form.submit();
		
	}
	
</script>