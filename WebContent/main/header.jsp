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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function dis() {
		if ($('#hidden_game').css('display') == 'none') {
			$('#hidden_game').show();
		} else {
			$('#hidden_game').hide();
		}
	}
	$(document).ready(function() {
		$(".glist").click(function() {
			var glist = $(this).val();
			$('#searchGameServer').val(glist);
		});
	});
	function fun(mid) {
		location.href = '${conPath}/messagePost.do?mid=' + mid;
	}
</script>
</head>
<body>
	<c:if test="${empty member and empty admin }">
		<header>
			<div id="header_nav">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/cboardList.do">고객센터</a></li>
						<li><a href="${conPath }/joinView.do">회원가입</a></li>
						<li><a href="${conPath }/loginView.do">로그인</a></li>
					</ul>
				</div>
			</div>
			<div id="header_logo">
				<a href="main.do"><img src="${conPath }/boardPhoto/logo1.png" class="imgL"></a>
			</div>
			<div id="header_sc">
				<div class="search">
					<form action="${conPath }/boardList.do">
						<div class="search_area">
							<div class="g_trade_type">
								<label class="radiocontainer1"> 팝니다 </label>
								<input type="radio"	name="bbs" value="s" checked="checked"> 
								<span class="checkmark"></span> 
								<label class="radiocontainer2">	삽니다</label> 
								<input type="radio" name="bbs" value="b"> 
								<span class="checkmark"></span>

							</div>
							<input type="text" class="g_text search_gs_name" name="game"
								id="searchGameServer" title="게임검색" style="ime-mode: active"
								placeholder="게임명을 입력해주세요." autocomplete="off"
								data-gameserver="true" onclick="dis()" value="${param.game }">
						</div>
						<input type="submit" class="btn_search" value=" ">
					</form>
					<div id="hidden_game" style="display: none">
						<div id="game_list">
							<input type="text" class="list" value="인기게임" readonly="readonly">
							<img src="${conPath }/boardPhoto/1.png"> 
							<input type="text" class="glist" value="오딘:발할라라이징" readonly="readonly">
							<img src="${conPath }/boardPhoto/2.png"> 
							<input type="text" class="glist" value="메이플스토리" readonly="readonly">
							<img src="${conPath }/boardPhoto/3.png"> 
							<input type="text" class="glist" value="로스트아크" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/4.png"> 
							<input type="text" class="glist" value="던전앤파이터" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/5.png"> 
							<input type="text" class="glist" value="바람의나라:연" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/6.png"> 
							<input type="text" class="glist" value="리니지W" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/7.png"> 
							<input type="text" class="glist" value="디아블로2:레저렉션" readonly="readonly">
							<img src="${conPath }/boardPhoto/8.png"> 
							<input type="text" class="glist" value="마비노기" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/9.png"> 
							<input type="text" class="glist" value="아이온" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/10.png"> 
							<input type="text" class="glist" value="리니지M" readonly="readonly">
						</div>
					</div>
					<div id="header_write">
						<div class="sell">
							<a href="${conPath }/boardWriteSView.do">판매글쓰기</a>
						</div>
						<div class="buy">
							<a href="${conPath }/boardWriteBView.do">구매글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</header>
	</c:if>

	<c:if test="${not empty member and empty admin }">
		<header>
			<div id="header_nav">
				<input type="hidden" name="mid" value="${member.mid }">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/cboardList.do">고객센터</a></li>
						<li><a onclick="fun('${member.mid }')"
							style="cursor: pointer">메시지함</a></li>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<li><a href="${conPath }/memberView.do">내 정보</a></li>
					</ul>
				</div>
			</div>
			<div id="header_logo">
				<a href="main.do"><img src="${conPath }/boardPhoto/logo1.png" class="imgL"></a>
			</div>
			<div id="header_sc">
				<div class="search">
					<form action="${conPath }/boardList.do">
						<div class="search_area">
							<div class="g_trade_type">
								<label class="radiocontainer1"> 팝니다 </label>
								<input type="radio"	name="bbs" value="s" checked="checked"> 
								<span class="checkmark"></span> 
								<label class="radiocontainer2">	삽니다</label> 
								<input type="radio" name="bbs" value="b"> 
								<span class="checkmark"></span>
							</div>
							<input type="text" class="g_text search_gs_name" name="game"
								id="searchGameServer" title="게임검색" style="ime-mode: active"
								placeholder="게임명을 입력해주세요." autocomplete="off"
								data-gameserver="true" onclick="dis()" value="${param.game }">
						</div>
						<input type="submit" class="btn_search" value=" ">
					</form>
					<div id="hidden_game" style="display: none">
						<div id="game_list">
							<input type="text" class="list" value="인기게임" readonly="readonly">
							<p>
								<img src="${conPath }/boardPhoto/1.png"> <input
									type="text" class="glist" value="오딘:발할라라이징" readonly="readonly">
							</p>
							<img src="${conPath }/boardPhoto/2.png"> 
							<input type="text" class="glist" value="메이플스토리" readonly="readonly">
							<img src="${conPath }/boardPhoto/3.png"> 
							<input type="text" class="glist" value="로스트아크" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/4.png"> 
							<input type="text" class="glist" value="던전앤파이터" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/5.png"> 
							<input type="text" class="glist" value="바람의나라:연" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/6.png"> 
							<input type="text" class="glist" value="리니지W" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/7.png"> 
							<input type="text" class="glist" value="디아블로2:레저렉션" readonly="readonly">
							<img src="${conPath }/boardPhoto/8.png"> 
							<input type="text" class="glist" value="마비노기" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/9.png"> 
							<input type="text" class="glist" value="아이온" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/10.png"> 
							<input type="text" class="glist" value="리니지M" readonly="readonly">
						</div>
					</div>
					<div id="header_write">
						<div class="sell">
							<a href="${conPath }/boardWriteSView.do">판매글쓰기</a>
						</div>
						<div class="buy">
							<a href="${conPath }/boardWriteBView.do">구매글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</header>
	</c:if>

	<c:if test="${empty member and not empty admin }">
		<header>
			<div id="header_nav">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/cboardList.do">고객센터</a></li>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div id="header_logo">
				<a href="main.do"><img src="${conPath }/boardPhoto/logo1.png" class="imgL"></a>
			</div>
			<div id="header_sc">
				<div class="search">
					<form action="${conPath }/boardList.do">
						<div class="search_area">
							<div class="g_trade_type">
								<label class="radiocontainer1"> 팝니다 </label>
								<input type="radio"	name="bbs" value="s" checked="checked"> 
								<span class="checkmark"></span> 
								<label class="radiocontainer2">	삽니다</label> 
								<input type="radio" name="bbs" value="b"> 
								<span class="checkmark"></span>
							</div>
							<input type="text" class="g_text search_gs_name" name="game"
								id="searchGameServer" title="게임검색" style="ime-mode: active"
								placeholder="게임명을 입력해주세요." autocomplete="off"
								data-gameserver="true" onclick="dis()" value="${param.game }">
						</div>
						<input type="submit" class="btn_search" value=" ">
					</form>
					<div id="hidden_game" style="display: none">
						<div id="game_list">
							<input type="text" class="list" value="인기게임" readonly="readonly">
							<p>
								<img src="${conPath }/boardPhoto/1.png">
								<input type="text" class="glist" value="오딘:발할라라이징" readonly="readonly">
							</p>
							<img src="${conPath }/boardPhoto/2.png"> 
							<input type="text" class="glist" value="메이플스토리" readonly="readonly">
							<img src="${conPath }/boardPhoto/3.png"> 
							<input type="text" class="glist" value="로스트아크" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/4.png"> 
							<input type="text" class="glist" value="던전앤파이터" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/5.png"> 
							<input type="text" class="glist" value="바람의나라:연" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/6.png"> 
							<input type="text" class="glist" value="리니지W" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/7.png"> 
							<input type="text" class="glist" value="디아블로2:레저렉션" readonly="readonly">
							<img src="${conPath }/boardPhoto/8.png"> 
							<input type="text" class="glist" value="마비노기" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/9.png"> 
							<input type="text" class="glist" value="아이온" readonly="readonly"> 
							<img src="${conPath }/boardPhoto/10.png"> 
							<input type="text" class="glist" value="리니지M" readonly="readonly">
						</div>
					</div>
					<div id="header_write">
						<div class="sell">
							<a href="${conPath }/boardWriteSView.do">판매글쓰기</a>
						</div>
						<div class="buy">
							<a href="${conPath }/boardWriteBView.do">구매글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</header>
	</c:if>

</body>
</html>