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
	<form id="content_form" action="${conPath }/findId.do">
		<table>
			<caption>ID 찾기</caption>	
			<tr>
				<td>
					<h4>가입시 입력한 고객님 이름</h4>
				</td>
			</tr>	
			<tr>
				<td>
					<input type="text" name="mname" required="required">
				</td>
			</tr>		
			<tr>
				<td>
					<h4>가입시 입력한 고객님 메일 주소</h4>
				</td>
			</tr>	
			<tr>
				<td>
					<input type="email" name="memail" required="required">
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>