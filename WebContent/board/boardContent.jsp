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
		<form action="${conPath }/MessageView.do">
		<input type="hidden" name="bno" value="${board.bno }">
			<table>
				<caption>${board.bno }글상세보기</caption>
				<tr>
					<th>글쓴이</th>
					<td>${board.mid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${board.btitle }</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${board.bcost }원</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${board.brdate }</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><c:if test="${not empty board.bphoto }">
							<a href="${conPath }/boardPhoto/${board.bphoto}" target="_blank">${board.bphoto}</a>
						</c:if> <c:if test="${empty board.bphoto }">
						 	사진없음
						 </c:if></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><pre>${board.bcontent}</pre></td>
				</tr>

				<tr>
					<td colspan="2"><c:if test="${member.mid eq board.mid }">
							<button
								onclick="location='${conPath}/boardModifyView.do?bno=${board.bno }&pageNum=${param.pageNum }'">수정</button>
						</c:if> <c:if test="${member.mid eq board.mid or not empty admin}">
							<button
								onclick="location='${conPath}/boardDelete.do?bno=${board.bno }&pageNum=${param.pageNum }'">삭제</button>
						</c:if> <c:if test="${!(member.mid eq board.mid) and not empty member }">
							<input type="submit" value="거래신청">
						</c:if> <input type="button" value="목록" class="btn"
						onclick=history.back()></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>