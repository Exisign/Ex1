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
	<div>
       <%
       Cookie[] cookies = request.getCookies(); %>
       
       <%if(session.getAttribute("power")!=null&&session.getAttribute("power").equals("user")){
    	%><a href="logout.jsp">로그아웃</a><%
       }else{
       %><form action="/LoginAction" method=get>
           <div>
               id : <input type="text" name="id" value="<%
               if(cookies != null && cookies.length > 0){
            		for(int i=0; i<cookies.length; i++){
            			if(cookies[i].getName().equals("cookie_id")){
	       		%><%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %><%}}}%>">
	       		<%/*쿠키에 cookie_id가 있으면, 쿠키의 값을 설정*/ %>
            </div>
            <div>
                pwd :<input type="text" name="pwd">
            </div>
            <div>
                <input type="checkbox" name="check"<%
                		if(cookies != null && cookies.length > 0){
                    		for(int i=0; i<cookies.length; i++){
                    			if(cookies[i].getName().equals("cookie_check")){
        	       		%><%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %><%}}}%>>아이디 기억
        	       		<%/*쿠키에 cookie_check가 있으면, 쿠키의 값 대로 설정*/ %>
            </div>
            <div>
                <input type="submit" name="loginbutton" value="로그인">
                <input type="hidden" name="" value="">
            </div>
       </form><%}%>
       
       <div>
			
       </div>
    </div>
    <div>
    </div>
</body>
</html>