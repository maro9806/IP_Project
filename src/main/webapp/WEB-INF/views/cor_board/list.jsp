page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/corpmain.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/globalfont.css">
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div class="main-content">
    <!-- Jumbotron -->
    <div class="jumbotron p-5 rounded">
        <h1 class="display-4">기업 분석 페이지 (Main)</h1>
        <p class="lead">앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?</p>
        <hr class="my-4">
        <p>AI가 분석해주는 SWOT · 최신 동향</p>
    </div>
    <div class="container mt-4">
        <!-- CorpSection -->
        <h2 class="section-title mt-5">기업 분석 카드 (10개)</h2>
        <div class="row row-cols-1 row-cols-md-5 g-4">
            <a href="${pageContext.request.context.path}/cor_board/corp">
                <div class="col">
                    <div class="card h-100">
                        <img src="path_to_image" class="card-img-top" alt="Company 1">
                        <div class="card-body" id="corp-card-body">
                            <h5 class="card-title">IT 기업 이름</h5>
                            <p class="card-text1">기업 형태</p>
                            <p class="card-text2">업종</p>
                        </div>
                    </div>
                </div>
            </a>
            <div class="col">
                <div class="card h-100">
                    <img src="/static/img/Nexonmain.svg" class="card-img-top" alt="Company 2">
                    <div class="card-body" id="corp-card-body1">
                        <h5 class="card-title">NEXON</h5>
                        <p class="card-text1">대기업</p>
                        <p class="card-text2">유선 온라인 게임 게임 소프트웨어...</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="path_to_image" class="card-img-top" alt="Company 3">
                    <div class="card-body" id="corp-card-body2">
                        <h5 class="card-title">IT 기업 이름</h5>
                        <p class="card-text1">기업 형태</p>
                        <p class="card-text2">업종</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="path_to_image" class="card-img-top" alt="Company 4">
                    <div class="card-body" id="corp-card-body3">
                        <h5 class="card-title">IT 기업 이름</h5>
                        <p class="card-text1">기업 형태</p>
                        <p class="card-text2">업종</p>
                    </div>
                </div>
            </div>


        </div>
        <hr>
    </div>
</div>


<jsp:include page="../navbar.jsp"/>
</body>

</html>