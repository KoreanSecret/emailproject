<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute("userVO");
	session.invalidate();
	
	response.sendRedirect("/Email/login/login.jsp");
%>

