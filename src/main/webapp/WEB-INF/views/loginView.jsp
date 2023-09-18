<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 로그인 화면 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="common/head.jsp"/> <!-- 공통헤드 -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/login.css">
</head>
<body class="body-login">
	<c:if test="${memberId eq 'example'}">
		<jsp:include page="common/header.jsp" />
	</c:if>
	<c:if test="${memberId ne 'example' }">
		<jsp:include page="common/headerLogOut.jsp" />
	</c:if>
	
    <div id="header-login">        
        <div class="container-login  ani bottom">
            <div style="margin-top:16%" >
                <p class="login-topic">Login</p><br>
                
                <form action="login.member" method="post">
	                <input type="text" name="id" class="input-id" placeholder="아이디입력"><br>
	                <input type="password" name="password" class="input-pw" placeholder="비밀번호 입력">
	                <p class="id-pw"><a href="${contextPath }/member/idFindView">아이디찾기</a><span style="color:rgb(145,145,145); height:10px; padding:10px;">|</span><a href="${contextPath }/member/pwFindView">비밀번호찾기</a></p>
	                <input type="submit" class="login-btn"  value="로그인"><br>
                </form> 
                
                <span class="join-text">MyZeneration의 회원이 아니신가요?</span><a href="${contextPath }/member/joinView" class="join-text" style="text-decoration: none; color:#0082c8;">&nbsp;회원가입</a>
            </div>
         </div>
      </div>
      
	<script src="${contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/resources/js/common.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
