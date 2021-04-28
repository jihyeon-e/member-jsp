<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
  
<%
//데이터
String id = request.getParameter("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="checkIdForm" method="" action="checkId.jsp">

	<%=id%>는 사용 가능합니다.<br><br>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">

</form>

<script type="text/javascript">
function checkIdClose(id) { //javascript는 타입이 없기때문에 변수 안써도 됨
	//id = document.writeForm.id.value; //document는 현재문서
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}
</script>

</body>
</html>