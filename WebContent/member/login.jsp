<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#content_form{
	width:80%;
	height:1200px;
	margin:0 auto;
}


#loginForm {
	width: 400px;
	height: 800px;
	margin: 100px auto;
	padding: 50px 50px;
}

#loginForm table {
	margin: 20px auto;
}

#loginForm caption {
	width: 400px;
	height: 50px;
	font-size: 1.5em;
}

#loginForm input {
	width: 400px;
	height: 50px;
	margin: 10px auto;
}

#loginForm input[type=submit] {
	background-color: #357ae8;
	width: 406px;
	font-size: 20px;
	color: white;
	border-color: #7299b4;
}

hr {
	width: 404px;
	margin-left: 2.5px;
}

p {
	margin: 30px auto;
	padding-left: 15px;
}

a {
	list-style: none;
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty findResult }">
		<script>
			alert('${findResult}');
		</script>
	</c:if>
	<c:if test="${not empty fid }">
		<script>
			alert('가입한 ID는 ${fid.mid} 입니다');
		</script>
	</c:if>
	<c:if test="${not empty fpw }">
		<script>
			alert('가입한 비밀번호는 ${fpw.mpw} 입니다');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
		<div id="content_form">
			<form action="${conPath }/login.do" id="loginForm" method="post">
				<table>
					<caption>아이템마켓 회원 로그인</caption>
					<tr>
						<td><input type="text" name="mid" value="${mid }"
							required="required" placeholder="아이디" autofocus="autofocus">
						</td>
					</tr>
					<tr>
						<td><input type="password" name="mpw" required="required"
							placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td><input type="submit" value="로그인"></td>
					</tr>
				</table>
				<hr>
				<p>
					<a href="${conPath }/findIdView.do">&nbsp; 아이디 찾기 &nbsp; </a>ㅣ 
					<a href="${conPath }/findPWView.do">&nbsp; 비밀번호 찾기 &nbsp; </a>ㅣ
					<a href="${conPath }/joinView.do">&nbsp; 회원가입</a>
				</p>
			</form>
			<form action="${conPath }/adminLogin.do" method="post">
				<table>
					<tr>
						<td><input type="text" name="aid" required="required">
						</td>
					</tr>
					<tr>
						<td><input type="password" name="apw" required="required">
						</td>
					</tr>
					<tr>
						<td><input type="submit" value="관리자 로그인"></td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>