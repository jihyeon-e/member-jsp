<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.bean.MemberDTO"
						 import="member.dao.MemberDAO" %>

<%
//데이터
//request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("memId"); //세션으로부터 아이디 얻어오기

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.getMember(id);

%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
  <form name="modifyForm" method="post" action="modify.jsp">
  <h3>회원정보 수정</h3>
  	<table border="1" cellpadding="5" cellspacing="0">
  	  <tr>
  	  	<td align="center" width="100">이름</td>
  	  	<td>
  	  		<input type="text" name="name" value="<%=memberDTO.getName()%>">
  	  		<div id="nameDiv"></div>
  	  	</td>
  	  </tr>
  	
  	
  	  <tr>
  	  	<td align="center">아이디</td>
  	  	<td>
  	  		<input type="text" name="id" value="<%=id%>" readonly>
  	  	</td>
  	  </tr>
  	
  	
  	  <tr>
  	  	<td align="center">비밀번호</td>
  	  	<td>
  	  		<input type="password" name="pwd">
  	  		<div id="pwdDiv"></div>
  	  	</td>
  	  </tr>
  	  
  	  
  	  <tr>
  	  	<td align="center">재확인</td>
  	  	<td>
  	  		<input type="password" name="repwd">
  	  		<div id="repwdDiv"></div>
  	  	</td>
  	  </tr>
  	  
  	  <tr>
  	  	<td align="center">성별</td>
  	  	<td>
  	  		<input type="radio" name="gender" value="0" >남 <!-- radio은 항상 배열로 값을 끌고옴 -->
  	  		<input type="radio" name="gender" value="1" >여
  	  	</td>
  	  </tr>
  	  
  	  
  	  <tr>
  	  	<td align="center">이메일</td>
  	  	<td>
  	  		<input type="text" name="email1" value="<%=memberDTO.getEmail1()%>">@
  	  		<input type="email" list="email2" name="email2">
	 		<datalist id="email2">
	 			<option value="gmail.com">
	 			<option value="hanmail.net">
	 			<option value="naver.com">
	 		</datalist>
  	  	</td>
  	  </tr>
  	  
  	  
  	  <tr>
	 	<td align="center">핸드폰</td>
	 	<td>
	 		<select name="tel1" id="tel1" style="width:70px;">
	 			<option value="010">010</option>
	 			<option value="011">011</option>
	 			<option value="019">019</option>
	 		</select>-
	 		<input type="text" name="tel2" size="5" value="<%=memberDTO.getTel2()%>">-
	 		<input type="text" name="tel3" size="5" value="<%=memberDTO.getTel3()%>">
	 	</td>
	 </tr>
	 
	 
	 <tr>
	 	<td align="center">주소</td>
	 	<td>
	 		<input type="text" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode()%>" readonly>
	    <input type="button" value="우편번호검색" onclick="checkPost()"><br>
	    <input type="text" name="addr1" id="addr1" placeholder="주소" size="50" value="<%=memberDTO.getAddr1()%>" readonly><br>
	    <input type="text" name="addr2" id="addr2" placeholder="상세주소" value="<%=memberDTO.getAddr2()%>" size="50">
	 	</td>
	 </tr>
	 
	 
	 <tr>
	 	<td colspan="2" align="center">
	 		<input type="button" value="회원정보 수정" onclick="javascript:checkModify()">
	 		<input type="reset" value="다시작성" onclick="location.reload()">
	 	</td>
	 </tr>
  	</table>
  
  </form>
  <script src="../js/member.js"></script>
  <script type="text/javascript">
  	window.onload = function() { //window.onload 파일을 열자마자
  		//document.modifyForm.gender[1].checked = true; // 여자에 무조건 체크됨
  		document.modifyForm.gender["<%=memberDTO.getGender()%>"].checked = true;
		document.modifyForm.email2.value = "<%=memberDTO.getEmail2()%>";
  		document.modifyForm.tel1.value = "<%=memberDTO.getTel1()%>";
  	}
  </script>
</body>
</html>