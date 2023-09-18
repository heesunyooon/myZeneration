<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 회원가입 완료 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="common/head.jsp" />
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<body>
	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/header.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/headerLogOut.jsp" />
	</c:if>

	<section id="main" class="container medium joinOkView">
		<header class="joinOkView">
			<h2>회원가입이 완료되었습니다.</h2>
			<p>로그인 후 MyZeneration에서 제공하는 모든 서비스를 이용하실 수 있습니다.</p>
		</header>
		<input class="go-to-main" type="button" value="메인화면으로 가기"
			onClick="location.href='/MyZeneration_spring/'">
	</section>

	<script>
		let popup = window.open("survey",	"_blank");
		if (popup == null) {
			alert("팝업 차단이 설정되어있습니다. \n차단 해제 후 새로고침 바랍니다.");
		}
	</script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
</body>
</html>
