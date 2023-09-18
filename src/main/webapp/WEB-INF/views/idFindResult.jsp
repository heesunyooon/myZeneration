<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 아이디 찾기 결과 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="common/head.jsp" /><!-- 공통헤드 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<body>
	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/header.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/headerLogOut.jsp" />
	</c:if>

	<section id="main" class="container medium ">
		<header>
			<h2>아이디 찾기 결과</h2>
			<p>회원님의 아이디는 다음과 같습니다.</p>
		</header>
		<div class="box resultBox">
			<table class="idResultTable">
				<tr>
					<td style="width: 30%;">ID</td>
					<td>${resultId }</td>
				</tr>
			</table>
			<div style="text-align: center; font-size: 17px;">
				<a href="loginView">로그인</a> | <a href="pwFindView">비밀번호찾기</a>
				| <a href="joinView">회원가입</a>
			</div>
		</div>
	</section>
	<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
