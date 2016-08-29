<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="${ctx}/page/addPicture" method="post" enctype="multipart/form-data">        
    <table>  
        <tr>  
            <td width="100" align="right">照片：</td>  
            <td><input type="file" name="studentPhoto"/></td>  
        </tr>  
    </table>  
    <input type="submit">  
</form>  
</body>
</html>