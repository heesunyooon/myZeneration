<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 비밀번호 변경 화면 -->

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
	<section id="main" class="container medium">


		<header>
			<h2>비밀번호 변경</h2>
			<p>변경할 비밀번호를 입력해주세요.</p>
		</header>

		<div class="box join-box">
			<form action="${contextPath}/member/pwChange" method="post" name="pwChange" class="form-group">
				<ul>
					<li>
						<label class="form-label input-info"> 비밀번호</label>
						<input class="form-control user-input" type="password" style="margin-bottom:8%" name="pw" autofocus required placeholder="변경하려는 비밀번호를 입력하세요.">
					</li>
				</ul>
				<div style="text-align: center;">
					<input type="submit" class="joinOk" style="margin-bottom:3%"  value="비밀번호 변경 ">
				</div>

			</form>		
			<div style="text-align: center; font-size: 17px;">
				<a href="/member/loginView">로그인</a> | <a href="/member/pwFindView">비밀번호 찾기</a> | <a href="/member/joinView" style="color: rgb(48, 92, 214);">회원가입</a>
			</div>
		</div>
	</section>


	<script src="${contextPath}/resources/js/member.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
</body>
</html>
