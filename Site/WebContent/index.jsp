<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String this_url = "?url=home.jsp";

	boolean session_Check = false;
	
	if(session.getAttribute("power")!=null&&session.getAttribute("power").equals("user")){
		session_Check = true;
	}
	%><div>
        <span><a href="index.jsp" target="self">HOME </a></span><%
        if(session_Check){
    %><span><a href="login.jsp<%=this_url%>">LOGIN</a></span><%
    		}else{
    %><span><a href="logout.jsp<%=this_url%>">로그아웃</a></span><%
    		} %>
        <span><a href="board1.jsp<%=this_url%>">게시판1</a></span>
        <span><a href="board2.jsp<%=this_url%>">게시판2</a></span>
        <span><a href="registerForm.jsp<%=this_url%>">회원가입</a></span>
    </div>
    <div>

    </div>
</body>
</html>