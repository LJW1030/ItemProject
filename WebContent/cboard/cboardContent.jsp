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
		width: 300px;	
		height: 400px;	
		margin: 0 auto;
	}
	#content_form th{
		margin-left: 30px;
	}
	#content_form input:not(.btn), pre{
		border: none;
		width: 180px;
		margin-left: 10px;
	}
	#content_form .btn{
		margin-left: 80px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
		function f(cno){
			location.href = '${conPath}/cboardReplyView.do?cno='+cno+'&pageNum=${param.pageNum}';
		}
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<form id="content_form" action="${conPath }/cboardDelete.do">
		<input type="hidden" name="cno" value="${cboard.cno }">
		<table>
			<caption>${cboard.cid }님 문의글</caption>
			<tr>
				<th>
					ID
				</th>
				<td>
					<input type="text" name="cid" value="${cboard.cid }"
						readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>
					제목
				</th>
				<td>
					<input type="text" name="ctitle" value="${cboard.ctitle }"
						readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>
					내용
				</th>
				<td>
					<pre>${cboard.ccontent}</pre>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn">
					<input type="button" value="목록" class="btn" onclick=history.back()>
					<c:if test="${not empty admin }">
						<input type="button" value="답변" class="btn" onclick="f('${cboard.cno }')">
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>