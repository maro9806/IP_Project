<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../header.jsp" %>
    <title>My Page</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/mypagevid.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div class="main-content">
    <div class="row">
        <div class="col-2">
            <jsp:include page="mypagebar.jsp"/>
        </div>
        <div class="col-10">
            <div class="mypcontent">
                <h2 class="page-header">
                    면접 영상 내역
                </h2>
                <div class="row">
                    <!-- Video Section -->
                    <div class="col-6">
                        <div class="video-preview">
                            <div class="video-box">
                                <img src="/api/placeholder/700/380" alt="Video preview">
                            </div>
                        </div>
                    </div>

                    <!-- Questions Section -->
                    <div class="col-6">
                        <div class="video-questions">
                            <h4 class="section-title">면접 질문</h4>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q1.</span>CSS적용도
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q2.</span>제대로
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q3.</span>안하고
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q4.</span>30분 끙끙대서
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q5.</span>만든게
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="question-button">
                                    <span class="question-number">Q6.</span>진짜 멍청했네..
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Company Information and Answer Section -->
                <div class="answer-box-info">
                    <h4 class="section-title">사용자 답변</h4>
                    <div class="answer-box">
                        <p>솔직히 이것만 있어도 될지도?</p>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>