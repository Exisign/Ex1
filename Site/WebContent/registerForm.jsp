<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>