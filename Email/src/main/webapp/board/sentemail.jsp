<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.vo.UserVO"%>
<%@page import="kr.ac.kopo.vo.EmailVO"%>
<%@page import="kr.ac.kopo.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <%
    request.setCharacterEncoding("utf-8");

	UserVO uservo = (UserVO)session.getAttribute("userVO");
	List<EmailVO> emailList = new ArrayList<>();

	pageContext.setAttribute("emailList", emailList);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email/resources/css/layout.css">
<link rel="stylesheet" href="/Email/resources/css/table.css">
<script>
      let doAction = function(type){
    	  switch(type) {
    	  case 'L' :
    		  location.href = "receivemail.jsp"
    		  break
    	  case 'D' :
    		  location.href = "deletemail.jsp?no=${param.no}"
    				  break
    	  }
      }
</script>
</head>
<body>
     <header>
     
		<jsp:include page="/include/topMenu.jsp" />
     </header>
     <section>
     <div align="center">
		<br>
		<hr>
		<h2>보낸메일</h2>
		<hr>
		<br>
		<table border="1" style="width:100%;" class="listodd">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="17%">받은사람</th>
				<th width="20%">등록일</th>
			
			</tr>
			<c:forEach items="${ emailList }" var="email">
				<tr>
					<td>${ email.receiver}</td>
					<td>
						<a href="javascript:goDetail(${ email.no })">
							<c:out value="${ email.title }"/>
						</a>
					
						
					</td>
					<td>${ email.sender }</td>
					<td>${ email.regDate }</td>
				</tr>
				</c:forEach>
     </section>
     <div align="center">
     <br>
     <hr>
     <h2></h2>
     </div>


</body>
</html>