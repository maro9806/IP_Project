<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/static/main.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/globalfont.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
    <link rel="stylesheet" href="/resources/static/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<!-- Navbar 포함 -->
<jsp:include page="navbar.jsp" />
<!-- Navbar 이용해서 로고이미지, 메뉴 총 4개, 검색 창, 마이페이지 버튼, 프로필 이미지, 알람 아이콘, 로그인 아이디, 로그아웃 아이콘-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <!-- Carousel -->
            <div id="adCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- 슬라이드 이미지 -->
                    <div class="carousel-item active">
                        <img src="<c:url value='/resources/static/img/cat.svg'/>" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="<c:url value='/resources/static/img/cat.svg'/>" class="d-block w-100" alt="...">
                    </div>
                </div>
                <!-- 이미지 수동 이동 버튼  -->
                <button class="carousel-control-prev" type="button" data-bs-target="#adCarousel"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#adCarousel"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="col-md-4">
            <!-- Login Section -->
            <div class="login-section">
                <div class="login-message">
                    <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal}">
                            <p>Welcome, ${pageContext.request.userPrincipal.name}!</p>
                            <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-warning">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/member/login" class="login-btn">Login</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container2">
    <div class="row" style="margin-top: 110px;">
        <div class="col-12">
            <h2>면접 공고</h2>
        </div>
        <div class="scroll-container">
            <div class="scroll-content">
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 1</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 2</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 3</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 4</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 5</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 6</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 7</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card Image">

                    <div class="card-body">
                        <h5 class="card-title">Card 8</h5>
                        <p class="card-text">corp name</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Image Container -->
<div class="img-wrapper">
    <img src="https://c.animaapp.com/lMGyGZqo/img/vector-5-1.svg" class="img-content" alt="Vector image">
</div>


<script>
    const scrollContainer = document.querySelector('.scroll-container');

    scrollContainer.addEventListener('wheel', (evt) => {
        evt.preventDefault();
        const scrollSpeed = 40;
        scrollContainer.scrollLeft += evt.deltaY * scrollSpeed;
    });

    $("a:not([href^='/member/'])").on("click", function(e){
        e.preventDefault();
        let idx = $(this).attr("href");

        $.ajax({
            url : "${cpath}/get",
            type : "get",
            data : {"idx" : idx},
            dataType : "json",
            success : makeView,
            error : function() { alert("error"); }
        });
    });
</script>

</body>

</html>