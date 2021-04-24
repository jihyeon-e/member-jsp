<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" enctype="multipart/form-data" action="fileUpload.jsp">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
  	  	<td align="center" width="100">제목</td>
  	  	<td>
  	  		<input type="text" name="subject" id="subject" size="50">
  	  	</td>
  	  </tr>
  
  
  	  <tr>
  	  	<td align="center" width="100">내용</td>
  	  	<td>
  	  		<textarea name="content" id="content" cols="55" rows="15"></textarea>
  	  	</td>
  	  </tr>
  	  
  	  <tr>
  	  	<td colspan="2">
  	  		<input type="file" name="upload1" size="50">
  	  	</td>
  	  </tr>
  	  
  	  <tr>
  	  	<td colspan="2">
  	  		<input type="file" name="upload2" size="50">
  	  	</td>
  	  </tr>
  	  
  	  <tr>
  	  	<td colspan="2" align="center">
  	  		<input type="submit" value="업로드하기">
  	  		<input type="reset" value="취소">
  	  	</td>
  	  </tr>
</table>
</form>
</body>
</html>