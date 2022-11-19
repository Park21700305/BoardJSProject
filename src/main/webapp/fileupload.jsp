<%--
  Created by IntelliJ IDEA.
  User: Park
  Date: 2022/11/18
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.example.common.*,java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
    <title>파일 업로드 결과 </title>
</head>
<body>
<%
  String filename = "";
  int sizeLimit = 15 * 1024 * 1024;
  String realPath = request.getServletContext().getRealPath("upload");
  File dir = new File(realPath);
  if(!dir.exists()) dir.mkdirs();

  MultipartRequest multipartRequest = new MultipartRequest(request, realPath,
          sizeLimit, "utf-8", new DefaultFileRenamePolicy());
  filename = multipartRequest.getFilesystemName("photo");

%>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
