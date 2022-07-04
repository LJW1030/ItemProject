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
		<h1>판매등록</h1>
		<hr>
		<form action="${conPath }/boardWriteS.do" method="post"
			enctype="multipart/form-data">
			<table>
				<caption>판매상품</caption>
				<tr>
					<th>카테고리</th>
					<td><input type="text" name="game" required="required">
					</td>
				</tr>
				<tr>
					<th>판매금액</th>
					<td><input type="number" name="bcost" required="required">원
					</td>
				</tr>
				<tr>
					<th>캐릭터명</th>
					<td><input type="text" name="bcname" required="required">(거래를 위한 본인 캐릭터명)</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="btitle" required="required">
					</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td><textarea name="bcontent" rows="5" cols="30"></textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="bphoto"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/main/main.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>