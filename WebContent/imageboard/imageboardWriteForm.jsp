<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
</head>
<body>
<form name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="imageboardWrite.jsp">
<h3>이미지 업로드 게시글</h3>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
  	<td align="center" width="100">상품코드</td>
  	<td>
  		<input type="text" name="imageId" size="35" value="img_">
  	</td>
  </tr>
  
  
  <tr>
  	<td align="center">상품명</td>
  	<td>
  		<input type="text" name="imageName" size="45" placeholder="상품명 입력">
  	</td>
  </tr>
  
  
  <tr>
  	<td align="center">단가</td>
  	<td>
  		<input type="text" name="imagePrice" size="30" placeholder="단가 입력">
  	</td>
  </tr>
  
  
  <tr>
  	<td align="center">개수</td>
  	<td>
  		<input type="text" name="imageQty" size="30" placeholder="개수 입력">
  	</td>
  </tr>
  
  
 <tr>
 	<td align="center">내용</td>
 	<td>
 		<textarea name="imageContent" cols="50" rows="15" placeholder="내용입력"></textarea>
 	</td>
 </tr>
 
 
 <tr>
 	<td colspan="2">
 		<input type="file" name="image1" size="50" value="선택된 파일 없음">
 	</td>
 </tr>
 
 
 <tr>
 	<td colspan="2" align="center">
 		<input type="submit" value="이미지등록"> <!-- submit을 타고 가는 데이터는 name 속성을 가지고 넘어감 -->
 		<input type="reset" value="다시작성">
 	</td>
 </tr>
 
</table>
</form>
</body>
</html>