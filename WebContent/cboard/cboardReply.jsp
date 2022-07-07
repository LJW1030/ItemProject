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
	#content_form table{
		width:400px;
		height:500px;
		margin:0 auto;
		border-collapse: collapse;
	}
	#content_form input:not(.btn){
		border: none;
		width:200px;
		margin-left: 20px;
	}
	#content_form textarea{
		width:300px;
		height:100px;
		border: none;
		margin: 0 0 0 20px;
	}
	#content_form tr{
		border-bottom: 1px solid;
	}
	#content_form .t1{
		border: none
	}
	#content_form .btn{
		margin-left: 110px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/cboardReply.do?pageNum=${param.pageNum}" method="post">
			<input type="hidden" name="cref" value="${cboard.cref }"> <input
				type="hidden" name="cre_step" value="${cboard.cre_step }"> <input
				type="hidden" name="cre_level" value="${cboard.cre_level }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${cboard.cno }번글답변쓰기</caption>
				<tr>
					<td>문의자</td>
					<td><input type="text" name="cid" value="${cboard.cid }"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="ctitle" required="required"
						size="30" value="[관리자답변]${cboard.ctitle }"></td>
				</tr>
				<tr>
					<td>본문</td>
					<td><textarea name="ccontent" rows="5" cols="30"></textarea></td>
				</tr>
				<tr class="t1">
					<td colspan="2"><input type="submit" value="답변쓰기" class="btn">
						<input type="button" value="목록" class="btn"
						onclick="location.href='${conPath}/cboardList.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>