<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 비밀번호 변경완료 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="common/head.jsp" />
<!-- 공통헤드 -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<body>
	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/header.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/headerLogOut.jsp" />
	</c:if>

	<!-- Main -->
	<section id="main" class="container medium joinOkView">
		<header class="joinOkView">
			<h2>비밀번호 변경이 완료되었습니다.</h2>
			<p>변경된 비밀번호로 로그인 해주시기 바랍니다.</p>
		</header>
		<input class="go-to-main" type="button" value="메인화면으로 가기" onClick="location.href='/MyZeneration_spring/'">
	</section>

	<script src="${contextPath}/resources/js/member.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
</body>
</html>
