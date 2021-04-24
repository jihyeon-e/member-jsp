<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO" %>
<%@page import="member.bean.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>

<%
//데이터 얻어오기
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");


//DB
MemberDAO memberDAO= MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.login(id, pwd);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(memberDTO!=null) {
	/* 페이지 이동, java 구역임!
	get방식은 정보가 다 나옴 -> 쿠키에 담아서 페이지 이동하기
	response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name, "UTF-8")+"&id="+id);*/

	//쿠키
	/* Cookie cookie = new Cookie("memName", name); //쿠키생성
	cookie.setMaxAge(30*60); //초단위-30분
	response.addCookie(cookie); //클라이언트에게 쿠키값 보내기
	
	Cookie cookie2 = new Cookie("memId", id); //쿠키생성
	cookie.setMaxAge(30*60); //초단위
	response.addCookie(cookie2); //클라이언트에게 쿠키값 보내기
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp"); */
	
	//세션 - 인터페이스 new 불가능
	//HttpSession session = request.getSession(); //세션 생성- JSP는 안에서 내부적으로 내장객체를 만드는데 
												  //그 중에 하나가 session이기 때문에 생성하지 않아도 된다
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	
	//session.setAttribute("memDTO", memberDTO); 위와 같이 세션에 하나하나 담아도 되고 memberDTO자체를 넣어도 됨
	
	response.sendRedirect("loginOk.jsp");
	
}else {
	response.sendRedirect("loginFail.jsp");
} %>

</body>
</html>