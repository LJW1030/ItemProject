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
		width:80%;	
		margin:0 auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[name="memail"]').keyup(function(){
				var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
				var memail = $('input[name="memail"]').val();
				if(patternMail.test(memail)){
					$.ajax({
						url : '${conPath}/emailConfirm.do',
						type : 'get',
						dataType : 'html',
						data : "memail="+memail,
						success : function(data){
							$('#emailConfirmResult').html(data);
						}
					});//ajax
				}else if(!memail){
					$('#emailConfirmResult').html(' &nbsp; ');
				}else{
					$('#emailConfirmResult').html('메일 형식을 지켜주세요');
				}//if
			});// mEmail keyup 이벤트
			$('form').submit(function(){
				var emailConfirmResult = $('#emailConfirmResult').text().trim();
				if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 E-MAIL입니다'){
					alert('중복된 이메일은 수정불가합니다');
					$('input[name="memail"]').focus();
					return false;
				}
			});
		});
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#mBirth" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, 
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년', 
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true, 
			minDate : '-100y',
			maxDate : 'y', 
			yearRange : 'c-100:c+100', 
    });
  } );
  </script>
	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<form action="modify.do" id="content_form" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mid" value="${member.mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="mpw" value="${member.mpw }" required="required">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="mname" value="${member.mname }" required="required">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="number" name="mtel1" class="tel_in1"required="required" value="${member.mtel.substring(0,3) }">ㅡ
					<input type="number" name="mtel2" class="tel_in"required="required" value="${member.mtel.substring(4,8) }">ㅡ
					<input type="number" name="mtel3" class="tel_in"required="required" value="${member.mtel.substring(9) }">
				</td>
			</tr>
			<tr>
				<th>메일</th>
				<td>
					<input type="email" name="memail" value="${member.memail }">
					<div id="emailConfirmResult"> &nbsp; </div>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
					<td colspan="2">
						<input type="text" name="mbirth" id="mbirth" value="${member.mbirth }" id="birth">
					</td>
			</tr>
			<tr>
				<th>주소</th>
					<td colspan="2">
						<input type="text" name="maddress" value="${member.maddress }">
					</td>
			</tr>
			<tr>
				<th>성별</th>
					<td colspan="2">
						<input type="text" name="mgender" value="${member.mgender }">
					</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="정보수정" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="이전" onclick="history.go(-1)" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>