<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	section{
		width:1000px;
		height: 800px;
		overflow: hidden;
		margin: 50px auto;
	}
	#section1, #section2{
		width:500px;
		height:700px;
		float: left;
		text-align: center;
	}
	#section2{
		height:400px;
		margin:0 auto;
	}
	#section2 .news ul li{
		margin:10px auto;
	}
	.img1{
	width:400px;
	height:200px;
	margin-bottom: 30px;
	}
	#section3{
		width: 400px;
		float: right;
	}
	#section3 .tY {
		width: 300px;
	}
	#section3 .tY caption{
		color:gray;
    	font-weight: bold;
    	margin: 20px auto;
	}
    #section3 .tY td {
        background-color: black;
        width: 100px;
        height: 100px;
    }
    section p{
    	color:gray;
    	font-weight: bold;
    	margin: 20px auto;
    }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			var dduckIdx = parseInt(Math.random() * 9); // 떡이 있는 곳
			$('td').click(function () {
		  	$('td').removeClass('tdClick');
		    var idx = Number($(this).attr('id')); // 클릭한 곳의 위치
		    if (idx == dduckIdx) {
		      $(this).css('background-image', 'url("${conPath}/boardPhoto/용만.png")');
		      $(this).css('background-size', '100%');
		      $('td').off();
		    } else {
		    	$(this).css('background-image', 'url("${conPath}/boardPhoto/땡.png")');
			     $(this).css('background-size', '100%');
		    }
		  });
		});
	</script>
</head>
<body>
	<c:if test="${not empty loginError}">
		<script>
			alert('${loginError}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty boardResult}">
		<script>
			alert('${boardResult}');
		</script>
	</c:if>
	<c:if test="${not empty tradeResult}">
		<script>
			alert('${tradeResult}');
		</script>
	</c:if>
	<jsp:include page="header.jsp"/>
	<section>
		<div id="section1">
			<p>추천게임</p>
			<a href="https://odin.game.daum.net/odin/" target="_blank"><img src="${conPath }/boardPhoto/odin.png" class="img1"></a>
			<a href="https://maplestory.nexon.com/Home/Main" target="_blank"><img src="${conPath }/boardPhoto/maple.png" class="img1"></a>
			<a href="https://lostark.game.onstove.com/Main" target="_blank"><img src="${conPath }/boardPhoto/lostark.png" class="img1"></a>
		</div>
		<div id="section2">
			<div class="news">
			<p>게임소식</p>
			<ul>
				<li class="num1"><a href="https://www.gamemeca.com/view.php?gid=1682080" target="_blank">[노8리뷰] 우마무스메 하다 혈압 폭..</a></li>
                <li class="num2"><a href="https://www.gamemeca.com/view.php?gid=1682244" target="_blank">18주년 맞은 아레스 온라인, 로드맵, ..</a></li>
                <li class="num3"><a href="https://www.gamemeca.com/view.php?gid=1682326" target="_blank">던파 김윤종 사단, 현실 점령 ..</a></li>
                <li class="num4"><a href="https://www.gamemeca.com/view.php?gid=1682104" target="_blank">[이구동성] 게임업계 워라밸 비상..</a></li>
                <li class="num5"><a href="https://www.gamemeca.com/view.php?gid=1682322" target="_blank">[순정남] 격투게이머가 좋아 죽는..</a></li>
                <li class="num6"><a href="https://www.gamemeca.com/view.php?gid=1682214" target="_blank">[겜ㅊㅊ] 압도적 스토리텔링, 저세상..</a></li>
                <li class="num7"><a href="https://www.gamemeca.com/view.php?gid=1682133" target="_blank">‘핑크빈’ 카트로 헤네시스 달리자, 카트X메이플..</a></li>
                <li class="num8"><a href="https://www.gamemeca.com/view.php?gid=1682208" target="_blank">올해 지스타, 모바일·콘솔·PC 어..</a></li>
                <li class="num9"><a href="https://www.gamemeca.com/view.php?gid=1682206" target="_blank">드퀘 느낌 진하네, ‘원피스 오디세이’..</a></li>
                <li class="num10"><a href="https://www.gamemeca.com/view.php?gid=1682095" target="_blank">[오늘의 스팀] 몬헌 라이즈 선브레이크, ..</a></li>
			</ul>
			</div>
		</div>
		<div id="section3">
			<table class="tY">
				<caption>떡먹는 용만이를 찾아라!!</caption>
    			<tr><td id="0"></td><td id="1"></td><td id="2"></td></tr>
    			<tr><td id="3"></td><td id="4"></td><td id="5"></td></tr>
   				 <tr><td id="6"></td><td id="7"></td><td id="8"></td></tr>
  			</table>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>