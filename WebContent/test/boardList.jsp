<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.bean.BoardPaging"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
String memId = (String)session.getAttribute("memId");
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum-4;
//DB
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);

//페이징 처리
int totalA = boardDAO.getTotalA();

BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

//조회수 새로고침 방지
if(session.getAttribute("memId") != null) {
	Cookie cookie = new Cookie("memHit", "0"); //쿠키 생성
	cookie.setMaxAge(30*60);
	response.addCookie(cookie); //클라이언트에게 보내기
}


%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="main.css">

<style type="text/css">
#subjectA:link{ color: white; text-decoration: none; }
#subjectA:visited { color: white; text-decoration: none; }
#subjectA:hover { color: purple; text-decoration: underline; }
#subjectA:active { color: white; text-decoration: none; }

#currentPaging {
	color: red;
	text-decoration: underline;
}

#paging {
	color: white;
	text-decoration: none;
}



</style>

</head>
<body style="background: linear-gradient(to right, #654ea3, #eaafc8); color:white;">
	
  <div id="boardListHeader">
	  <img style="cursor: pointer;" src="../img/main.png" width="100" height="100" onclick="location.href='index.jsp'" >
	  게 시 판
  </div>
  
  <div id="boardListContainer">
	<table border="1" bordercolor="skyblue" width="1100" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
	  <tr>
	  	<th align="center" width="70">글번호</th>
	  	<th align="center" width="350">제목</th>
	  	<th align="center" width="100">작성자</th>
	  	<th align="center" width="100">작성일</th>
	  	<th align="center" width="100">조회수</th>
	  </tr>
	  
	  <% if(list!=null) { %>
		  <% for(BoardDTO boardDTO : list) { %>
			  <tr>
			  	<td align="center" height="20"><%=boardDTO.getSeq()%></td>
			  	<td>
			  		<a href="javascript:void(0)" id="subjectA" onclick="isLogin('<%=memId%>', <%=boardDTO.getSeq()%>, <%=pg%>)">
			  			<%=boardDTO.getSubject()%>  
			  		</a>
		  			<!-- 링크 눌렀을 때 #이 안나오게 하기 위해 -->
		  		</td>
			  	<td align="center"><%=boardDTO.getId()%></td>
			  	<td align="center"><%=sdf.format(boardDTO.getLogtime())%></td>
			  	<td align="center"><%=boardDTO.getHit()%></td>
			  </tr>
			  

		  <%} //for %>

	  <%} //if %>
	</table>
  </div>
<br>

<div style="float: left; width: 650px; text-align: center"><%=boardPaging.getPagingHTML() %></div>
<script type="text/javascript">
function isLogin(memId, seq, pg){
	if(memId=='null') {
		alert("먼저 로그인하세요");
	} else {
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
}
</script>

</body>
</html>