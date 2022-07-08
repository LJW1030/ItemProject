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
		width:900px;
		margin: 50px auto;
	}
	#content_form caption{
		font-size: 2em;
		margin-bottom: 30px;
	}
	#content_form th{
		background-color: #d9d9d9;
		text-align: center;
		height: 40px;
	}
	#content_form .th1{
		width:70px;
	}
	#content_form .th2{
		width:150px;
	}
	#content_form .th3{
		width:400px;
	}
	#content_form .th4{
		width:100px;
	}
	#content_form h4{
		margin: 50px 0 10px 100px;
	}
	#content_form .td1{
		text-align: center;
	}
	#content_form td{
		height:80px;
	}
	#content_form input[type=text]{
		border: none;
		height: 70px;
		text-align: center;
	}
	#content_form .tdC{
		width:400px;
		text-align: left;
	}
	#content_form .btn{
		width:40px;
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
	<form id="content_form">
		<h4>
			<a href="${conPath }/getPost.do">받은 메일함</a>
		</h4>
		<table>
			<caption>보낸 메일함</caption>
			<tr>
				<th class="th1">받은이</th>
				<th class="th2">제목</th>
				<th class="th3">내용</th>
				<th class="th4">보낸날짜</th>
			</tr>
			<c:if test="${message.size()==0 }">
				<tr>
					<td colspan="6" class="td1">보낸 메시지가 없습니다</td>
				</tr>
			</c:if>
			<c:forEach var="msg" items="${messages }">
				<tr>
					<td><input type="text" name="getId" value="${msg.getId }"
						readonly="readonly"></td>
					<td><input type="text" name="etitle" value="${msg.etitle }"
						readonly="readonly"></td>
					<td><input type="text" name="econtent" class="tdC"
						value="${msg.econtent }" readonly="readonly"></td>
					<td><input type="text" name="erdate" value="${msg.erdate }"
						readonly="readonly"></td>
					<td><button class="btn"
							onclick="location.href='${conPath }/messageDelete.do?eno=${msg.eno}'">삭제</button></td>
				</tr>
			</c:forEach>

		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>