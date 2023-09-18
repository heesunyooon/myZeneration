<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.simple.JSONArray"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 나의 만족도 예측 서비스 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="common/head.jsp" /><!-- 공통헤드 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
</head>
<body>
	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/header.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/headerLogOut.jsp" />
	</c:if>

	<section id="main" class="container">
		<header class="ani bottom delay0">
			<h2>${memberInfo.name }님의 만족도 예측서비스</h2>
			<p>만족도 향상을 위한 솔루션 제안</p>
		</header>
		<!--사용자가 입력한 정보-->
		<div class="box">
			<div>
				<h3 class="ani bottom delay1">내가 입력한 정보</h3>
				<table class="field ani bottom delay2">
					<tr>
						<td class="table-field">성별</td>
						<td><input type="text"  id ="sexSelect" value="${memberInfo.sex}"></td> <!-- 고정 -->
						<td class="table-field">나이</td>
						<td><input type="text"  id ="ageSelect" value="${memberInfo.age}">세</td> <!-- 고정 -->
					</tr>
					<tr>
						<td class="table-field">최종 학력</td>
						<td>
							<select id="educationSelect">
								<c:forEach var="education" items="${educationList}">
									<c:if test="${memberInfo.education eq education}">
										<option value="${education}" selected>${education}</option>
									</c:if>
									<c:if test= "${memberInfo.education ne education}">
										<option value="${education}">${education}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="table-field">전공 분류</td>
						<td>
							<select id="majorSelect">
								<c:forEach var="major" items="${majorList}">
									<c:if test="${memberInfo.major eq major}">
										<option value="${major}" selected>${major}</option>
									</c:if>
									<c:if test= "${memberInfo.major ne major}">
										<option value="${major}">${major}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-field">거주 지역</td>
						<td>
							<select id="regionSelect">
								<c:forEach var="region" items="${regionList}">
									<c:if test="${memberInfo.region eq region}">
										<option value="${region}" selected>${region}</option>
									</c:if>
									<c:if test= "${memberInfo.region ne region}">
										<option value="${region}">${region}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="table-field">연 임금</td>
						<td>
							<select id="salarySelect">
								<c:forEach var="salary" items="${salaryList}">
									<c:if test="${memberInfo.salary eq salary}">
										<option value="${salary}" selected>${salary} 만원</option>
									</c:if>
									<c:if test= "${memberInfo.salary ne salary}">
										<option value="${salary}">${salary} 만원</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-field">가구원 수</td>
						<td>
							<select id="familyNoSelect">
								<c:forEach var="familyNo" items="${familyNoList}">
									<c:if test="${memberInfo.familyNo eq familyNo}">
										<option value="${familyNo}" selected>${familyNo}인</option>
									</c:if>
									<c:if test= "${memberInfo.familyNo ne familyNo}">
										<option value="${familyNo}">${familyNo}인</option>
									</c:if>
								</c:forEach>
							</select>
						</td>	
						<td class="table-field">거주 형태</td>
						<td>
							<select id="residenceSelect">
								<c:forEach var="residence" items="${residenceList}">
									<c:if test="${memberInfo.residence eq residence}">
										<option value="${residence}" selected>${residence}</option>
									</c:if>
									<c:if test= "${memberInfo.residence ne residence}">
										<option value="${residence}">${residence}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-field">근로 시간</td>
						<td>
							<select id="workingHourSelect">
								<c:forEach var="workingHour" items="${workingHourList}">
									<c:if test="${memberInfo.workingHour eq workingHour}">
										<option value="${workingHour}" selected>${workingHour}</option>
									</c:if>
									<c:if test= "${memberInfo.workingHour ne workingHour}">
										<option value="${workingHour}">${workingHour}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="table-field">결혼 여부</td>
						<td>
							<select id="marriageSelect">
								<c:forEach var="marriage" items="${marriageList}">
									<c:if test="${memberInfo.marriage eq marriage}">
										<option value="${marriage}" selected>${marriage}</option>
									</c:if>
									<c:if test= "${memberInfo.marriage ne marriage}">
										<option value="${marriage}">${marriage}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<!--/사용자가 입력한 정보-->

			<!--만족도 분석 보고서 1번-->
			<div>
				<h3 class="ani bottom">만족도 분석 및 예측</h3>
				<p class="ani bottom delay1">
					현재 ${memberInfo.name}님의 삶의 만족도는 <span class="onColorBlue ani bottom"  id="ajaxLifeScore"></span>이며, 동일한 조건을
					가지고 있는 사람들의 평균 삶의 만족도는 <span class="onColorBlue ani bottom" id="totalScore"></span>입니다.<br> 입력하신 정보를 각
					항목당 백분율로 환산할 결과는 아래 그래프와 같습니다.
				</p>
				<div class="graphWrap ani bottom" id="radarWrap">
					<h4 style="margin: 4%; text-align: center;">${memberInfo.name}님의
						각 항목별 백분위</h4>
					<canvas id="radar" width="800" height="500" style="margin-bottom:8%"></canvas>
					<p class="radar-explain ani bottom ">${memberInfo.name }님의
						경우 <span class="onColorBlue" id="badItemList"></span> 항목을 개선하면 삶의
						만족도를 향상시킬 수 있습니다.
					</p>
				</div>
			</div>
			<!--/만족도 분석 보고서 1번-->


			<!--만족도 분석 보고서 2번-->
			<h3 style="margin-top: 5vh;" class="graphWrap ani bottom delay1">각
				항목별 개선점에 따른 예상 만족도</h3>
			<p class="graphWrap ani bottom delay2">만족도 증가율 상위 3개 항목은 다음과
				같습니다.</p>
			<div>
				<table class="recommend ani bottom">
					<tr>
						<td class="rankNo">순위</td>
						<td class="change">추천하는 변경사항</td>
						<td>예상 만족도 증가율</td>
					</tr>
					<tr>
						<td class="rankNo">1</td>
						<td id="changeTop1"></td>
						<td id="increaseRatio1">${Math.round((getScoreTop3[1]-getScoreTop3[0]) /getScoreTop3[0] * 100)}%</td>
					</tr>
					<tr>
						<td class="rankNo">2</td>
						<td id="changeTop2"></td>
						<td id="increaseRatio2">${Math.round((getScoreTop3[2]-getScoreTop3[0]) /getScoreTop3[0] * 100)}%</td>
					</tr>
					<tr>
						<td class="rankNo">3</td>
						<td id="changeTop3"></td>
						<td id="increaseRatio3">${Math.round((getScoreTop3[3]-getScoreTop3[0]) /getScoreTop3[0] * 100)}%</td>
					</tr>
				</table>
				<p style="margin-bottom: 2vh !important; margin-top: 2vh"
					class="ani bottom">각 항목 변경사항에 따른 예상만족도는 아래 그래프와 같습니다.</p>
				<div class="graphWrap ani bottom" id="radarWrap">
					<canvas id="bar" width="800" height="500"></canvas>
				</div>
			</div>
			<!--/본문-->
			<!--/만족도 분석 보고서 2번-->
			<h4 style="margin-top: 7vh;" class="ani bottom">
				다른 MZ세대의 만족도별 구성인원을 비교해서 보고싶다면 <a href='${contextPath }/core/analysisMz?sex=남,여&age=30대 초반&lifeScore=80&memberId=<%= session.getAttribute("memberId") %>'
					style="color: #2361d5">여기</a>를 클릭해주세요.
			</h4>
		</div>
	</section>


<!-- <script src="${contextPath}/resources/js/jquery.counterup.min.js"></script> -->
	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/analysisMySat.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
