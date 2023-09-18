<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- MZ세대 만족도 분석 서비스 -->

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

	<section id="main" class="container">
		<header class="ani bottom delay0">
			<h2>MZ세대 만족도 비교</h2>
			<p>MZ세대의 만족도별 구성인원 비교 서비스</p>
		</header>

		<div class="box">
			<div class="ani bottom delay1">
				<h3>카테고리 내 항목 선택</h3>
				<form action="/core/analysisMz" method="post" name="category">
				    <div class="choice">
				        <div class="select width-narrow">
				            <h4>성별</h4>
				            <input type="checkbox" id="sexMale" name="sex" value="남"><label for="sexMale">남성</label><br>
				            <input type="checkbox" id="sexFemale" name="sex" value="여"><label for="sexFemale">여성</label>
				        </div>
				        <div class="select">
				            <h4>연령</h4>
				            <input type="checkbox" id="age20_1" name="age" value="20대 초반"><label for="age20_1">20대 초(20~23)</label>
				            <input type="checkbox" id="age20_2" name="age" value="20대 중반"><label for="age20_2">20대 중(24~26)</label><br>
				            <input type="checkbox" id="age20_3" name="age" value="20대 후반"><label for="age20_3">20대 후(27~29)</label>
				            <input type="checkbox" id="age30_1" name="age" value="30대 초반"><label for="age30_1">30대 초(30~33)</label><br>
				            <input type="checkbox" id="age30_2" name="age" value="30대 중반"><label for="age30_2">30대 중(34~36)</label>
				            <input type="checkbox" id="age30_3" name="age" value="30대 후반"><label for="age30_3">30대 후(37~39)</label><br>
				        </div>
				        <div class="select wider">
				            <h4>삶의 만족도 점수</h4>
				            <input type="checkbox" id="score5" name="lifeScore" value="50"><label for="score5">50점 대</label>
				            <input type="checkbox" id="score6" name="lifeScore" value="60"><label for="score6">60점 대</label>
				            <input type="checkbox" id="score7" name="lifeScore" value="70"><label for="score7">70점 대</label>
				            <input type="checkbox" id="score8" name="lifeScore" value="80" ><label for="score8">80점 대</label>
				            <input type="checkbox" id="score9" name="lifeScore" value="90"><label for="score9">90점 대</label>
				            <input type="checkbox" ><label style="border:none;"></label>
				        </div>
				    </div>
				</form>
			</div>
			<hr>
			<h3 class="ani bottom">삶의 만족도 구성비</h3>
			<div class="contents-wrap row" id="ctnts">
				<h4 class="textblue-topic ani bottom">MZ세대 만족도 비교</h4>
				<p class=" description-topic ani bottom">
					<span class="onColorBlue" id="sexSelect"></span>
					<span class="onColorBlue" id="ageSelect"></span>	사람들 중 삶의 만족도가
					<span class="onColorBlue" id="lifeScoreSelect"></span>인
					사람들의 구성은 다음과 같습니다.
				</p>
				<div class="contents ani bottom delay0">
					<div class="contents-wrapper">
						<h3>학력별</h3>
						<hr style="margin: 0; margin-bottom: 1vh;">
						<div class="graph">
							<canvas id="education" width=400 height=200></canvas>
						</div>
						<div class="description" id="ratioEdu"><!-- 비율정보 -->
							<table>
								<tr id ="trEduItem"></tr>
								<tr id= "trEduRatio"></tr>
							</table>
						</div>
					</div>
				</div>

				<div class="contents ani bottom delay1">
					<div class="contents-wrapper">
						<h3>전공분류별</h3>
						<hr style="margin: 0; margin-bottom: 2vh;">
						<div class="graph">
							<canvas id="major" width=400 height=200></canvas>
						</div>
						<div class="description" id="ratioMajor">
							<table>
								<tr id ="trMajorItem"></tr>
								<tr id= "trMajorRatio"></tr>
							</table>
						</div>
					</div>
				</div>

				<div class="contents ani bottom delay0">
					<div class="contents-wrapper">
						<h3>연봉별</h3>
						<hr style="margin: 0; margin-bottom: 1vh;">
						<div class="graph">
							<canvas id="salary" width=400 height=200></canvas>
						</div>
						<div class="description" id="ratioSalary">
							<table>
								<tr id ="trSalaryItem"></tr>
								<tr id= "trSalaryRatio"></tr>
							</table>
						</div>
					</div>
				</div>

				<div class="contents ani bottom delay1">
					<div class="contents-wrapper">
						<h3>가구원수별</h3>
						<hr style="margin: 0; margin-bottom: 1vh;">
						<div class="graph">
							<canvas id="familyNo" width=400 height=200></canvas>
							<input type="hidden" id="arrCountFamilyNo"
								value="${arrCountFamilyNo}"> <input type="hidden"
								id="arrFamilyNo" value="${arrFamilyNo}">
						</div>
						<div class="description" id="ratioFamilyNo">
							<table>
								<tr id ="trFamilyNoItem"></tr>
								<tr id= "trFamilyNoRatio"></tr>
							</table>
						</div>
					</div>
				</div>

				<div class="contents ani bottom delay0">
					<div class="contents-wrapper">
						<h3>거주지역별</h3>
						<hr style="margin: 0; margin-bottom: 1vh;">
						<div class="graph">
							<canvas id="region" width=400 height=200></canvas>
							<input type="hidden" id="arrCountRegion"
								value="${arrCountRegion}"> <input type="hidden"
								id="arrRegion" value="${arrRegion}">
						</div>
						<div class="description" id="ratioRegion">
							<table>
								<tr id ="trRegionItem"></tr>
								<tr id= "trRegionRatio"></tr>
							</table>
						</div>
					</div>
				</div>

				<!-- 칸 맞추려고 일부러 위치시킴 -->
				<div class="contents" style="display: hidden"></div>
			</div>
		</div>
	</section>

	<%
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String lifeScore = request.getParameter("lifeScore");
	%>

	<script>
		var sexValues = '<%=sex%>'.split(',');
		var ageValue = '<%=age%>';
		var lifeScoreValue = '<%=lifeScore%>';
		 let sexButtons = document.querySelectorAll('input[name="sex"]'); //체크박스 성별 항목
		 let ageButtons = document.querySelectorAll('input[name="age"]'); //체크박스 연령 항목
		 let lifeScoreButtons = document.querySelectorAll('input[name="lifeScore"]');//체크박스 만족도 항목
		
		 sexValues.forEach(sexValue => {
			   sexButtons.forEach(sexButton => {
			      if (sexButton.value === sexValue) {
			         sexButton.checked = true;
			      }
			   });
			});
		 
		 ageButtons.forEach(ageButton => {
				if(ageButton.value===ageValue){
					ageButton.checked = true;
				}
			});
		 
		 lifeScoreButtons.forEach(lifeScoreButton => {
				if(lifeScoreButton.value===lifeScoreValue){
					lifeScoreButton.checked = true;
				}
			});
	</script>
	<script src="${contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/analysisMz.js"></script>
	<script src="${contextPath}/resources/js/needRequest.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	
</body>

</html>
