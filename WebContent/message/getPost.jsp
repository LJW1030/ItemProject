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
		<c:if test="${not empty messageResult }">
			<script>
				alert('${messageResult}');
			</script>
		</c:if>
		<h4>
			<a href="${conPath}/sendPost.do">보낸 메일함</a>
		</h4>
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
			<c:forEach var="msg" items="${messages }">
				<tr>
					<td><input type="text" name="sendId" value="${msg.sendId }"
						readonly="readonly"></td>
					<td><input type="text" name="etitle" value="${msg.etitle }"
						readonly="readonly"></td>
					<td><input type="text" name="econtent"
						value="${msg.econtent }" readonly="readonly"></td>
					<td><input type="text" name="erdate" value="${msg.erdate }"
						readonly="readonly"></td>
					<td><button
							onclick="location.href='${conPath }/MessageReply.do?sendId=${msg.sendId }'">답장</button></td>
					<td><button
							onclick="location.href='${conPath }/messageDelete.do?eno=${msg.eno}'">삭제</button></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>