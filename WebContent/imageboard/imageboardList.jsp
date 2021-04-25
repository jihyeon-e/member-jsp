<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8"); 

ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
List<ImageboardDTO> list = imageboardDAO.getImageboardList();


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 style="text-align: center; width: 650px;">게시글 목록</h3>
<table border="1" width="720" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
  <tr>
  	<td align="center" width="70">번호</td>
  	<td align="center" width="70">이미지</td>
  	<td align="center" width="70">상품명</td>
  	<td align="center" width="70">단가</td>
  	<td align="center" width="70">개수</td>
  	<td align="center" width="70">합계</td>
  </tr>

  <% if(list!=null) { %>
  	<% for(ImageboardDTO imageboardDTO : list) { %>
  	<% System.out.println(imageboardDTO.getImage1()); %>
  		  <tr>
  			<td align="center" height="20"><%=imageboardDTO.getSeq() %></td>
  			<td align="center" height="20"><img src="/memberJSP/storage/<%=imageboardDTO.getImage1() %>" width="50" height="50" alt="<%=imageboardDTO.getImageName() %>"></td>
  			<td align="center" height="20"><%=imageboardDTO.getImageName() %></td>
  			<td align="center" height="20"><%=imageboardDTO.getImagePrice() %></td>
  			<td align="center" height="20"><%=imageboardDTO.getImageQty() %></td>
  			<td align="center" height="20"><%=imageboardDTO.getImagePrice() * imageboardDTO.getImageQty() %></td>
 		  </tr>
  	<%} %>
  <%} %>

  
</table>
</body>
</html>