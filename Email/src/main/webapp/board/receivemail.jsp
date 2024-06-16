<%@page import="kr.ac.kopo.vo.EmailVO"%>
<%@page import="kr.ac.kopo.dao.UserDAO"%>
<%@page import="kr.ac.kopo.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="kr.ac.kopo.util.ConnectionFactory" %>    
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
request.setCharacterEncoding("utf-8");

	UserVO uservo = (UserVO) session.getAttribute("userVO");
	List<EmailVO> emailList = new ArrayList<>();
	
	StringBuilder sql = new StringBuilder();
	sql.append("SELECT no, sender, receiver, title, content, TO_CHAR(reg_date, 'yyyy-mm-dd') reg_date ");
	sql.append("FROM t_email ");
	sql.append("WHERE sender = ? OR receiver = ? ");
	sql.append("ORDER BY no DESC");
	try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
		pstmt.setString(1, uservo.getId());
        pstmt.setString(2, uservo.getId());	
        
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
		        int no = rs.getInt("no");
		        String title = rs.getString("title");
		        String sender = rs.getString("sender");
		        String regDate = rs.getString("reg_date"); 

		        EmailVO email = new EmailVO(no, title, sender, regDate);
		        emailList.add(email);
		    }
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	
	
	// 공유영역 등록
	pageContext.setAttribute("emailList", emailList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email/resources/css/layout.css">
<link rel="stylesheet" href="/Email/resources/css/table.css">

<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	
	
	
	let goDetail = function(emailNo) {
		<c:if test="${ not empty userVO }">
			location.href = 'detail.jsp?no='+ userNo
		</c:if>
			
		<c:if test="${ empty userVO }">
			if(confirm('로그인 후 사용가능합니다\n로그인페이지로 이동하시겠습니가?'))
				location.href = '/Email/login/login.jsp'
		</c:if>
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
		<h2>전체게시글</h2>
		<hr>
		<br>
		<table border="1" style="width:100%;" class="listodd">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="17%">보낸사람</th>
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
		</table>
		<br>
		
	</div>
	</section>
	
</body>
</html>











