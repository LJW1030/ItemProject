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
	<form id="content_view" action="${conPath }/MessageReply.do">
		<table>
			<caption>받은 메일함</caption>
			<tr>
				<td>보낸이</td>
				<td>제목</td>
				<td>내용</td>
				<td>받은날짜</td>
			</tr>
			<c:if test="${message.size()==0 }">
				<tr>
					<td colspan="6">받은 메시지가 없습니다</td>
				</tr>
			</c:if>
			<c:forEach var="msg" items="${message }">
				<tr>
					<td><input type="text" name="sendId" value="${msg.sendId }"
						readonly="readonly"></td>
					<td><input type="text" name="etitle" value="${msg.etitle }"
						readonly="readonly"></td>
					<td><input type="text" name="econtent"
						value="${msg.econtent }" readonly="readonly"></td>
					<td><input type="text" name="erdate" value="${msg.erdate }"
						readonly="readonly"></td>
					<td><input type="submit" value="답장"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>