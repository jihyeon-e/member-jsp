<%@page import="imageboard.bean.ImageboardPaging"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="java.util.List"%>

<%
int pg = Integer.parseInt(request.getParameter("pg"));

int endNum = pg*3;
int startNum = endNum-2;


ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
List<ImageboardDTO> list = imageboardDAO.getImageboardList(startNum, endNum);


//페이징 처리
int totalA = imageboardDAO.getTotalA();

ImageboardPaging imageboardPaging = new ImageboardPaging();
imageboardPaging.setCurrentPage(pg);
imageboardPaging.setPageBlock(3);
imageboardPaging.setPageSize(3);
imageboardPaging.setTotalA(totalA);
imageboardPaging.makePagingHTML();


DecimalFormat df = new DecimalFormat("##,###");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시글 목록</title>
<style type="text/css">
#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
	border: 1px black solid;
	padding: 10px;
	background: skyblue;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
	border: 1px red solid;
	padding: 10px;
}
</style>
<script type="text/javascript">
function imageboardPaging(pg) {
	location.href="imageboardList.jsp?pg="+pg;
}
</script>
</head>
<body>
<h3 style="text-align: center; width: 650px;">게시글 목록</h3>
<form name="checkForm" action="imageboardDelete.jsp">
<table border="1" width="720" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
  <tr>
  	<td align="center" width="70"><input type="checkbox" id="check" onclick="selectAll(this)">번호</td>
  	<td align="center" width="70">이미지</td>
  	<td align="center" width="70">상품명</td>
  	<td align="center" width="70">단가</td>
  	<td align="center" width="70">개수</td>
  	<td align="center" width="70">합계</td>
  </tr>

  <% if(list!=null) { %>
  	<% for(ImageboardDTO imageboardDTO : list) { %>
  	<% //System.out.println(imageboardDTO.getImage1()); %>
  		  <tr>
  			<td align="center" ><input type="checkbox" name="check" value="<%=imageboardDTO.getSeq() %>" onclick=""><%=imageboardDTO.getSeq() %></td>
  			<td align="center" ><img src="../storage/<%=imageboardDTO.getImage1() %>" width="100" height="100" alt="<%=imageboardDTO.getImageName() %>"></td>
  			<td align="center" ><%=imageboardDTO.getImageName() %></td>
  			<td align="center" ><%=df.format(imageboardDTO.getImagePrice()) %></td>
  			<td align="center" ><%=imageboardDTO.getImageQty() %></td>
  			<td align="center" ><%=df.format(imageboardDTO.getImagePrice() * imageboardDTO.getImageQty()) %></td>

 		  </tr>
  	<%} //for%>
  <%} %>

  
</table>
</form>
<br>
<img style="float: left; cursor: pointer;" src="../img/오구.png" width="100" height="100" onclick="location.href='../main/index.jsp'" >

<div style="float: left; width: 650px; text-align: center"><%=imageboardPaging.getPagingHTML() %></div>
<br>
<input type="button" value="선택삭제" onclick="selectCheckbox()">
<!-- <input type="button" value="선택삭제" onclick="location.href='imageboardDelete.jsp'">  -->

<div id='result'></div>

<script type="text/javascript">
function selectAll(selectAll)  {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  	checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

function selectCheckbox() {
	for(i=0; i < checkForm.check.length; i++) {
		if(checkForm.check[i].checked == true) {
			<!--alert(checkForm.check[i].value);-->
			document.checkForm.submit();
			
		}
	}
	

}
</script>
</body>
</html>