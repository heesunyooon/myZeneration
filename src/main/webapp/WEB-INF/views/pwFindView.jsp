<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 비밀번호 찾기 화면 -->

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

	<!-- Main -->
	<section id="main" class="container medium">
		<header>
			<h2>비밀번호 찾기</h2>
			<p>가입 시 입력하신 아이디와 이메일로 비밀번호를 변경합니다.</p>
		</header>

		<div class="box join-box">
			<form action="${contextPath}/member//verifyMember" method="post" name="pwFind" class="form-group">
				<ul>
					<li>
						<label class="form-label input-info">이름</label>
						<input class="form-control user-input" type="text" name="name" autofocus required placeholder="이름">
					</li>
					<li>
						<label class="form-label input-info">아이디</label>
						<input class="form-control user-input" type="text" name="id" required placeholder="아이디">
					</li>
					<li>
						<label class="form-label input-info">이메일</label>
						<input class="form-control user-input" type="email" name="eMail" required placeholder="이메일">
					</li>
				</ul>
				<div style="text-align: center;">
					<input type="submit" class="joinOk" value="비밀번호 찾기 ">
				</div>
			</form>		
			
			<div style="text-align: center; font-size: 17px;">
				<a href="/member/loginView">로그인</a> | <a href="/member/pwFindView">비밀번호 찾기</a> | <a href="/member/joinView" style="color: rgb(48, 92, 214);">회원가입</a>
			</div>
		</div>
	</section>

	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/member.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
