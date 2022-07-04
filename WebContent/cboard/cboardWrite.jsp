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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<form id="content_view" action="${conPath }/cboardWrite.do">
		<table>
			<tr>
				<td>
					ID
					<input type="text" name="cid" value="${member.mid }"
						readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					제목
					<input type="text" name="ctitle" >
				</td>
			</tr>
			<tr>
				<td>
					내용
					<textarea name="ccontent" rows="5" cols="32"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>