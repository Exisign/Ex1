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
      <i class="fa fa-search"></i>
    </p>
  </header>

  <!-- Image header -->
  <div class="w3-display-container w3-container">
   	<div class="w3-col s4" >
   		<br>
        <h4>회원가입</h4>
        <p>정보를 입력해주세요.</p>
        <form id="form1" action="/registerAction.jsp" method=get onsubmit="return m_onsubmit()">
        	<p><input class="w3-input w3-border" type="text" placeholder="아이디" name="id" required></p>
        	<p><input class="w3-input w3-border" type="text" placeholder="패스워드" name="pwd" required></p>
			<p><input class="w3-input w3-border" type="text" placeholder="이름" name="name" required></p>
			<p><input class="w3-input w3-border" type="text" placeholder="Email" name="email" required></p>
			<p><input class="w3-input w3-border" type="text" placeholder="주소" name="address" required></p>
			<button type="submit" class="w3-button w3-block w3-black">가입 완료</button>
        </form>
      </div>
    </div>
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

	var form;
	var input = [];
	
	form = document.getElementById('form1');
	input = document.getElementsByTagName('input');
	
	function m_onsubmit(){
	    if(input!=null&&input.length>0){
	        for(var i = 0; i<input.length-1; i++){
	            if(input[i]!=null&&input[i].value===""){
	                alert(input[i].name+"이 비었습니다.");
	                console.log(i);
	                return false;
	            }
	        }
	        return true;           
	    }else{
	        return false;
	    }
	}

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


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
        <form id="form1" action="/registerAction.jsp" method=get onsubmit="return m_onsubmit()">
        	이름 : <input type="text" name="name"><br>
        	ID :  <input type="text" name="id"><br>
        	PWD : <input type="text" name="pwd"><br>
        	Email : <input type="text" name="email"><br>
        	주소 : <input type="text" name="address"><br>
        	<input type="submit" value="회원가입 완료">
        </form>
    </div>
    
     <script>
        var form;
        var input = [];
        
        form = document.getElementById('form1');
        input = document.getElementsByTagName('input');

        function m_onsubmit(){
            if(input!=null&&input.length>0){
                for(var i = 0; i<input.length-1; i++){
                    if(input[i]!=null&&input[i].value===""){
                        alert(input[i].name+"이 비었습니다.");
                        console.log(i);
                        return false;
                    }
                }
                return true;           
            }else{
                return false;
            }
        }
    </script>
</body>
</html> --%>