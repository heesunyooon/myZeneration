<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 만족도 조사 화면 -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/surveyForm.css">
</head>
<body>

	<div class="contents">
		<div class="form">
			<div class="notice">
				<p class="topic">MyZeneration 회원가입</p>
				<p>
					MyZeneration 서비스 이용을 위한 회원가입 설문입니다.<br> 해당되는 항목을 체크하여 제출해주시길
					바랍니다.
				</p>
			</div>

			<form name="survey" class="survey" method="post">
				<input type="hidden" name="id" value="${memberId }">
				<!--1. 성별-->
				<div>
					<p>01. 성별을 선택해주세요.</p>
					<br> <input type="radio" name="sex" value="남" >남자<br>
					<input type="radio" name="sex" value="여">여자
				</div>

				<!--2. 나이-->
				<div>
					<p>02. 나이를 선택해주세요.</p>
					<select name="age" required>
						<option value="0">선택사항</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
						<option value="32">32</option>
						<option value="33">33</option>
						<option value="34">34</option>
						<option value="35">35</option>
						<option value="36">36</option>
						<option value="37">37</option>
						<option value="38">38</option>
						<option value="39">39</option>
					</select>
				</div>

				<!--3. 최종학력-->
				<div>
					<p>03. 최종학력을 선택해주세요.</p>
					<input type="radio" name="education" value="고등학교졸업">고등학교졸업<br> 
					<input type="radio" name="education" value="대학교졸업">대학교 졸업(2,3,4년제) <br>
					<input type="radio" name="education" value="대학원졸업">대학원 졸업 <br>
				</div>

				<!--4. 전공분류-->
				<div>
					<p>04. 전공분류를 선택해주세요.</p>
					<input type="radio" name="major" value="인문/사회">인문/사회<br>
					<input type="radio" name="major" value="이학/공학">이학/공학<br>
					<input type="radio" name="major" value="예체능">예체능
				</div>

				<!--5. 거주지역-->
				<div>
					<p>05. 거주하시는 지역을 선택해주세요.</p>
					<input type="radio" name="region" value="서울특별시">서울특별시<br>
					<input type="radio" name="region" value="부산광역시">부산광역시<br>
					<input type="radio" name="region" value="광주광역시">광주광역시
				</div>

				<!--6. 세전연봉-->
				<div>
					<p>06. 세전급여(1년동안 받는 급여)를 선택해주세요.</p>
					<select name="salary" required>
						<option value="0">선택사항</option>
						<option value="1000">2000만원 미만</option>
						<option value="2000">2000만원 대</option>
						<option value="3000">3000만원 대</option>
						<option value="4000">4000만원 대</option>
						<option value="5000">5000만원 대</option>
						<option value="6000">6000만원 대</option>
					</select>
				</div>

				<!--7. 가구원수-->
				<div>
					<p>07. 가구원수를 선택해주세요.</p>
					<input type="radio" name="familyNo" value="1">1인<br>
					<input type="radio" name="familyNo" value="2">2인<br>
					<input type="radio" name="familyNo" value="3">3인<br>
					<input type="radio" name="familyNo" value="4">4인<br>
					<input type="radio" name="familyNo" value="5">5인 이상
				</div>

				<!--8. 거주형태-->
				<div>
					<p>08. 거주형태를 선택해주세요.</p>
					<input type="radio" name="residence" value="부모님과동거">부모님과 동거<br>
					<input type="radio" name="residence" value="자가">자가<br>
					<input type="radio" name="residence" value="전세">전세<br>
					<input type="radio" name="residence" value="월세">월세<br>
				</div>

				<!--9. 근로시간-->
				<div>
					<p>09. 근로시간을 선택해주세요.</p>
					<input type="radio" name="workingHour" value="40시간미만">40시간
					미만<br> <input type="radio" name="workingHour" value="40~49시간">40~49시간<br>
					<input type="radio" name="workingHour" value="50~59시간">50~59시간<br>
					<input type="radio" name="workingHour" value="60시간이상">60시간
					이상<br>
				</div>

				<!--10. 결혼여부-->
				<div>
					<p>10. 결혼여부를 선택해주세요.</p>
					<input type="radio" name="marriage" value="미혼">미혼<br>
					<input type="radio" name="marriage" value="기혼">기혼<br>
				</div>

				<!--11. 삶의 만족도-->
				<div>
					<p>11. 삶의 만족도를 선택해주세요.</p>
					<select name="lifeScore" required>
						<option value=0>선택사항</option>
						<option value="100">100</option>
						<option value="99">99</option>
						<option value="98">98</option>
						<option value="97">97</option>
						<option value="96">96</option>
						<option value="95">95</option>
						<option value="94">94</option>
						<option value="93">93</option>
						<option value="92">92</option>
						<option value="91">91</option>
						<option value="90">90</option>
						<option value="89">89</option>
						<option value="88">88</option>
						<option value="87">87</option>
						<option value="86">86</option>
						<option value="85">85</option>
						<option value="84">84</option>
						<option value="83">83</option>
						<option value="82">82</option>
						<option value="81">81</option>
						<option value="80">80</option>
						<option value="79">79</option>
						<option value="78">78</option>
						<option value="77">77</option>
						<option value="76">76</option>
						<option value="75">75</option>
						<option value="74">74</option>
						<option value="73">73</option>
						<option value="72">72</option>
						<option value="71">71</option>
						<option value="70">70</option>
						<option value="69">69</option>
						<option value="68">68</option>
						<option value="67">67</option>
						<option value="66">66</option>
						<option value="65">65</option>
						<option value="64">64</option>
						<option value="63">63</option>
						<option value="62">62</option>
						<option value="61">61</option>
						<option value="60">60</option>
						<option value="59">59</option>
						<option value="58">58</option>
						<option value="57">57</option>
						<option value="56">56</option>
						<option value="55">55</option>
						<option value="54">54</option>
						<option value="53">53</option>
						<option value="52">52</option>
						<option value="51">51</option>
						<option value="50">50</option>
						<option value="49">49</option>
						<option value="48">48</option>
						<option value="47">47</option>
						<option value="46">46</option>
						<option value="45">45</option>
						<option value="44">44</option>
						<option value="43">43</option>
						<option value="42">42</option>
						<option value="41">41</option>
						<option value="40">40</option>
						<option value="39">39</option>
						<option value="38">38</option>
						<option value="37">37</option>
						<option value="36">36</option>
						<option value="35">35</option>
						<option value="34">34</option>
						<option value="33">33</option>
						<option value="32">32</option>
						<option value="31">31</option>
						<option value="30">30</option>
						<option value="29">29</option>
						<option value="28">28</option>
						<option value="27">27</option>
						<option value="26">26</option>
						<option value="25">25</option>
						<option value="24">24</option>
						<option value="23">23</option>
						<option value="22">22</option>
						<option value="21">21</option>
						<option value="20">20</option>
						<option value="19">19</option>
						<option value="18">18</option>
						<option value="17">17</option>
						<option value="16">16</option>
						<option value="15">15</option>
						<option value="14">14</option>
						<option value="13">13</option>
						<option value="12">12</option>
						<option value="11">11</option>
						<option value="10">10</option>
						<option value="9">9</option>
						<option value="8">8</option>
						<option value="7">7</option>
						<option value="6">6</option>
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
				</div>
				
				<input type="hidden" name="sexScore" id="sexScore">
				<input type="hidden" name="ageScore" id="ageScore">
				<input type="hidden" name="eduacationScore" id="eduacationScore">
				<input type="hidden" name="majorScore" id="majorScore">
				<input type="hidden" name="regionScore" id="regionScore">
				<input type="hidden" name="salaryScore" id="salaryScore">
				<input type="hidden" name="familyNoScore" id="familyNoScore">
				<input type="hidden" name="residenceScore" id="residenceScore">
				<input type="hidden" name="workingHourScore" id="workingHourScore">
				<input type="hidden" name="marriageScore" id="marriageScore">
				<input type="hidden" name="predictLifeScore" id="predictLifeScore">
				
				<input type="button" value="제출" class="submitBtn" onclick="checkNullSurvey()">
			</form>
		</div>
	</div>
	<script src="${contextPath}/resources/js/needRequest.js"></script>
</body>
</html>
