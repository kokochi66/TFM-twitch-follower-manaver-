<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %><c:set var="path" value="/resources"/>

<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-lg-block">
  <div class="container d-flex">
    <div class="logo mr-auto">
      <h1 class="text-light"><a href="/" title="홈페이지의 메인 타이틀입니다."><span>TFM</span></a></h1>
    </div>
    <div class="social-links">
      <a href="https://www.twitch.tv/" class="twitch" target="_blank"><i class="icofont-twitch" title="트위치 홈페이지로 이동하는 링크"></i></a>
      
      <div class="dropdown d-inline">
        <a href="#" class="login dropdown-toggle" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false"><i class="icofont-user-alt-7" title="사용자의 로그인 상태를 표시해줌"></i></a>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
          <li><button class="dropdown-item" type="button" onclick="location.href='/auth/login'">로그아웃</button></li>
          <li><button class="dropdown-item" type="button" onclick="location.href='/menu/setting'">설정</button></li>
          <li><button class="dropdown-item" type="button" onclick="location.href='/menu/managefollow'">팔로우 채널 관리</button></li>
          <li><button class="dropdown-item" type="button" onclick="location.href='/menu/replayvideo'">다시보기 찜 관리</button></li>
        </ul>
      </div>
    </div>
  </div>
</section>