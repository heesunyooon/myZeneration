<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <!-- Header PC-->
	<header id="header" class="service">
		<h1><a href="${contextPath }/">MyZeneration</a> ver 1.0</h1>
		<nav id="nav">
			<ul>
				<li><a href="${contextPath }/">Home</a></li>
				<li><a href="${contextPath }/core/analysisMySat?memberId=<%= session.getAttribute("memberId") %>">나의 만족도 예측 서비스</a></li>
				<li><a href="${contextPath }/core/analysisMz?sex=남,여&age=30대 초반&lifeScore=80&memberId=<%= session.getAttribute("memberId") %>">MZ세대 만족도 비교 서비스</a></li>
		<!-- <li><a href="${contextPath }/board/bList?memberId=<%= session.getAttribute("memberId") %>">문의하기</a></li>-->
				<li><a href="${contextPath }/member/loginView" style="padding-right: 0.3em;">Log in</a>|<a href="${contextPath }/member/joinView" style="padding-left: 0.3em;">Sign up</a></li>						
			</ul>
		</nav>
	</header>
	<!-- /Header PC-->
	<!-- Header mobile-->
		<header id="header-mobile">
			<div class="toggleList">
				<div class="btn"><img src="${contextPath }/resources/img/navbar-toggle-b.png"></div>
				<ul>
					<li style="border-top-left-radius: 20px;"><a href="${contextPath }/">Home</a></li>
					<li><a href="${contextPath }/core/analysisMySat?memberId=<%= session.getAttribute("memberId") %>">나의 만족도 예측 서비스</a></li>
				<li><a href="${contextPath }/core/analysisMz?sex=남,여&age=30대 초반&lifeScore=80&memberId=<%= session.getAttribute("memberId") %>">MZ세대 만족도 비교 서비스</a></li>
			<!-- <li><a href="${contextPath }/board/bList?memberId=<%= session.getAttribute("memberId") %>">문의하기</a></li>-->
					<li><a href="${contextPath }/member/loginView" >Log in</a></li>
					<li  style="border-bottom:none; border-bottom-left-radius: 20px;"><a href="${contextPath }/member/joinView" >회원가입</a></li>		
				</ul>		
			</div>
		</header>
	<!-- /Header mobile-->
  
    
    
    
    
    
