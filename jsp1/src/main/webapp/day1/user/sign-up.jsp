<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<form action="sign-up-result.jsp" name="signUp" method="get"> 
		<div>
			<label>아이디 : <input name="userId"></label>
			<input type="button" value="중복체크" onclick="fnCheck()">
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
			성별 : 
			<label><input name="gender" type="radio" value="M" checked>남자</label>
			<label><input name="gender" type="radio" value="F">여자</label>
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
		let addFlg = "N";
		if(addFlg == "N"){
			alert("중복체크후 추가해주세요.");
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
		info.submit();
	}
	function fnCheck(){
		let form = document.signUp;
		let userId = form.userId.value;
		window.open("sign-up-check.jsp?userId=" + userId,"check", "width=400, height=400");
	}
	function fnReturn(flg){
		let form = document.signUp;
		if(flg == "Y"){
			form.userId.readOnly = true;
			addFlg = flg;
		}
	}
</script>