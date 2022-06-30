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
#content_form{
	width:900px;
	height:480px;
	margin:50px auto;
}
#content_form table{
	margin: 0 auto;
}
#content_form input{
	margin:10px 10px 5px 30px;
	height:40px;
	width: 200px;
}
#content_form input[type=submit]{
	margin: 20px 10px 10px 50px;
}
h1{
	text-align: center;
	margin-bottom: 30px;
}
p{
	margin:0 auto;
	width:900px;
	height:500px;
}
input[type=button]{
	width:300px;
	height:300px;
	margin: 30px 20px 10px 80px;
	border-radius:30px;
	text-align: center;
	font-size:30px;
}
.btn1{
	background-color: #00ff21;
	border: none;
}
.btn2{
	background-color: #20b2b2;
	border: none;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<form action="modifyView.do" id="content_form" method="post">
		<h1> ${member.mid }님</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mid" value="${member.mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="mname" value="${member.mname }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td>
					<input type="text" name="memail" value="${member.memail }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="mid" value="${member.mtel }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="maddress" value="${member.maddress }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td>
					<input type="text" name="mgrade" value="${member.mgrade }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="내 정보 수정">
				</td>
			</tr>
		</table>
	</form>
	<p>
		<input type="button" class="btn1" value="판매내역" onclick="location.href='sellTrade.do'">
		<input type="button" class="btn2" value="구매내역" onclick="location.href='buyTrade.do'">
	</p>
</body>
</html>