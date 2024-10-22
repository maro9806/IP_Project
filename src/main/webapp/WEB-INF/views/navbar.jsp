<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <div class="nav-left">
            <a href="./main.jsp"><img src="<c:url value='/resources/static/img/logo.svg'/>" class="logo" alt="Logo"></a>
            <a class="nav-link" href="#">AI 면접 준비</a>
            <a class="nav-link" href="cor_board/list.jsp">기업 분석</a>
            <a class="nav-link" href="review_board/list.jsp">면접 게시판</a>
            <a class="nav-link" href="#">면접의 고수</a>
        </div>
        <div class="nav-right">
            <div class="nav-right-btn">
                <img src="<c:url value='/resources/static/img/my.svg'/>" class="my" alt="my">
                <img src="<c:url value='/resources/static/img/my.svg'/>" class="my2" alt="my2">
            </div>
            <img src="<c:url value='/resources/static/img/bell.svg'/>" class="bell" alt="bell">
            <img src="<c:url value='/resources/static/img/profile.svg'/>" class="profile" alt="profile">
            <a href="member/logout"><img src="<c:url value='/resources/static/img/logout.svg'/>" class="logout" alt="logout"></a>
        </div>
    </div>
</nav>