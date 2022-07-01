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
		/*
		$('.bt').click(function(){
			var bno = Number($('.bno').text().trim()); // 0번째 td안의 있는 text;
			if(!isNaN(bno)){
				location.href = '${conPath}/boardContent.do?bno='+bno+'&pageNum=${pageNum}';
			}
		});*/
	});
	function fun(bno){
		location.href = '${conPath}/boardContent.do?bno='+bno+'&pageNum=${pageNum}';
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<form id="content_view">
		<table>
			<tr>
				<td>글번호</td>
				<td>글쓴이</td>
				<td>게임</td>
				<td>제목</td>
				<td>가격</td>
				<td>올린 날짜</td>
			</tr>
			<c:if test="${boardList.size()==0 }">
			<tr><td colspan="6">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td><input type="text" name="bno" class="bno" value="${board.bno }"
						readonly="readonly"></td>
					<td><input type="text" name="mid" value=${board.mid }
						readonly="readonly"></td>
					<td><input type="text" name="game" value=${board.game }
						readonly="readonly"></td>
					<td><input type="text" name="btitle" class="bt"
						value=${board.btitle } readonly="readonly" style="cursor: pointer"
						onclick="fun('${board.bno }')"></td>
					<td><input type="text" name="bcost" value=${board.bcost }
						readonly="readonly"></td>
					<td><input type="text" name="brdate"
						value=${board.brdate } readonly="readonly"></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
				[ <a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
		</div>
	</form>
</body>
</html>