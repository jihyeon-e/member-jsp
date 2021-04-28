<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="main.css">
</head>
<body style="background: linear-gradient(to right, #dcf4dc, #f4f4dc);">

<form name="loginForm" method="post" action="main.jsp">
  <div id="loginFormHeader">
	  <img style="cursor: pointer;" src="../img/main.png" width="100" height="100" onclick="location.href='index.jsp'" >
	  로 그 인
  </div>
  
  
  <div id="loginFormContainer">
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
		  		<input type="button" value="로그인" onclick="checkLogin()">
		  		<input type="button" value="회원가입" onClick="location.href='writeForm.jsp'">
		  </tr>
		</table>
  </div>
</form>
<script src="member.js"></script>


</body>
</html>