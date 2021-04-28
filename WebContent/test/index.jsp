<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="main.css">
<style type="text/css">
body {
	background: linear-gradient(to left,#ADF2B0,#1D976C); 
	color: white;
}
</style>

</head>
<body>

<div id="indexHeader">메 인 화 면</div>

<div id="indexContainer">
	<% if(session.getAttribute("memId")==null) {%>
		 <img style="cursor: pointer; padding-left: 43px; padding-right: 70px;" src="../img/sign-up.png" width="100" height="100" onclick="location.href='writeForm.jsp'" >
		 <img style="cursor: pointer; padding-right: 57px;" src="../img/login.png" width="100" height="100" onclick="location.href='loginForm.jsp'" >
		 <img style="cursor: pointer; padding-right: 45px;" src="../img/write.png" width="100" height="100" onclick="location.href='boardWriteForm.jsp'" >
		 <img style="cursor: pointer;" src="../img/list.png" width="100" height="100" onclick="location.href='boardList.jsp?pg=1'" >
	 
	<ul class="mainnav">
		<li><a href="writeForm.jsp">회원가입</a></li>
	
		<li><a href="loginForm.jsp">로 그 인</a></li>
		<li><a href="boardWriteForm.jsp">글 쓰 기</a></li>
	<%} else {%>
		<li><a href="logout.jsp">로 그 아 웃</a></li>
	<%} %>

	<li><a href="boardList.jsp?pg=1">목 록</a></li>
	</ul>
</div>	
</body>
</html>