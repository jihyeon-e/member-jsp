<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.ZipcodeDTO"%>
<%@page import="java.util.List"%>

    
<%
//데이터 얻어오기
request.setCharacterEncoding("UTF-8"); //post방식일 때 한글 안깨지게 하기위해

String sido = request.getParameter("sido");
String sigungu = request.getParameter("sigungu");
String roadname = request.getParameter("roadname");

System.out.println(sido +","+ sigungu +","+ roadname);

//DB
List<ZipcodeDTO> list = null;
if(sido!=null && roadname!=null) { //우편번호검색 버튼을 눌렀을 때
	if(sido!="" && roadname!="") { //데이터를 입력안하고 검색 버튼을 눌렀을 때
		MemberDAO memberDAO = MemberDAO.getInstance();
		list = memberDAO.getZipcodeList(sido, sigungu,roadname);
	}
}
%>    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	font-size: 10pt;
}
</style>
</head>
<body>
	<form name="checkPost" method="post" action="checkPost.jsp">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center" width="80">시도</td>
			<td>
				<select name="sido">
					<option>시도선택</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="광주">광주</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select>
			</td>
			<td align="center" width="100">시.군.구</td>
			<td>
				<input type="text" name="sigungu">
			</td>
		</tr>
		
		<tr>
			<td align="center">도로명</td>
			<td colspan="3">
				<input type="text" name="roadname" size="30">
				<input type="submit" value="검색">
			</td>
		</tr>
		
		<tr>
			<td align="center">우편번호</td>
			<td align="center" colspan="3">주소</td>
		</tr>
		
		<%if(list!=null) { %>
			<%for(ZipcodeDTO zipcodeDTO : list) { 
			    String address = zipcodeDTO.getSido()+" "
	  							+zipcodeDTO.getSigungu()+" "
			  					+zipcodeDTO.getYubmyundong()+" "
	  							+zipcodeDTO.getRi()+" "
			  					+zipcodeDTO.getRoadname()+" "
	  							+zipcodeDTO.getBuildingname();
			%>
				<tr>
				  <td align="center"><%=zipcodeDTO.getZipcode() %></td>
				  <td colspan="3">
				  	<a href="#" onclick="checkPostClose('<%=zipcodeDTO.getZipcode()%>','<%=address%>')"><%=address%></a>
			  	  </td>
				</tr>
			<%} %>	
		<%} %>	
	</table>
</form>
<script type="text/javascript">
function checkPostClose(zipcode, address) {
	/* opener.writeForm.zipcode.value=zipcode;
	opener.writeForm.addr1.value=address;
	window.close();
	opener.writeForm.addr2.focus(); */
	//---------------------------------------
	/* opener.document.getElementById("zipcode").value = zipcode; //opener옆에는 form 이름이 들어와야해서 document(현재문서)
	opener.document.getElementById("addr1").value = address;
	window.close();
	opener.document.getElementById("addr2").focus(); */
	//---------------------------------------
	opener.document.forms[0].zipcode.value=zipcode;
	opener.document.forms[0].addr1.value=address;
	window.close();
	opener.document.forms[0].addr2.focus();
}
</script>
</body>
</html>