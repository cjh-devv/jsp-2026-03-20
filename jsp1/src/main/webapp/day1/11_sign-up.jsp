<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 아이디, 비밀번호, 비밀번호 확인, 이름, 나이를 입력받아서   -->
	<!-- submit 실행 시 12_sign-up-result.jsp 로 보내기 -->
	<!-- 단, 모든 값은 빈값 X -->
	<!-- 비밀번호, 비밀번호 확인은 같은 값이어야 함 -->
	
	<!-- 12_sign-up-result.jsp에서는 받은 값을 출력 -->
	<!-- 아이디 : ㅇㅇㅇ , 이름 : ㅇㅇㅇ -->
	
	<form action="12_sign-up-result.jsp" name="signUp" method="get"> 
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name ="pwd1" type="password"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input name ="pwd2" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name ="name"></label>
		</div>
		<div>
			<label>나이 : <input name ="age"></label>
		</div>
		<div>
			취미 : 
			<label><input type="checkbox" name ="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name ="hobby" value="유투브">유투브 감상</label>
			<label><input type="checkbox" name ="hobby" value="독서">독서</label>
			<label><input type="checkbox" name ="hobby" value="운동">운동</label>
			<label><input type="checkbox" name ="hobby" value="게임">게임</label>
			
		</div>
		<!-- 써밋은 누르면 무조건 액션을 실행함 근데 써밋을 하긴 해야 정보를 제출가능-->
		<div>
			<!-- 웬만하면 폼태그에선 인풋 버튼으로 버튼만들기 -->
			<input type="button" value="가입!" onclick="fnSignUp()">
		</div>
	</form>
	
</body>
</html>
<script>
	function fnSignUp(){
		let info = document.signUp;
		if(info.userId.value.length == 0){
			alert("아이디 채워!");
			info.userId.focus();
			return;
		}
		if(info.pwd1.value.length == 0) {
			alert("비번 채워!");
			info.pwd1.focus();
			return;
		}
		
		if(info.pwd1.value != info.pwd2.value){
			alert("비번이랑 확인이랑 틀려!")
			return;
		}
		if(info.pwd2.value.length == 0){
			alert("비번확인 채워!");
			info.pwd2.focus();
			return;
		}
		if(info.name.value.length == 0){
			alert("이름 채워!");
			info.name.focus();
			return;
		}
		if(info.age.value.length == 0){
			alert("나이 채워!");
			info.age.focus();
			return;
		}
		info.submit();
	}

</script>