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
	#content_form table #tr2 td{
		height:50px;
		width:70px;
		line-height: 50px;
		text-align: center;
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
	#content_form .img1{
		width:150px;
		height:100px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		$(document).ready(function(){
			$('.completeBtn').click(function(){
				var bid = $('input[name="bid"]').val();
				location.href='${conPath}/TradeComplete.do?bno=${board.bno }&sid=${board.mid }&pageNum=${param.pageNum }&btitle=${board.btitle }&bid='+bid;
				$('.btnT').remove();
			});
		});
		function fn() {
			if ($('#t1').css('display') == 'none') {
				$('#t1').show();
			} else {
				$('#t1').hide();
			}
		}
		
	</script>
</head>
<body>
<c:if test="${not empty tradeResult }">
		<script>
			alert('${tradeResult}');
			history.back();
		</script>
</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/MessageView.do">
		<input type="hidden" name="bno" value="${board.bno }">
			<table>
				<caption>${board.bno }글상세보기</caption>
				<tr>
					<th>글쓴이</th>
					<td>${board.mid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${board.btitle }</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${board.bcost }원</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${board.brdate }</td>
				</tr>
				<tr>
					<th class="thP">사진</th>
					<td><c:if test="${not empty board.bphoto }">
							<img src="${conPath }/boardPhoto/${board.bphoto}" class="img1">
						</c:if> <c:if test="${empty board.bphoto }">
						 	사진없음
						 </c:if></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><pre>${board.bcontent}</pre></td>
				</tr>

				<tr>
					<td colspan="2">
						<c:if test="${member.mid eq board.mid }">
							<input type="button" class="btnT" value="거래완료" onclick="fn()">
							<input type="button" value="수정" class="btn"onclick="location='${conPath}/boardModifyView.do?bno=${board.bno }&pageNum=${param.pageNum }&game=${param.game}&bbs=${param.bbs}'">
						</c:if> 
						<c:if test="${member.mid eq board.mid or not empty admin}">
							<input type="button" value="삭제" class="btn" onclick="location='${conPath}/boardDelete.do?bno=${board.bno }&pageNum=${param.pageNum }'">
						</c:if> 
						<c:if test="${!(member.mid eq board.mid) and not empty member }">
							<input type="submit" value="거래신청" class="btn">
						</c:if> 
						<input type="button" value="목록" class="btn" onclick="location='${conPath }/boardList.do?pageNum=${param.pageNum }&game=${param.game}&bbs=${param.bbs}'">
					</td>
				</tr>
			</table>
			<table id="t1" style="display: none">
				<tr>
					<td>
						<input type="text" name="bid">님과(와) 거래
						<input type="button" class="completeBtn" value="확인">
					</td>
				<tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>