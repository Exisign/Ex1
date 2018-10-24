<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberInfo" class="login.Member" scope="request"/>
<%-- <jsp:setProperty name="memberInfo" property="name" param="name"/>
<jsp:setProperty name="memberInfo" property="id" param="id"/>
<jsp:setProperty name="memberInfo" property="email" param="email"/>
<jsp:setProperty name="memberInfo" property="address" param="address"/> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <jsp:getProperty name="memberInfo" property="name"/><br>
	id : <jsp:getProperty name="memberInfo" property="id"/><br>
	email : <jsp:getProperty name="memberInfo" property="email"/><br>
	주소 : <jsp:getProperty name="memberInfo" property="address"/><br>
</body>
</html>