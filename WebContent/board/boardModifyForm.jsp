<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.getBoard(seq);
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정하기</title>
</head>
<body>
  <form name="boardModifyForm" method="post" action="boardModify.jsp">
  <h3>게시글 수정하기</h3>
  
  <input type="hidden" name="seq" value="<%=seq%>">
  <input type="hidden" name="pg" value="<%=pg%>">
  
  	<table border="1" cellpadding="5" cellspacing="0">
  	  <tr>
  	  	<td align="center" width="100">제목</td>
  	  	<td>
  	  		<input type="text" name="subject" id="subject" size="50" value="<%=boardDTO.getSubject()%>">
  	  		<div id="subjectDiv"></div>
  	  	</td>
  	  </tr>
  
  
  	  <tr>
  	  	<td align="center" width="100">내용</td>
  	  	<td>
  	  		<textarea name="content" cols="55" id="content" rows="15"><%=boardDTO.getContent()%></textarea>
  	  		<div id="contentDiv"></div>
  	  	</td>
  	  </tr>
  	  
  	  
  	  <tr>
  	  	<td colspan="2" align="center">
  	  		<input type="submit" value="글수정" onclick="checkBoard()">
  	  		<input type="reset" value="다시작성">
  	  	</td>
  	  </tr>

	</table>
  </form>

</body>
</html>