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
		<form action="${conPath }/sendMessage.do">
			<table>
				<caption>${getId }님에게 답장</caption>
				<tr>
					<th>보내는이</th>
					<td><input type="text" name="sendId" value="${member.mid }">
					</td>
				</tr>
				<tr>
					<th>받는이</th>
					<td><input type="text" name="getId" value="${getId }">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="etitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="econtent" rows="5" cols="32"></textarea></td>
				</tr>
				<tr class="t1">
					<td colspan="2">
					<input type="submit" value="보내기" class="btn"> 
					<input	type="button" value="취소" class="btn" onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>