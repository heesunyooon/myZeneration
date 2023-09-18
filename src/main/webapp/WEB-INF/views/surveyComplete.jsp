<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" import = "javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 만족도 조사 완료 화면 -->

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
				<p>응답이 기록되었습니다.<br>
				감사합니다.</p>
			</div>
			<input type="button" value="확인" class="submitBtn">
		</div>
	</div> 

    <script>
        const submit = document.querySelector(".submitBtn");
        submit.addEventListener('click',()=>{
            window.close();
        })
    </script>
</body>
</html>
