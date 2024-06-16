<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email/resources/css/layout.css">
<link rel="stylesheet" href="/Email/resources/css/table.css">
<script src="/Email/resources/js/myJS.js"></script>


<script>
   let checkForm = function(){
	   
	   let f = document.loginForm
	   
	   if(isNull(f.id, '아이디를 입력하세요'))
		   return false
		   
	   if(isNull(f.password, '패스워드를 입력하세요'))
		   return false
		   
		   return true
   }
</script>

</head>
<body>
     <header>
     <jsp:include page="/include/topMenu.jsp"/>
     </header>
     <section>
     <div align="center">
     <br>
     <hr>
     <h2>로그인</h2>
     <hr>
     <br>
     <form action="loginprocess.jsp" method="post" name="loginForm"
     onsubmit="return checkForm()">
     <table style="width: 40%">
      <tr>
   <th>ID</th>
   <td><input type="id" name="id"></td>
   </tr>
   <tr>
   <th>PASSWORD</th>
   <td><input type="password" name="password"></td>
   </tr>
   </table>
   <button>로그인</button>
   </form>
     </div>
     
     </section>
     
</body>
</html>