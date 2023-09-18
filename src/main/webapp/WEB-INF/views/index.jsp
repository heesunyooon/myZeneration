<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 메인 화면 -->

<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/head.jsp" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/main.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">
		<c:if test="${memberId eq 'example'}">
			<jsp:include page="common/indexHeader.jsp" />
		</c:if>
		<c:if test="${memberId ne 'example' }">
			<jsp:include page="common/indexHeaderLogOut.jsp" />
		</c:if>

		<section id="banner">
			<div class="ani bottom">
				<h2>MyZeneration</h2>
				<p>The best solution for improving your happiness.</p>
				<ul class="actions special">
					<c:if test="${memberId eq 'example' }">
						<li><a href="${contextPath }/member/joinView" class="button primary">Sign
								Up</a></li>
					</c:if>
					<li>
						<a href="${contextPath }/core/analysisMySat?memberId=<%= session.getAttribute("memberId") %>" class="button">Explore</a>
					</li>
				</ul>
			</div>
		</section>

		<!-- 웹사이트 설명 -->
		<section id="main" class="container">
			<section class="box special ani bottom">
				<header class="major">
					<h2 style="color: rgb(138, 138, 138)">Service introduction</h2>
					<p class="ani bottom">
						2030 MZ세대 만족도 향상을 위해 한국 노동 연구소에서 약 13,000여가구를 <br>24년간 추적조사한
						데이터를 바탕으로 각 개인의 만족도를 향상시키기 위한 솔루션을 제시합니다.
					</p>
				</header>
			</section>


			<section class="box special features">
				<div class="features-row">
					<section class="ani bottom">
						<span class="icon solid major fa-bolt accent2"></span>
						<h3>개인정보 입력</h3>
						<p>설문지에 회원님의 정보 (성별, 연령, 최종학력, 전공분류, 거주지역, 연임금, 가구원수, 거주형태,
							근로시간, 결혼여부)를 입력합니다.</p>
					</section>

					<section class="ani bottom delay1">
						<span class="icon  major fa-bolt accent3"></span>
						<h3>빅데이터분석</h3>
						<p>회원가입 시 입력한 정보를 바탕으로 회원님의 조건과 유사한 조건을 가진 사람의 평균 만족도 정보를
							제공합니다.</p>
					</section>
				</div>

				<div class="features-row">
					<section class="ani bottom delay0">
						<span class="icon solid major fa-bolt accent4"></span>
						<h3>나의 만족도 예측</h3>
						<p>회원가입 시 입력한 정보를 바탕으로 회원님의 만족도를 높일 수 있는 방법에 대한 방향성을 제시합니다.</p>
					</section>

					<section class="ani bottom delay1">
						<span class="icon solid major fa-bolt accent5"></span>
						<h3>MZ세대 만족도 비교</h3>
						<p>카테고리 내 성별, 연령, 삶의 만족도를 선택하면 학력, 거주지역, 연봉, 전공분류, 가구원수 별 각 해당
							인원의 비율정보를 제공합니다.</p>
					</section>
				</div>
			</section>

			<div class="row">
				<div class="col-6 col-12-narrower">
					<section class="box special ani bottom delay0">
						<h3>원자료 보러가기</h3>
						<ul class="actions special">
							<li><a href="https://www.kli.re.kr/klips#secondPage"
								target='_blank' class="button alt">한국노동패널조사 사이트로 이동</a></li>
						</ul>
					</section>
				</div>

				<div class="col-6 col-12-narrower">
					<section class="box special ani bottom delay1">
						<h3>서비스 이용 시작하기</h3>
						<ul class="actions special">
							<li>
							<a href="${contextPath }/member/loginView" class="button alt">로그인</a>
							<a href="${contextPath }/member/joinView" class="button alt">회원가입</a>
							</li>
						</ul>
					</section>
				</div>
			</div>
		</section>
	</div>


	<c:if test="${memberId eq 'example' || memberId eq null}">
		<jsp:include page="common/footer.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/footerLogOut.jsp" />
	</c:if>

	<script src="${contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	<script src="${contextPath}/resources/js/common.js"></script>
	
</body>
</html>
