<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<html>
<head>
    <title>IPro-interview</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/stage.css">
</head>
<body>
<jsp:include page="../navbar.jsp" />

<!-- 메인 콘텐츠 -->
<div class="content">
  <!-- 배너 -->
  <div class="banner">
    <h3 class="title">AI 면접 준비</h3>
    <p class="p-title">AI 추출 질문 및 면접 공통 질문을 바탕으로 가상 면접 기회를 제공해요</p>
  </div>


  <!-- 섹션 -->
  <h4 class="h-title">AI 면접 시작하기</h4>
  <section class="container">

    <form action="${pageContext.request.contextPath}/aiboard/ai_custominfo" method="get" class="card-form">
      <button type="submit" id="box1" class="card">
        <div class="card-body">
          <h4 class="box-title">맞춤 질문 면접</h4>
        </div>
      </button>
    </form>

    <form action="${pageContext.request.contextPath}/aiboard/ai_question" method="get" class="card-form">
      <button type="submit" id="box2" class="card">
        <div class="card-body">
          <h4 class="box-title">공통 질문 면접<</h4>
        </div>
      </button>
    </form>


  </section>
  <ul>
    <li>질문 저장 내역 (0)</li>
    <li>영상 면접 응시 내역 (1)</li>
  </ul>

  <h4 class="h-title">면접 진행 순서</h4>
  <br>
  <h5 class="p-title"> - 맞춤 질문 면접</h5>
  <div class="progress" style="width:50%; height:80px; margin: 40px;">

    <div id="stage1" class="progress-bar stage" style="width:20%; margin-right:5px;">
      <h5>1 Stage</h5> <h6>정보 입력</h6>
    </div>
    <div id="stage2" class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>2 Stage</h5> <h6>질문 답변 및 피드백</h6>
    </div>
    <div id="stage3" class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>3 Stage</h5> <h6> 답변 확인 및 저장</h6>
    </div>
    <div id="stage4" class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>4 Stage</h5> <h6>영상 면접 응시</h6>
    </div>
    <div id="stage5" class="progress-bar" style="width:20%; margin-left:5px;">
      <h5>5 Stage</h5> <h6>면접 내역 확인</h6>
    </div>

  </div>

  <br>
  <h5 class="p-title"> - 공통 질문 면접</h5>
  <div class="progress" style="width:50%; height:80px; margin: 40px;">
    <div id="stage">
    <div class="progress-bar" style="width:20%; margin-right:5px;">
      <h5>1 Stage</h5> <h6>질문 선택</h6>
    </div>
    <div class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>2 Stage</h5> <h6>질문 답변 및 피드백</h6>
    </div>
    <div class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>3 Stage</h5> <h6>답변 확인 및 저장</h6>
    </div>
    <div class="progress-bar" style="width:20%; margin:0 5px;">
      <h5>4 Stage</h5> <h6>영상 면접 응시</h6>
    </div>
    <div class="progress-bar" style="width:20%; margin-left:5px;">
      <h5>5 Stage</h5> <h6>면접 내역 확인</h6>
    </div>
    </div>
  </div>

</div>


<!-- HTML -->
<footer class="footer">
  <div class="container">
    <div class="footer-left">
      <p>© 2024 Your Company Name</p>
    </div>
    <div class="footer-right">
      <ul>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Terms of Service</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
  </div>
</footer>

</body>
</html>
