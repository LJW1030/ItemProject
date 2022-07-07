<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	section{
		width:1000px;
		height: 700px;
		overflow: hidden;
		margin: 50px auto;
	}
	#section1, #section2{
		width:500px;
		height:700px;
		float: left;
		text-align: center;
	}
	#section p{
		
	}
	.img1{
	width:400px;
	height:200px;
	margin-bottom: 30px;
	}
	</style>
</head>
<body>
	<c:if test="${not empty loginError}">
		<script>
			alert('${loginError}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty boardResult}">
		<script>
			alert('${boardResult}');
		</script>
	</c:if>
	<jsp:include page="header.jsp"/>
	<section>
		<div id="section1">
			<p>추천게임</p>
			<a href="https://odin.game.daum.net/odin/" target="_blank"><img src="${conPath }/boardPhoto/odin.png" class="img1"></a>
			<a href="https://maplestory.nexon.com/Home/Main" target="_blank"><img src="${conPath }/boardPhoto/maple.png" class="img1"></a>
			<a href="https://lostark.game.onstove.com/Main" target="_blank"><img src="${conPath }/boardPhoto/lostark.png" class="img1"></a>
		</div>
		<div id="section2">
			<p>게임소식</p>
		
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>