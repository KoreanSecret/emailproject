<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script>
   let isNull = function(obj, msg){
	   if(obj.value==''){
		   alert(msg)
		   obj.focus()
		   return true
	   }
	   return false
   }

   let checkForm = function(){
	   let f = document.inputForm
	   
	   if(f.id.value == ''){
		   alert('아이디를 입력해주세요')
		   f.id.focus()
		   return false
	   }
	   if(isNull(f.name, '이름을 입력해주세요')) {
			return false
		}
		
		if(isNull(f.pwd, '비밀번호를 입력해주세요')) {
			return false
		}
		if(isNull(f.phone, '전화번호를 입력해주세요')) {
			return false
		}
		return true
   }


</script>
</head>
<body>
     <div align="center">
     <hr>
     <h2>회원가입페이지</h2>
     <hr>
     <form name="inputForm" action="join.jsp" method="post" onsubmit="return checkForm()">
     <table style="width: 80%" border="1">
     <tr>
        <th width="25%">아이디</th>
        <td>
           <input type="text" name="id" size="80">
           </td>
           </tr>
           <tr>
           <th width="25%">이름</th>
           <td>
           <input type="text" name="name"  size="80">
           </td>
           </tr>
           <tr>
           <th width="25%">비밀번호</th>
           <td>
           <input type="password" name="pwd" size="80">
           </td>
           </tr>
           <tr>
           <th width="25%">전화번호</th>
           <td>
           <input type="text" name="phone" size="18">
           </td>
           </tr>    
		
   
     </table>
     <br>
     <button type="submit">등록</button>
     </form>
     </div>

</body>
</html>