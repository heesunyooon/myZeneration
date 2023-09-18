<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer>
	<div class="inner">
	    <ul class="menu">
	     <li><a class="color" href="analysisMySat.core?memberId=<%= session.getAttribute("memberId") %>">나의 만족도 예측 서비스</a></li>
	     <li><a class="color" href="analysisMzView.core?memberId=<%= session.getAttribute("memberId") %>">MZ세대 만족도 비교</a></li>
	     <li><a href="bList.board?memberId=<%= session.getAttribute("memberId") %>">문의하기</a></li>
	     <li><a href="loginView.member">로그인</a></li>
	     <li><a href="joinView.member">회원가입</a></li>
	    </ul>
	
	
	    <div class="info">
	     <span>MyZeneration 대표이사 윤희선</span>
	     <span>TEL : 010) 3009-9383</span>
	     <span>웹페이지 책임자 : 윤희선</span>
	     <span>주소 : 서울 마포구 신촌로 104 그린컴퓨터아카데미</span>
	    </div>
	
	    <p class="copyright">
	    &copy; <span class="this-year"></span> MyZeneration. All Rights Reserved.</p>
	</div>
</footer> 
