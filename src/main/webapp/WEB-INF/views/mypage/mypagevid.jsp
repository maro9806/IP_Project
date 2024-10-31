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
    <link rel="stylesheet" href="<c:url value='/resources/static/mypagebar.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/myprofile.css'/>">
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
                <h2>영상 면접 내역</h2>
                <div class="row">
                    <!-- Video Section -->
                    <div class="col-md-6">
                        <div class="video-preview">
                            <div class="video-box">
                                <img src="https://via.placeholder.com/700x380" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <!-- Questions Section -->
                    <div class="col-md-6">
                        <div class="video-AIQuestions">
                            <h4>영상 면접 질문</h4>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q1.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q2.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q3.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q4.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q5.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                            <div class="question-item">
                                <button class="btn btn-light">
                                    <strong>Q6.</strong> 인생에서 중요하게 여기는 것과 가치관에 대해 말씀해주세요.
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Company Information and My Answer Section -->
                <div class="company-info mt-5">
                    <h4>기업정보</h4>
                    <div class="info-box">
                        <!-- Placeholder for company information -->
                        <p>여기에 기업 정보가 표시됩니다...</p>
                    </div>

                    <h4>나의 답변</h4>
                    <div class="answer-box">
                        <!-- Placeholder for answer -->
                        <p>여기에 나의 답변이 표시됩니다...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
