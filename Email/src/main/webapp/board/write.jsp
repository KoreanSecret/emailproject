<%@page import="kr.ac.kopo.vo.UserVO"%>
<%@page import="kr.ac.kopo.dao.EmailDAO"%>
<%@page import="kr.ac.kopo.vo.EmailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    UserVO uservo = (UserVO)session.getAttribute("userVO");
  String title = request.getParameter("receiver");
  String receiver = request.getParameter("title");
  String content = request.getParameter("content");
  
 EmailVO email = new EmailVO();
 email.setSender(uservo.getId());
 email.setReceiver(receiver);
 email.setTitle(title);
 email.setContent(content);
 
 System.out.println(email);
 
 
 EmailDAO emailDao = new EmailDAO();
  emailDao.insertEmail(email);
    %>
<script>

	alert('이메일 전송 완료')
	location.href = "sentemail.jsp"

</script>
