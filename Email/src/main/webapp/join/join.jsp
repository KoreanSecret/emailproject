
<%@page import="kr.ac.kopo.dao.UserDAO"%>
<%@page import="kr.ac.kopo.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("utf-8");

//1단계
     String id = request.getParameter("id");
     String name = request.getParameter("name");
     String pwd = request.getParameter("pwd");
     String phone = request.getParameter("phone");
     
     

     UserVO user = new UserVO();
     user.setId(id);
     user.setName(name);
     user.setPwd(pwd);
     user.setPhone(phone);

//2단계
      UserDAO userdao = new UserDAO();
      userdao.insertUser(user);
      
      
      %>
      
      <script>
      //3단계
      alert('회원가입이 완료되었습니다')
      location.href = "/Email/login/login.jsp"
      </script>













%>
