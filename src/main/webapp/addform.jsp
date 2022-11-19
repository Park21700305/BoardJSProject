<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="member.css">
</head>
<body>

<h1>Add New Post</h1>
<form action="add_ok.jsp" method="post" enctype="multipart/form-data">
<table>
    <tr><td>UserID:</td><td><input type="text" name="userid"/></td></tr>
    <tr><td>Photo:</td><td><input type="file" name="photo"/></td></tr>
<tr><td>UserName</td><td><input type="text" name="username"/></td></tr>
    <tr><td>Gender</td><td><input type="text" name="gender"/></td></tr>
    <tr><td>Home</td><td><input type="text" name="home"/></td></tr>
    <tr><td>Email</td><td><input type="text" name="email"/></td></tr>

<tr><td><a href="list.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
</table>
</form>

</body>
</html>