<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page import="com.example.dao.MemberDAO" %>
<%@ page import="com.example.bean.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 - 실전프로젝트 회원관리 V1</title>
	<link rel="stylesheet" href="member.css">
</head>
<body>
<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");
	MemberVO u=memberDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>회원 정보 수정</h1>

<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
<table id="edit">
	<tr>
		<td>User ID:</td><td><input type="text" name="userid" value=" <%=u.getUserid() %>" /></td>
	</tr>
	<tr>
		<td>Photo:</td><td><input type="file" name="photo" value="<%=u.getPhoto() %>" />
		<c:if test="{vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo"></c:if></td>
    </tr>
	<tr>
		<td>Name:</td><td><input type="text" name="username" value=" <%=u.getUsername() %>" /></td>
	</tr>
	<tr>
		<td>Gender:</td><td><input type="text" name="gender" value="<%=u.getGender() %>"></td>
	</tr>
	<tr>
		<td>Home:</td><td><input type="text" name="gender" value="<%=u.getHome() %>"></td>
	</tr>
	<tr>
		<td>Email:</td><td><input type="text" name="gender" value="<%=u.getEmail() %>"></td>
	</tr>
</table>
	<button type="button" onclick="history.back()">뒤로 가기</button>
	<button type="submit">회원정보 수정</button>
</form>
</body>
</html>