<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//쿠키삭제
/* Cookie[] ar = request.getCookies();

if(ar != null) {
	for(int i=0; i<ar.length; i++) {
		if(ar[i].getName().equals("memName")) {
			ar[i].setMaxAge(0); //쿠키 삭제
			response.addCookie(ar[i]); //클라이언트에게 쿠키값 보내기
		}
		
		if(ar[i].getName().equals("memId")) {
			ar[i].setMaxAge(0); //쿠키 삭제
			response.addCookie(ar[i]); //클라이언트에게 쿠키값 보내기
		}
	}
} */

//세션
//session.removeAttribute("memName");
//session.removeAttribute("memId");

session.invalidate(); //무효화-모든 세션을 다 죽임

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
	alert("로그아웃 하였습니다");
	location.href="../main/index.jsp"
}
</script>

</body>
</html>