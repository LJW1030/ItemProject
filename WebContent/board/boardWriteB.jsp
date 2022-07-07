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
		height:800px;
		margin:0 auto;
		background-color: #f1e2e2;
	}
	h1{
		color:#d15757;
	}
	#content_form caption{
		font-size: 1.2em;
		text-align: left;
		margin: 30px 20px;
	}
	#content_form input{
		margin:10px 10px 5px 10px;
	height:40px;
	width: 300px;
	border:none;
	border-bottom: 1px solid;
	}
	#content_form .btn{
		width: 200px;
		border:none;
		margin-left: 80px;
	}
	#content_form textarea{
		margin-left: 10px;
		width:500px;
		height:150px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<c:if test="${empty member and empty admin }">
	<script>
		alert('로그인이 필요한 서비스입니다');
		location.href="${conPath }/loginView.do";
	</script>
</c:if>
<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<h1>구매등록</h1>
		<hr>
		<form action="${conPath }/boardWriteB.do" method="post">
			<table>
				<caption>구매상품</caption>
				<tr>
					<th>게임</th>
					<td><input type="text" name="game" required="required">
					</td>
				</tr>
				<tr>
					<th>구매금액</th>
					<td><input type="number" name="bcost" required="required">원
					</td>
				</tr>
				<tr>
					<th>캐릭터명</th>
					<td><input type="text" name="bcname" required="required">(거래를 위한 본인 캐릭터명)</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="btitle" required="required">
					</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td><textarea name="bcontent" rows="5" cols="30"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/main/main.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>