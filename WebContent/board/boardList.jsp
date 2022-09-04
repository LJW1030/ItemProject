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
<style>
	#content_form{
		width:1000px;
	}
	
	#content_form table{
		width:1000px;
		margin:30px auto;
		border-collapse: collapse;
	}
	#content_form table #tr1{
		background-color: #159efd;
		color:white;
		text-align: center;
		height:50px;
		font-size: 0.8em;
	}
	#content_form table #tr2{
		border-bottom: 1px solid #159efd;
	}
	#content_form table #tr1 td{
		width:70px;
		text-align: center;
		line-height: 50px;
		font-size: 1.2em;
	}
	#content_form table #tr2 td{
		height:50px;
		width:70px;
		line-height: 50px;
		text-align: center;
		
	}
	#content_form table #tr2 td:last-child{
		width:150px;
	}
	.bt{
		width:400px;
		border:none;
		font-size: large;
		margin-left: 20px;
	}
	#t{
		border:none;
		text-align: center;
		font-size: medium;
		width:100px;
		font-size: 0.8em;
	}
	#g{
		border:none;
		text-align: center;
		font-size: medium;
		width:150px;
		font-size: 0.8em;
	}
	table caption{
		font-weight: bold;
		font-size: 2em;
		margin: 20px 0;
		text-align: left;
	}
	#content_form .paging {
	text-align: center;
	}
	#content_form .no{
		text-align: center;
	}
	b{
		color: red;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(document).ready(function() {
		
	});
	function func(bno){
		location.href = '${conPath}/boardContent.do?bno='+bno+'&pageNum=${pageNum}&game=${param.game}&bbs=${param.bbs}';
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<form id="content_form">
		<table>
			<c:if test="${param.bbs eq 's' }">
				<caption style="color: green">팝니다</caption>
			</c:if>
			<c:if test="${param.bbs eq 'b' }">
				<caption style="color: #d15757">삽니다</caption>
			</c:if>
			<tr id="tr1">
				<td>글번호</td>
				<td>글쓴이</td>
				<td>게임</td>
				<td class="bt">제목</td>
				<td>가격</td>
				<td>올린 날짜</td>
			</tr>
			<c:if test="${boardList.size()==0 }">
			<tr class="no"><td colspan="6">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:forEach var="board" items="${boardList }">
				<tr id="tr2">
					<td><input type="text" name="bno" id="t" class="bno" value="${board.bno }"
						readonly="readonly"></td>
					<td><input type="text" name="mid" id="t" value="${board.mid }"
						readonly="readonly"></td>
					<td><input type="text" name="game" id="g" value="${board.game }"
						readonly="readonly"></td>
					<td><input type="text" name="btitle" class="bt"
						value="${board.btitle }" readonly="readonly" style="cursor: pointer"
						onclick="func('${board.bno }')"></td>
					<td><input type="text" name="bcost" id="t" value="${board.bcost }"
						readonly="readonly"></td>
					<td><input type="text" name="brdate" id="t"
						value="${board.brdate }" readonly="readonly"></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
		
			<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}&game=${param.game}&bbs=${param.bbs}"> 이전 </a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
				<input type="hidden" name="game" value="${board.game }">
				<input type="hidden" name="bbs" value="${board.bbs }">
				[ <a href="${conPath }/boardList.do?pageNum=${i}&game=${param.game}&bbs=${param.bbs}"> ${i } </a> ]
			</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}&game=${param.game}&bbs=${param.bbs}"> 다음 </a> ]
		</c:if>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>