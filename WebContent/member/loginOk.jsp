<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

//String name = request.getParameter("name");
//String id = request.getParameter("id");

String name=null;
String id=null;
String email=null;

/* //쿠키
Cookie[] ar = request.getCookies();//특정 쿠키를 얻을수 없으므로 모든 쿠키를 가져온다

if(ar != null){
   for(int i=0; i<ar.length; i++){
      String cookieName = ar[i].getName();//쿠키명
      String cookieValue = ar[i].getValue();//값
      
      System.out.println("쿠키명 = "+cookieName);
      System.out.println("쿠키값 = "+cookieValue);
      System.out.println("-------------"); 
      
      if(cookieName.equals("memName")) {
    	  name = ar[i].getValue();
      }
      
      if(cookieName.equals("memId")) {
    	  id = ar[i].getValue();
      }
      
   }//for
   
}//if */


//세션
id = (String)session.getAttribute("memId"); //자식 = (자식)부모
name = (String)session.getAttribute("memName"); //자식 = (자식)부모
email = (String)session.getAttribute("memEmail");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	<img src="../img/토끼.PNG" width="100" height="100" onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	<%=name%>님이 로그인하였습니다
	<br><br>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	<input type="button" value="회원정보수정" onclick="location.href='modifyForm.jsp'"> <!-- 아이디를 싣고 가면 안됨 -->
</h3>
</body>
</html>