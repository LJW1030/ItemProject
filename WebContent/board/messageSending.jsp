<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/sendMessage.do">
			<table>
				<caption>메시지 보내기</caption>
				<tr>
					<th>보내는이</th>
					<td><input type="text" name="sendId" value="${member.mid }">
					</td>
				</tr>
				<tr>
					<th>받는이</th>
					<td><input type="text" name="getId" value="${board.mid }">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="etitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="econtent" rows="5" cols="32"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="보내기"> 
					<input	type="button" value="취소" onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>