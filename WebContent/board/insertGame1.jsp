<%@page import="com.pro.market.dao.BoardDao"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<%
	for(int i=0; i<60; i++){
		BoardDao bDao = BoardDao.getInstance();
		bDao.writeBuy("dkdk", "메이플스토리", "템사요"+i, 100000, "메장사꾼", "템다삼");
	}
	for(int i=0; i<60; i++){
		BoardDao bDao = BoardDao.getInstance();
		bDao.writeSell("dkdk", "메이플스토리", "템팔아요"+i, 150000, "메장사꾼", "템다팜", "멋검.png");
	}
response.sendRedirect("../main.do");
%>
</body>
</html>