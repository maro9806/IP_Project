<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<html>
<head>
  <title>IPro-AIInterview</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/ai_board.css">
</head>
<body>
<jsp:include page="../navbar.jsp" />

<!-- 배너 -->
<div class="jumbotron p-5 rounded">
  <h1 class="display-4">AI 면접 준비</h1>
  <p class="lead">AI가 면접 질문 추출 및 답변을 도와주고 가상 면접 기회를 제공해요</p>
  <hr>
</div>
<%--  <div class="banner mb-5" style="height:150px">--%>
<%--    <h3 class="title">AI 면접 준비</h3>--%>
<%--    <p class="p-title">AI가 면접 질문 추출 및 답변을 도와주고 가상 면접 기회를 제공해요</p>--%>
<%--  </div>--%>

<!-- 메인 콘텐츠 -->
<div class="content d-flex flex-column align-items-center">

  <!-- 섹션 -->
  <h4 class="h-title">면접 진행 순서</h4>
  <div class="progress" style="width:75%; height:150px; margin: 40px 40px 40px 100px;">
    <div class="progress-bar stage" style="width:20%; margin-right:10px; border-color: #a6e3a1;">
      <h5><b>1 Stage</b></h5> <h6>정보 입력</h6>
    </div>
    <div class="progress-bar stage" style="width:20%; margin:0 10px; border-color: #a6e3a1;">
      <h5><b>2 Stage</b></h5> <h6>질문 답변 및 피드백</h6>
    </div>
    <div class="progress-bar stage" style="width:20%; margin:0 10px; border-color: #a6e3a1;">
      <h5><b>3 Stage</b></h5> <h6> 답변 확인 및 저장</h6>
    </div>
    <div class="progress-bar stage" style="width:20%; margin:0 10px; border-color: #75c9e9a3;">
      <h5><b>4 Stage</b></h5> <h6>영상 면접 응시</h6>
    </div>
    <div class="progress-bar stage" style="width:20%; margin-left:10px; border-color: #75c9e9a3;">
      <h5><b>5 Stage</b></h5> <h6>면접 내역 확인</h6>
    </div>
  </div>


<h4 class="h-title">AI 면접 시작하기</h4>
  <section class="container">
    <form action="${pageContext.request.contextPath}/aiboard/ai_custominfo" method="get" class="card-form">
      <button type="submit" id="box1" class="card">
        <div class="card-body">
          <h4 class="box-title">맞춤 질문·답변<br> 생성하기</h4>
          <span>나에게 맞는 질문을 확인하고</span><br>
           <span>면접 답변을 미리 구성해봐요</span>
        </div>
      </button>
    </form>

    <form action="${pageContext.request.contextPath}/aiboard/ai_preparation" method="get" class="card-form">
      <button type="submit" id="box2" class="card">
        <div class="card-body">
          <h4 class="box-title">가상 영상 면접<br> 보러가기</h4>
          <span>바로 실전연습으로! </span><br>
           <span>가상 영상 면접 보러갈래요</span>

        </div>
      </button>
    </form>


  </section>

</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>
