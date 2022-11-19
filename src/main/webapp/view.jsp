<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 -실전프로젝트 회원관리 V1</title>
  <link rel="stylesheet" href="member.css">
</head>
<body>

<%
  MemberDAO memberDAO = new MemberDAO();
  String id=request.getParameter("id");
  MemberVO u=memberDAO.getMember(Integer.parseInt(id));
  request.setAttribute("vo",u);
%>

<h1>회원정보 보기</h1>
  <table id="edit">
    <tr>
      <td>User ID:</td><td>${vo.getUserid()}</td>
      </tr>
    <tr>
      <td>Photo:</td><><c:if test="${vo.getPhoto() ne ''}"><br />
      <img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo"></c:if></td>
    </tr>
    <tr>
      <td>Name:</td><td>${vo.getUsername()}</td>
    </tr>
    <tr>
      <td>Gender:</td><td>${vo.getGender()}</td>
    </tr>
    <tr>
      <td>Home:</td><td>${vo.getHome()}</td>
    </tr>
    <tr>
      <td>Email:</td><td>${vo.getEmail()}</td>
    </tr>
  </table>
  <button type="button" onclick="history.back()">뒤로 가기</button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'">수정하기</button>
</body>
</html>
