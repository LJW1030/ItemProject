<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<form id="content_view">
		<table>
			<tr>
				<th>구매자</th>
				<th>판매자</th>
				<th>거래내용</th>
			<tr>
			<c:forEach var="sTrade" items="${sTrades }">
			<tr>
				<td>
					<input type="text" name="bid" value="${sTrade.bid }(나)" readonly="readonly">
				</td>
				<td>
					<input type="text" name="sid" value="${sTrade.sid }" readonly="readonly">
				</td>
				<td>
					<input type="text" name="btitle" value="${sTrade.btitle }" readonly="readonly">
				</td>
			</tr>
		</c:forEach>
		</table>
	</form>
</body>
</html>