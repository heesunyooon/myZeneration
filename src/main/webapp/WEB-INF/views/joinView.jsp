<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 회원가입 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="common/head.jsp" /><!-- 공통헤드 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css" />
</head>

<body>
	<c:if test="${memberId eq 'example'}">
	<jsp:include page="common/header.jsp" />
</c:if>
<c:if test="${memberId ne 'example' }">
	<jsp:include page="common/headerLogOut.jsp" />
</c:if>

	<section id="main" class="container medium">
		<header>
			<h2>회원가입</h2>
			<p>MyZeneration에 오신걸 환영합니다.</p>
		</header>
		<div class="box join-box">
			<form name="memberJoin" method="post" class="ani bottom">
				<ul class="join-box">
					<li>
						<p>아이디</p>
						<br> <input type="text" name="id" id="id" autofocus required placeholder="아이디(ID)"> <input type="button" id="idCheck"
						onclick='window.idCheck()' value="중복확인">
					</li>
					<li>
						<p>비밀번호</p>
						<br> <input type="password" id="pw" name="pw" required placeholder="비밀번호(8~16자 영문, 숫자, 특수기호)">
					</li>
					<li>
						<p>비밀번호 확인</p>
						<br> <input type="password" id="pw_check" name="pw_check" required placeholder="비밀번호 확인">
					</li>
					<li>
						<p>이름</p>
						<br> <input type="text" name="name" id="name" required placeholder="이름 입력">
					</li>
					<li>
						<p>이메일</p>
						<br> <input type="email" name="eMail" id="email"
						pattern=" .+@." required placeholder="Example@example.com">
					</li>
					<li>
						<p>전화번호</p>
						<br> <input type="number" type="text" type="text" name="tel" id="tel" required placeholder="'-' 빼고 숫자만 입력">
					</li>
				</ul>
				<div style="text-align: center;">
					<input type="button" class="joinOk" value="회원가입 완료" onclick="joinCheck()">
				</div>
			</form>
		</div>
	</section>

	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/footer.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/footerLogOut.jsp" />
	</c:if>

	<script src="${contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/needRequest.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
