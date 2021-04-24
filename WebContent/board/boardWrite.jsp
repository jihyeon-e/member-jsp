<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

    
<%
//데이터 받아오기
request.setCharacterEncoding("UTF-8"); //post방식으로 넘겼을 때만 필요함. get방식일 때는 필요없음
String subject = request.getParameter("subject");
String content = request.getParameter("content");

String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

//Map 대신 DTO로 할 수 있음
Map<String, String> map = new HashMap<String, String>();
map.put("id",id);
map.put("name",name);
map.put("email",email);
map.put("subject",subject);
map.put("content",content);

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.boardWrite(map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

<%-- <h3><%=id%>님이 작성하신 글을 저장하였습니다</h3> --%>

<script type="text/javascript">
window.onload=function() {
	alert("작성하신 글을 저장하였습니다.");
	location.href="boardList.jsp?pg=1";
}

</script>
</body>
</html>