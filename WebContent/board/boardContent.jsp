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
		<table>
			<caption>${board.bno }글상세보기</caption>
			<tr>
				<td>글쓴이</td>
				<td>${board.mid}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${board.btitle }</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${board.bcost }</td>
			</tr>
			<tr>
				<td>등록일</td>
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
				<td>내용</td>
				<td><pre>${board.bcontent}</pre></td>
			</tr>
			
			<tr>
				<td colspan="2"><c:if test="${member.mid eq board.mid }">
						<button
							onclick="location='${conPath}/boardModifyView.do?bno=${board.bno }&pageNum=${param.pageNum }'">수정</button>
					</c:if> <c:if test="${member.mid eq board.mid or not empty admin}">
						<button
							onclick="location='${conPath}/boardDelete.do?bno=${board.bno }&pageNum=${param.pageNum }'">삭제</button>
					</c:if> <c:if test="${not empty member }">
						<button
							onclick="location='${conPath}/MessageView.do?bno=${board.bno }&pageNum=${param.pageNum }'">거래신청</button>
					</c:if> <input type="button" value="목록" class="btn" onclick=history.back()>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>