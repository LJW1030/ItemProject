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
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
	<form action="${conPath }/boardModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bno" value="${board.bno }">
		<input type="hidden" name="dbphoto" value="${board.bphoto }">
		<table>
			<caption>${board.bno }글수정하기</caption>
			<tr>
				<td>글쓴이</td>
				<td>${board.mid}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" required="required"
					size="30" value="${board.btitle }"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="bcost" required="required"
					value="${board.bcost }">원</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${board.brdate }</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="bphoto" class="btn"> <c:if
						test="${not empty board.bphoto }">
						<a href="${conPath }/boardPhoto/${board.bphoto}" target="_blank">${board.bphoto}</a>
					</c:if> <c:if test="${empty board.bphoto }">
						 	사진없음
						 </c:if></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" name="bcontent">${board.bcontent }</textarea></td>
			</tr>

			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="취소" class="btn" onclick=history.back()>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>