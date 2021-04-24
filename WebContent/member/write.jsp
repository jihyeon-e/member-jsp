<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="member.dao.MemberDAO"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberDTO" class="member.bean.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO"/>

<%
//DB
MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤으로 DAO생성
int su = memberDAO.write(memberDTO); //개수를 받아옴
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<% 
//응답, out.println 쓰지 말기
if(su==1) { %>
	회원가입 성공!!<br><br>
	<input type="button" value="로그인" onclick="location.href='loginForm.jsp'">
	
<% }else { %>
	"회원가입 실패!!
<% } %>

</body>
</html>