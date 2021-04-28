<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("memId");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="main.css">
</head>
<body style="background: linear-gradient(to right, #a8b2ef, #daeef4);">

  <form name="boardWriteForm" method="post" action="boardWrite.jsp">
  
  <div id="boardWriteFormHeader">
	  <img style="cursor: pointer;" src="../img/main.png" width="100" height="100" onclick="location.href='index.jsp'" >
	  글 쓰 기
  </div>
  
  <div id="boardWriteFormContainer">
  	<table cellpadding="5" cellspacing="0">
  	  <tr>
  	  	<td align="center" width="100">제목</td>
  	  	<td>
  	  		<input type="text" name="subject" id="subject" size="50">
  	  		<div id="subjectDiv"></div>
  	  	</td>
  	  </tr>
  
  
  	  <tr>
  	  	<td align="center" width="100">내용</td>
  	  	<td>
  	  		<textarea name="content" id="content" cols="55" rows="15"></textarea>
  	  		<div id="contentDiv"></div>
  	  	</td>
  	  </tr>
  	  
  	  
  	  <tr>
  	  	<td colspan="2" align="center">
  	  		<input type="button" value="글쓰기" onclick="checkBoard()">
  	  		<input type="reset" value="다시작성">
  	  	</td>
  	  </tr>

	</table>
  </div>
  </form>
  <script src="member.js"></script>

</body>
</html>