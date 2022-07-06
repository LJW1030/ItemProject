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
	width:80%;
	height:1200px;
	margin:0 auto;
}
#join_form{
	text-align: center;
}
b{
	color:red;
}
h4{
	color:green;
}
h1{
	text-align: center;
	margin: 20px 0;
}
#i{
	width:390px;
	margin:10px auto;
	
}
#pwChkResult, #idConfirmResult, #emailConfirmResult{
	width:380px;
	margin:10px auto;
	text-align: left;
}
p{
	width:430px;
	margin:10px auto;
	text-align: left;
}
h3{
	text-align: left;
}
.in{
	margin-left:30px;
	width: 400px;
	height:30px;
}
.tel_in1{
	margin-left: 40px;
	width:70px;
	height:20px;
}
.tel_in{
	margin-left: 0px;
	width:70px;
	height:20px;
}
#sample4_postcode{
	width:277px;
	text-align: left;
}
#content_form input{
	border-color: #d9d9d9;
}
table{
	margin: 0 auto;
}
.btn{
	margin: 30px 36px;
	width:150px;
	height:30px;
	background-color: #357ae8;
	font-size: 20px;
	color:white;
	border-color: #7299b4;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[name="mid"]').keyup(function(){
				var mid = $('input[name="mid"]').val();
				$.ajax({
					url : '${conPath}/idConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "mid="+mid,
					success : function(data){
						$('#idConfirmResult').html(data);
					}
				});
			});
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
					$('#emailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
				}
			});
			/* $('input[name="mtel1"], input[name="mtel3"], input[name="mtel3"]').keyup(function(){
				var mtel1 = $('input[name="mtel1"]').val();
				var mtel2 = $('input[name="mtel2"]').val();
				var mtel3 = $('input[name="mtel3"]').val();
				if(mtel1.length>4 || mtel2.length>4 || mtel3.length>4){
					$('.tel_in, .tel_in1').html("");
				}
				
			}); */
			$('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
				var mpw = $('input[name="mpw"]').val();
				var mpwChk = $('input[name="mpwChk"]').val();
				if(mpw==mpwChk){
					$('#pwChkResult').html('<h4>비밀번호 일치</h4>');
				}else{
					$('#pwChkResult').html('<b>비밀번호 불일치</b>');
				}
			});
		});
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script>
  $( function() {
    $( "#mbirth" ).datepicker({
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
			yearRange : 'c-100:c+100' ,
    });
  } );
  </script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</head>
<body>	
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<form action="${conPath }/join.do" id="join_form" method="post">
		<div id="j">
		<h1>회원가입</h1>
		</div>
		
		<div id="i">
		<h3>·아이디</h3>
		
		</div>
		
		<input type="text" name="mid" class="in"required="required" maxlength="20">
		<div id="idConfirmResult" class="in"> &nbsp; </div>
		
		<div id="i">
		<h3>·비밀번호</h3>
		</div>
		
		<input type="password" name="mpw" class="in" required="required">
		
		<div id="i">
		<h3>·비밀번호 확인</h3>
		</div>
		
		<input type="password" name="mpwChk" class="in" required="required">
		<div id="pwChkResult" class="in"> &nbsp; </div>
		
		<div id="i">
		<h3>·이름</h3>
		</div>
		
		<input type="text" name="mname" class="in"required="required" >
		
		<div id="i">
		<h3>·휴대폰 번호</h3>
		</div>
		
		<p>
			<input type="number" name="mtel1" class="tel_in1"required="required">ㅡ
			<input type="number" name="mtel2" class="tel_in"required="required">ㅡ
			<input type="number" name="mtel3" class="tel_in"required="required">
		</p>
		
		<div id="i">
		<h3>·E-MAIL</h3>
		</div>
		
		<input type="email" name="memail" class="in" required="required">
		<div id="emailConfirmResult" class="in"> &nbsp; </div>
		
		<div id="i">
		<h3>·주소</h3>
		</div>
		
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" class="in" name="add1"placeholder="도로명주소" size="60" ><br>
		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" class="in" name="add2" placeholder="상세주소"  size="60"><br>
		<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
		<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
		
		<div id="i">
		<h3>·생년월일</h3>
		</div>
		
		<input type="text" name="mbirth" class="in" id="mbirth" required="required">
		
		<div id="i">
		<h3>·성별</h3>
		</div>
		
		<select id="gender" name="mgender" class="in" required="required">
			<option>성별</option>
			<option value="남자">남자</option>
			<option value="여자">여자</option>
		</select>
		<table>
			<tr>
				<td>
					<input type="submit" class="btn" value="회원가입">
					<input type="button" class="btn" value="취소" onclick="location.href='${conPath}/main.do'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>