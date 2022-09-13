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
		#content{
			width: 600px;
	        height : 300px;
	        margin: 0 auto;
	        max-width: 500px;
	        margin-top: 200px;
	        margin-bottom:80px;
	        padding: 20px;
	        background: #fff;
	        -webkit-border-radius: 10px;
	        -moz-border-radius: 10px;
	        border-radius: 10px;
	        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		#content table{
		}
		#content table tr td{
			width:300px;
			text-align: center;
			padding-top:10px;
		}
		#content textarea{
			width:230px;
			padding-top:10px;
			margin-left: 30px;
			border:none;
		}
		#content input{
			border-left:none;
			border-right:none;
			border-top:none;
		}
		#content .btn{
			margin:  80px 0;
            background: #fff;
            border-color: black;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		}
		h2{
			text-align: center;
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
	<form id="content_form" action="${conPath }/findPW.do">
		<table>
			<caption>ID 찾기</caption>	
			<tr>
				<td>
					<h4>가입시 입력한 고객님 ID</h4>
				</td>
			</tr>	
			<tr>
				<td>
					<input type="text" name="mid" required="required">
				</td>
			</tr>	
			<tr>
				<td>
					<h4>가입시 입력한 고객님 이름</h4>
				</td>
			</tr>	
			<tr>
				<td>
					<input type="text" name="mname" required="required">
				</td>
			</tr>		
			<tr>
				<td>
					<h4>가입시 입력한 고객님 메일 주소</h4>
				</td>
			</tr>	
			<tr>
				<td>
					<input type="email" name="memail" required="required">
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>