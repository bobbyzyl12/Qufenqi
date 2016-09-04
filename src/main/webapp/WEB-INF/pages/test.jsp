<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<form id="registerForm" action="${ctx}/goods/addPicture" method="post" enctype="multipart/form-data">  
        上传头像 <input type="file" id="uploadPhoto" name="uploadPhoto1">
        <input type="submit">
</form>

<img src="${ctx}/goods/readPicture?pictureID=3"/> 

 </body>
</html>