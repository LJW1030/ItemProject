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
		width:1000px;	
		margin:0 auto;
	}
	#content_form table{
		margin:30px auto;
		width:800px;
	}
	#content_form table .t1{
		background-color: #159efd;
		color:white;
		text-align: center;
		height:50px;
	}
	#content_form table .t2{
		background-color: #159efd;
		color:white;
		text-align: center;
		height:50px;
		width:200px;
	}
	#content_form table th{
		width:70px;
		text-align: center;
		line-height: 50px;
		font-size: 1.2em;
	}
	#content_form table td{
		border:none;
		border-bottom: 1px solid #159efd;
		text-align: center;
		font-size: medium;
		width:100px;
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
	
	<form id="content_form">
		<table>
			<tr>
				<th class="th1">구매자</th>
				<th class="th1">판매자</th>
				<th class="th2">거래내용</th>
			<tr>
			<c:forEach var="sTrade" items="${sTrades }">
			<tr>
				<td>
					<input type="text" name="bid" value="${sTrade.bid }(나)" readonly="readonly">
				</td>
				<td>
					<input type="text" name="sid" value="${sTrade.sid }" readonly="readonly">
				</td>
				<td>
					<input type="text" name="btitle" value="${sTrade.btitle }" readonly="readonly">
				</td>
			</tr>
		</c:forEach>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>