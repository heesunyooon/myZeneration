<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 아이디 찾기 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="common/head.jsp" /><!-- 공통헤드 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css">
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
			<h2>아이디 찾기</h2>
			<p>가입 시 입력하신 이메일로 가입여부를 확인합니다.</p>
		</header>
		<div class="box join-box">
			<form action="${contextPath}/member/idFind" method="post" name="formIdFind">
				<ul style="padding: 1.5em 3.5em 2em 3.5em;">
					<li>
						<p>이름</p>
						<br> <input type="text" name="name" style="width: 100%"
						autofocus required placeholder="이름">
					</li>
					<li>
						<p>이메일</p>
						<br> <input type="email" id="email" name="eMail" required
						placeholder="MyZeneration_servlet@example.com">
					</li>
				</ul>
				<div style="text-align: center;">
					<input type="submit" class="joinOk" value="아이디 찾기 ">
				</div>
			</form>
			<div style="text-align: center; font-size: 17px;">
				<a href="loginView.member">로그인</a> | <a href="${contextPath }/member/pwFindView">비밀번호
					찾기</a> | <a href="${contextPath }/member/joinView" style="color: rgb(48, 92, 214);">회원가입</a>
			</div>
		</div>
	</section>

	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/member.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
</body>
</html>
