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
	<form id="content_form">
		<h4>
			<a href="${conPath }/getPost.do">받은 메일함</a>
		</h4>
		<table>
			<caption>보낸 메일함</caption>
			<tr>
				<td>받은이</td>
				<td>제목</td>
				<td>내용</td>
				<td>보낸날짜</td>
			</tr>
			<c:if test="${message.size()==0 }">
				<tr>
					<td colspan="6">보낸 메시지가 없습니다</td>
				</tr>
			</c:if>
			<c:forEach var="msg" items="${messages }">
				<tr>
					<td><input type="text" name="getId" value="${msg.getId }"
						readonly="readonly"></td>
					<td><input type="text" name="etitle" value="${msg.etitle }"
						readonly="readonly"></td>
					<td><input type="text" name="econtent"
						value="${msg.econtent }" readonly="readonly"></td>
					<td><input type="text" name="erdate" value="${msg.erdate }"
						readonly="readonly"></td>
					<td><button
							onclick="location.href='${conPath }/messageDelete.do?eno=${msg.eno}'">삭제</button></td>
				</tr>
			</c:forEach>

		</table>
	</form>
</body>
</html>