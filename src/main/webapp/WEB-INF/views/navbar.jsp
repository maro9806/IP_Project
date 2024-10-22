<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar bg-light">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/"><img src="<c:url value='/resources/static/img/logo.svg'/>" class="logo" alt="Logo"></a>
            <a class="nav-link" href="#">AI 면접 준비</a>
            <a class="nav-link" href="cor_board/list.jsp">기업 분석</a>
            <a class="nav-link" href="review_board/list.jsp">면접 게시판</a>
            <a class="nav-link" href="#">면접의 고수<span class="badge">pro</span></a>
        </div>
        <div class="nav-right">
            <div class="nav-right-btn">
                <a href="#"><button class="mypage-btn">마이페이지</button></a>
                <a href="#"><button class="mypage-btn2">지원현황</button></a>
                <a href="#"><img src="<c:url value='/resources/static/img/bell.svg'/>" alt="bell" class="bell"></a>
                <a href="#"><img src="<c:url value='/resources/static/img/profile.svg'/>" alt="profile" class="profile"></a>
                <a href="${pageContext.request.contextPath}/member/logout"><img src="<c:url value='/resources/static/img/logout.svg'/>" alt="logout" class="logout"></a>
            </div>
        </div>
</nav>
</body>
</html>