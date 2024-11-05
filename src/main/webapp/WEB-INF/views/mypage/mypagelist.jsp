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

    <link rel="stylesheet" href="<c:url value='/resources/static/mypagelist.css'/>">
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
<jsp:include page="../navbar.jsp"/>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar - col-2 -->
        <div class="col-md-2">
            <jsp:include page="mypagebar.jsp"/>
        </div>

        <!-- Main Content - col-10 -->
        <div class="col-md-10">
            <div class="Content-Section">
                <!-- Header -->
                <div class="page-header-container">
                    <h2 class="page-header">
                        자기소개서 상세보기
                        <span class="page-count">(1/3)</span>
                    </h2>
                    <a href="#" class="video-btn">
                        <i data-lucide="video" class="icon"></i>
                        화상면접 보기
                    </a>
                </div>

                <div class="card">
                    <div class="card-body">
                        <!-- Info Section -->
                        <div class="info-section">
                            <div class="info-item">
                                <span class="info-label">직무</span>
                                <span class="info-value">Back-End Developer</span>
                            </div>
                            <div class="info-divider"></div>
                            <div class="info-item">
                                <span class="info-label">기업</span>
                                <span class="info-value">네이버</span>
                            </div>
                        </div>

                        <!-- Content -->
                        <div class="content-box" >
                            자기소개서 저장본이 여기 작성 될 예정
                            공백
                            공백
                            공백
                            공백
                            공백
                            공백
                            공백
                            공백
                            공백
                            공백
                        </div>

                        <!-- Meta Information -->
                        <div class="meta-info">
                            <span class="date">작성일: 2024.10.15</span>
                        </div>
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="navigation-buttons">
                    <button class="nav-btn prev-btn">
                        <i data-lucide="chevron-left" class="icon"></i>
                        이전
                    </button>
                    <div class="action-buttons">
                        <button class="action-btn edit-btn">
                            <i data-lucide="edit-2" class="icon"></i>
                            수정하기
                        </button>
                        <button class="action-btn save-btn">
                            <i data-lucide="save" class="icon"></i>
                            저장하기
                        </button>
                    </div>
                    <button class="nav-btn next-btn">
                        다음
                        <i data-lucide="chevron-right" class="icon"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Initialize Lucide icons
    lucide.createIcons();
</script>
</body>
</html>