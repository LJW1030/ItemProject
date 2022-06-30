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

#loginForm{
	width:400px;
	height:800px;
	margin: 100px auto;
	padding: 50px 100px;
}
#loginForm table{
	margin : 20px auto;
}
#loginForm caption{
	width:400px;
	height:50px;
	font-size:1.5em;
}
#loginForm input{
	width:400px;
	height:50px;
	margin:10px auto;
}
#loginForm input[type=submit]{
	background-color: #357ae8;
	width:406px;
	font-size: 20px;
	color:white;
	border-color: #7299b4; 
}
hr{
width:404px;
margin-left: 2.5px;
}
p{
	margin:30px auto;
	padding-left: 15px;
}
a{
margin:0 10px;
text-align: center;
list-style: none;
text-decoration: none;
color: black;
}
</style>
</head>
<body>
	<c:if test="${not empty errorMsg}">
		<script>
			alert('${errorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/login.do" id="loginForm" method="post">
		<table>
			<caption>아이템마켓 회원 로그인</caption>
			<tr>
				<td>
					<input type="text" name="mid" value="${mid }" required="required" placeholder="아이디" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="mpw" required="required" placeholder="비밀번호">
				</td>
			</tr>	
			<tr>
				<td>
					<input type="submit" value="로그인" >
				</td>
			</tr>				
		</table>
		<hr>
		<p>
			<a href="">아이디 찾기 </a>ㅣ
			<a href="">비밀번호 찾기 </a>ㅣ 
			<a href="">회원가입</a>
		</p>
	</form>
</body>
</html>