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
<link href="${conPath }/css/header.css" rel="stylesheet">

</head>
<body>
	<c:if test="${empty member and empty admin }">
		<div id="header_nav">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/cboardList.do">고객센터</a></li>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
				</ul>
			</div>
			<h1>
				<a href="main.do">LOGO</a>
			</h1>
			<div class="search">
				<form action="">
					<div class="search_area">
						<div class="g_trade_type">
							<label class="radiocontainer1"> 팝니다 <input type="radio"
								name="bbs" value="s"> <span class="checkmark"></span>
							</label> <label class="radiocontainer2"> 삽니다 <input type="radio"
								name="bbs" value="b" checked> <span class="checkmark"></span>
							</label>
						</div>
						<input type="text" class="g_text search_gs_name" name="game"
							id="searchGameServer" title="게임검색" style="ime-mode: active"
							placeholder="게임명을 입력해주세요." autocomplete="off"
							data-gameserver="true">
					</div>
					<input type="submit" class="btn_search" value=" ">
				</form>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty member and empty admin }">
		<div id="header_nav">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/cboardList.do">고객센터</a></li>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a href="${conPath }/memberView.do">내 정보</a></li>
				</ul>
			</div>
		</div>
		<div class="search">
			<form action="">
				<div class="search_area">
					<div class="g_trade_type">
						<label class="radiocontainer1"> 팝니다 <input type="radio"
							name="search_type" value="sell"> <span class="checkmark"></span>
						</label> <label class="radiocontainer2"> 삽니다 <input type="radio"
							name="search_type" value="buy" checked> <span
							class="checkmark"></span>
						</label>
					</div>
					<input type="text" class="g_text search_gs_name" name="game"
						id="searchGameServer" title="게임검색" style="ime-mode: active"
						placeholder="게임명을 입력해주세요." autocomplete="off"
						data-gameserver="true">
				</div>
				<input type="submit" class="btn_search" value=" ">
			</form>
		</div>

	</c:if>
	<c:if test="${empty member and not empty admin }">
		<div id="header_form">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/messageView.do">메시지함</a></li>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a href="${conPath }/adminView.do">내 정보</a></li>
				</ul>
			</div>
			<div class="search">
				<form action="">
					<div class="search_area">
						<div class="g_trade_type">
							<label class="radiocontainer1"> 팝니다 <input type="radio"
								name="search_type" value="sell"> <span
								class="checkmark"></span>
							</label> <label class="radiocontainer2"> 삽니다 <input type="radio"
								name="search_type" value="buy" checked> <span
								class="checkmark"></span>
							</label>
						</div>
						<input type="text" class="g_text search_gs_name" name="game"
							id="searchGameServer" title="게임검색" style="ime-mode: active"
							placeholder="게임명을 입력해주세요." autocomplete="off"
							data-gameserver="true">
					</div>
					<input type="submit" class="btn_search" value=" ">
				</form>
			</div>
		</div>
	</c:if>
</body>
</html>