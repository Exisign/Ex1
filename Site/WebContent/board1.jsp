<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String this_url = "?url=board1.jsp";
	
	if(session.getAttribute("power")!=null&&!session.getAttribute("power").equals("user")){
		response.sendRedirect("login.jsp"+this_url);
	} 
	%>
	<div>
		<span><a href="index.jsp" target="self">HOME</a></span>
	    <span><a href="logout.jsp">로그아웃</a></span>
    </div>
    <div>
    	<span>게시판 입니다.</span>
    </div>
	
	
</body>
</html>