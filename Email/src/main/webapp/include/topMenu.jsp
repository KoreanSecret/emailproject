<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2">
			<a href="/Email">
			<div style="height:45px; width:200px;text-align: center;">LOGO</div>
			</a>
		</td>
		<td align="right">
			<c:if test="${ not empty userVO }">
				[${ userVO.name }(${ userVO.id })님으로 로그인중...]
			</c:if>
			<c:if test="${ empty userVO }">
				GUEST...
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:choose>
			<c:when test="${ empty userVO }"> 
			 <a href="/Email/join/joinprocess.jsp">회원가입 |</a>
			<a href="/Email/login/login.jsp">로그인</a> | 
			</c:when>
			
			<c:otherwise>
				<a href="/Email/board/writeForm.jsp">메일쓰기</a> |
				<a href="/Email/board/receivemail.jsp">받은메일함</a> |
				<a href="/Email/board/sentemail.jsp">보낸메일함</a>	|	
				<a href="/Email/board/deletemail.jsp">휴지통</a> |
				<a href="/Email/login/logout.jsp">로그아웃</a> |
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>








