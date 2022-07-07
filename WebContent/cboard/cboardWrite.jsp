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
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<form id="content_form" action="${conPath }/cboardWrite.do">
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
					<textarea name="ccontent" rows="8" cols="50"></textarea>
				</td>
			</tr>
			<tr class="t1">
				<td colspan="2">
					<input type="submit" value="등록" class="btn">
					<input type="button" value="목록" class="btn" onclick=history.back()>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>