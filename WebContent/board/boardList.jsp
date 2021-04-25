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





%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	<h3 style="text-align: center; width: 650px;">게시판</h3>
	<table border="1" bordercolor="yellow" width="720" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
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
<br>
<img style="float: left; cursor: pointer;" src="../img/오구.png" width="100" height="100" onclick="location.href='../main/index.jsp'" >

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