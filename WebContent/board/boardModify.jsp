<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>

<%
request.setCharacterEncoding("UTF-8");

int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));
String subject = request.getParameter("subject");
String content = request.getParameter("content");

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardModify(seq, subject, content);

%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function() {
	alert("글수정 완료!!");
	location.href="boardList.jsp?pg=<%=pg%>";
}
</script>

</body>
</html>