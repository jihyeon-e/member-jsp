<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>
	<form name="loginForm" method="post" action="./login.jsp">
	<h3>로그인</h3>
		<table cellpadding="5" cellspacing="0">
		  <tr>
		  	<td align="center" width="100">아이디</td>
		  	<td>
		  		<input type="text" name="id" placeholder="아이디 입력">
		  		<div id="idDiv"></div>
	  		</td>
	  	  </tr>
		
		  <tr>
		  	<td align="center" width="100">비밀번호</td>
		  	<td>
		  		<input type="password" name="pwd" placeholder="비밀번호 입력">
		  		<div id="pwdDiv"></div>
		  	</td>
		  </tr>
	
		  <tr>
		  	<td colspan="2" align="center">
		  		<input type="button" value="로그인" onclick="checkLogin2()">
		  		<input type="button" value="회원가입" onClick="location.href='writeForm.jsp'">
		  </tr>
		</table>
	</form>
	<script src="../js/member.js"></script>

</body>
</html>