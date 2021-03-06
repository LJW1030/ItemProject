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
		width:800px;
		margin: 80px auto;
		border-collapse: collapse;
	}
	#content_form caption{
		margin: 40px auto;
	}
	#content_form tr{
		border-bottom: 1px solid;
		height:50px;
		width:100px;
	}
	#content_form .td1{
		text-align: center;
	}
	#content_form .title{
		width:300px;
	}
	#content_form .paging{
		text-align: center;
	}
	#content_form input:not(.btn){
		border:none;
	}
	#content_form .t1{
		border: none;
	}
	#content_form input[type=submit]{
		margin: 100px 0 50px 0;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
		function ft(cno){
			location.href = '${conPath}/cboardContent.do?cno='+cno+'&pageNum=${pageNum}';
		}
	</script>
</head>
<body>
<c:if test="${empty member and empty admin }">
	<script>
		alert('${boardResult }');
		location.href="${conPath }/loginView.do";
	</script>
</c:if>
<jsp:include page="../main/header.jsp" />
	<form id="content_form" action="${conPath }/cboardWriteView.do">
				<input type="hidden" name="cno" value="${cboard.cno }">
		<c:if test="${not empty member and empty admin }">
		<table>
			<caption>${member.mid}님 문의글</caption>
			<tr>
				<td>분류</td>
				<td>ID</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>
			<c:if test="${cboardList.size()==0 }">
			<tr><td colspan="6" class="td1">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:set var="i" value="1"/>
			<c:forEach var="cboard" items="${cboardList }">
				<tr>
					<td><input type="text" value="문의글"
						readonly="readonly"></td>
					<td><input type="text" name="cid"value=${cboard.cid }
						readonly="readonly"></td>
					<td><input type="text" name="ctitle" class="title"value=${cboard.ctitle }
						readonly="readonly" style="cursor: pointer"
						onclick="ft('${cboard.cno }')"></td>
					<td><input type="text" name="crdate"
						value=${cboard.crdate } readonly="readonly"></td>
				</tr>
			</c:forEach>
			<tr class="t1">
				<td colspan="4">
					<input type="submit" value="글쓰기" class="btn">
				</td>
			</tr>
		</table>
		</c:if>
		<c:if test="${empty member and not empty admin }">
		<table>
			<tr>
				<td>분류</td>
				<td>ID</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>
			<c:if test="${cboardList.size()==0 }">
			<tr><td colspan="6" class="td1">등록된 글이 없습니다</td></tr>
			</c:if>
			<c:set var="i" value="1"/>
			<c:forEach var="cboard" items="${cboardList }">
				<tr>
					<td><input type="text" value="문의글"
						readonly="readonly"></td>
					<td><input type="text" name="cid" value=${cboard.cid }
						readonly="readonly"></td>
					<td><input type="text" name="ctitle" value=${cboard.ctitle }
						readonly="readonly" style="cursor: pointer"
						onclick="ft('${cboard.cno }')"></td>
					<td><input type="text" name="crdate"
						value=${cboard.crdate } readonly="readonly"></td>
				</tr>
			</c:forEach>
			<tr class="t1">
				<td colspan="4">
					<input type="submit" value="글쓰기" class="btn">
				</td>
			</tr>
		</table>
		</c:if>
		<div class="paging">
		
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/cboardList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
				[ <a href="${conPath }/cboardList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/cboardList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>