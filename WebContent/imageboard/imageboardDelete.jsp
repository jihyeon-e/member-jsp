<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page import = "java.util.Map" %>

<%
Map<String, String[]> parameters = request.getParameterMap();
String[] deleteAr = parameters.get("check"); //check은 키고 deleteAr에 값이 저장됨

ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();

for(String seq : deleteAr) {
	//System.out.println("체크된 번호는 = " + seq);
	imageboardDAO.delete(Integer.parseInt(seq));
}

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
	alert("선택한 항목을 삭제했습니다.");
	location.href="imageboardList.jsp?pg=1";
}
</script>
</body>
</html>