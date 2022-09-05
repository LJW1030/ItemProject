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
	#content_form{
		width:1000px;
	}
	
	#content_form table{
		width:600px;
		margin:30px auto;
		border-collapse: collapse;
	}
	#content_form table th{
		background-color: #159efd;
		width:100px;
		color:white;
		text-align: center;
		height:50px;
	}
	#content_form table #tr2{
		border-bottom: 1px solid #159efd;
	}
	#content_form table td{
		width:300px;
		text-align: left;
		line-height: 50px;
		padding-left: 20px;
	}	
	#content_form textarea, input[type=text],input[type=number],input[type=file]{
		width:300px;
		text-align: left;
		line-height: 50px;
		border:none;
	}
	
	#content_form table caption{
		font-weight: bold;
		font-size: 1.5em;
		margin: 20px 0;
		text-align: center;
	}
	#content_form .thP{
		height:150px;
	}
	#content_form .cost{
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
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
	<form action="${conPath }/boardModify.do?pageNum=${param.pageNum }&game=${param.game}&bbs=${param.bbs}" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bno" value="${board.bno }">
		<input type="hidden" name="dbphoto" value="${board.bphoto }">
		<table>
			<caption>${board.bno }글수정하기</caption>
			<tr>
				<th>글쓴이</th>
				<td>${board.mid}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="btitle" required="required"
					size="30" value="${board.btitle }"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="bcost" class="cost" required="required"
					value="${board.bcost }">원</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${board.brdate }</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="bphoto"> 
					<c:if test="${not empty board.bphoto }">
						<img src="${conPath }/boardPhoto/${board.bphoto}" class="img1">
					</c:if> 
					<c:if test="${empty board.bphoto }">
						 	사진없음
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="30" name="bcontent">${board.bcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="취소" class="btn" onclick=history.back()>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>