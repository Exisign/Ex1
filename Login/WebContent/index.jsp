<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	System.out.println(session.getId());
	System.out.println(session.getCreationTime());
	System.out.println(session.getLastAccessedTime());
	%>

	<div>
        <span><a href="index.jsp" target="self">HOME</a></span>
        <span><a href="login.jsp">LOGIN</a></span>
        <span><a href="<% %>">게시판</a></span>
    </div>
    <div>

    </div>
</body>
</html>