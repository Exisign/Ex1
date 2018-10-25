<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}

		a{
			text-decoration:none;
		}
</style>
<body class="w3-content" style="max-width:1200px">

<%
	boolean session_Check = false;
	
	if(session.getAttribute("power")!=null&&session.getAttribute("power").equals("user")){
		session_Check = true;
	}
	%>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>Bike</b><br><b>Travel</b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    게시판
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      여행<i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="board1.jsp" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>국내 여행</a>
      <a href="board2.jsp" class="w3-bar-item w3-button">해외 여행</a>
    </div>
    <a href="#" class="w3-bar-item w3-button">자전거</a>
    <a href="#" class="w3-bar-item w3-button">대회 정보</a>
  </div>
  <a href="#footer" class="w3-bar-item w3-button w3-padding">Contact</a> 
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding" onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a> 
  <a href="#footer"  class="w3-bar-item w3-button w3-padding">Subscribe</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left"><a href="index.jsp">HOME</a></p>
    <p class="w3-right">
    <%	if(session_Check){
		    %><a href="logout.jsp">로그아웃</a><%
		    	}else{
		    %><a href="registerForm.jsp">회원가입</a><%
		    	}
	        %> 
      <i class="fa fa-search"></i>
    </p>
  </header>

  <!-- Image header -->
  <div class="w3-display-container w3-container">
   	<div class="w3-col s4" >
   		<br>
        <h4>로그인</h4>
        <p>아이디와 비밀번호를 입력해주세요.</p>
        
        <%
       Cookie[] cookies = request.getCookies();
   	
        String cookie_id_str = "";
        String cookie_check_str = "";
        
        if(cookies != null && cookies.length > 0){
       		for(int i=0; i<cookies.length; i++){
       			if(cookies[i].getName().equals("cookie_id")){
       				cookie_id_str = URLDecoder.decode(cookies[i].getValue(), "utf-8");
       			}
       			if(cookies[i].getName().equals("cookie_check")){
       				cookie_check_str = URLDecoder.decode(cookies[i].getValue(), "utf-8");
       			}
       		}
        }
        
   		if(session.getAttribute("power")!=null&&session.getAttribute("power").equals("user")){
    	%><a href="logout.jsp">로그아웃</a><%    			
    			}else{
       %><form action="/LoginAction" method=get>
        	<p><input class="w3-input w3-border" type="text" placeholder="아이디" name="id" value="<%=cookie_id_str%>" required></p>
        	<p><input class="w3-input w3-border" type="text" placeholder="패스워드" name="pwd" required></p>
			<p><input type="checkbox" name="check" <%=cookie_check_str%>>아이디 기억</p>
			<input type="hidden" name="url" value="<%=session.getAttribute("url")%>">
			<button type="submit" class="w3-button w3-block w3-black">로그인</button>
        </form><%}%>
      </div>
   	
   <%-- 	<%
       Cookie[] cookies = request.getCookies();
   	
   		if(session.getAttribute("power")!=null&&session.getAttribute("power").equals("user")){
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
                <input type="hidden" name="url" value="<%=session.getAttribute("url")%>">
            </div>
       </form><%}%> --%>
       
       <div>
			
       </div>
    </div>
    <div>
    <!-- <img src="./image/back_bike.jpg" alt="Jeans" style="width:100%">
    <div class="w3-display-topleft w3-text-white" style="padding:24px 48px">
      <h1 class="w3-jumbo w3-hide-small">여행 후기
      </h1>
      <h1 class="w3-hide-large w3-hide-medium">New arrivals</h1>
      <h1 class="w3-hide-small">2018년 모음</h1>
      <p><a href="#jeans" class="w3-button w3-black w3-padding-large w3-large">구경 가기</a></p>
    </div> -->
 
  </div>


  <!-- Footer
  <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
      <div class="w3-col s4">
        <h4>Contact</h4>
        <p>Questions? Go ahead.</p>
        <form action="/action_page.php" target="_blank">
          <p><input class="w3-input w3-border" type="text" placeholder="Name" name="Name" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Email" name="Email" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Subject" name="Subject" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Message" name="Message" required></p>
          <button type="submit" class="w3-button w3-block w3-black">Send</button>
        </form>
      </div>

      <div class="w3-col s4">
        <h4>About</h4>
        <p><a href="#">About us</a></p>
        <p><a href="#">We're hiring</a></p>
        <p><a href="#">Support</a></p>
        <p><a href="#">Help</a></p>
      </div>

      <div class="w3-col s4 w3-justify">
        <h4>Store</h4>
        <p><i class="fa fa-fw fa-map-marker"></i>개인용 사이트</p>
        <p><i class="fa fa-fw fa-phone"></i> 01049922419</p>
        <p><i class="fa fa-fw fa-envelope"></i> exisign777@gmail.com</p>
        <h4>We accept</h4>
        <br>
        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
      </div>
    </div>
  </footer> -->

  <!-- <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div> -->

  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>

<script>
// Accordion 
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>





<%-- <body>
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
                <input type="hidden" name="url" value="<%=session.getAttribute("url")%>">
            </div>
       </form><%}%>
       
       <div>
			
       </div>
    </div>
    <div>
    </div>
</body> --%>
