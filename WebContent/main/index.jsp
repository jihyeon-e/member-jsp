<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	background: linear-gradient(to left,#ADF2B0,#1D976C); 
	color: white;
}
</style>

</head>
<body>
<h3>*** 메인화면 ***</h3>

<% if(session.getAttribute("memId")==null) {%>
	<a href="../member/writeForm.jsp">회원가입</a><br>
	<a href="../member/loginForm.jsp">로그인</a><br>	
<%} else {%>
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../member/modifyForm.jsp">회원정보수정</a><br>
	<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
	<a href="../imageboard/imageboardWriteForm.jsp">글쓰기-image</a><br>
<%} %>
	
<a href="../board/boardList.jsp?pg=1">목록</a><br>
<a href="../imageboard/imageboardList.jsp?pg=1">이미지목록</a><br>
</body>
</html>