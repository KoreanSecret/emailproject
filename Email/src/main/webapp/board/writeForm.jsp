<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 작성</title>
<link rel="stylesheet" href="/Email/resources/css/layout.css">
<link rel="stylesheet" href="/Email/resources/css/table.css">
<script>

let checkForm = function() {
	let f = document.inputForm
	if (isNull(f.title, '제목을 입력해주세요')) {
		return false
	}
	if (isNull(f.receiver, '받는이를 입력해주세요')) {
		return false
	}
	if (isNull(f.contents, '내용을 입력해주세요')) {
		return false
	}
	if (checkReceiver(f.sender, f.receiver)) {
		return false
	}

	return true
}
   let checkReceiver = function(sender, receiver) {
		if (sender.value == receiver.value) {
			alert('자기 자신에게 보낼수없습니다')
			receiver.focus()
			return true
		}
	}

</script>
</script>
<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h2>메일쓰기</h2>
		<hr>
		<form name="inputForm" action="write.jsp" method="post" 
			  onsubmit="return checkForm()">
			<input type="hidden" name="writer" value="${ userVO.id }" >
			<table style="width: 100%" border="1">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" name="title" size="80">
					</td>
				</tr>
				<tr>
					<th width="25%">받는사람</th>
					<td>
					<input type="text" name="receiver" size="80">
						<c:out value="${ userVO.id }" />
				
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="80" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">메일 전송</button>
		</form>
	</div>
	</section>
	</div>
	
</body>
</html>















