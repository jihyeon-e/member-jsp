<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
    
<%
//데이터 받아오기
request.setCharacterEncoding("UTF-8");

String realFolder = request.getServletContext().getRealPath("/storage");

System.out.println("실제폴더 = " + realFolder);

//업로드
MultipartRequest multi = new MultipartRequest(request,
		  									  realFolder,
											  5*1024*1024,
											  "UTF-8");

String imageId = multi.getParameter("imageId");
String imageName = multi.getParameter("imageName");
int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
String imageContent = multi.getParameter("imageContent");

String image1 = multi.getOriginalFileName("image1");
//File file = multi.getFile("image1");

ImageboardDTO imageboardDTO = new ImageboardDTO();
imageboardDTO.setImageId(imageId);
imageboardDTO.setImageName(imageName);
imageboardDTO.setImagePrice(imagePrice);
imageboardDTO.setImageQty(imageQty);
imageboardDTO.setImageContent(imageContent);
imageboardDTO.setImage1(image1);
//System.out.println(imageboardDTO.getImage1());

//String id = (String)session.getAttribute("memId");

ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
imageboardDAO.imgboardWrite(imageboardDTO);


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
	alert("작성하신 글을 저장하였습니다.");
	location.href="imageboardList.jsp?pg=1";
}
</script>
</body>
</html>