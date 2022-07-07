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
<style>
	#content_form table{
		width:80%;	
		margin:0 auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<table>
			<tr>
				<th>판매자</th>
				<th>구매자</th>
				<th>거래내용</th>
			<tr>
		<c:forEach var="sTrade" items="${sTrades }">
			<tr>
				<td>
					<input type="text" name="sid" value="${sTrade.sid }(나)" readonly="readonly">
				</td>
				<td>
					<input type="text" name="bid" value="${sTrade.bid }" readonly="readonly">
				</td>
				<td>
					<input type="text" name="btitle" value="${sTrade.btitle }" readonly="readonly">
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>