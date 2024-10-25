<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/static/main.css'/>">

</head>

<body>
<!-- Navbar 포함 -->
<jsp:include page="navbar.jsp"/>
<!-- Navbar 이용해서 로고이미지, 메뉴 총 4개, 검색 창, 마이페이지 버튼, 프로필 이미지, 알람 아이콘, 로그인 아이디, 로그아웃 아이콘-->

    <div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <!-- Carousel -->
                    <div id="adCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <!-- 슬라이드 이미지 -->
                            <div class="carousel-item active">
                                <img src="<c:url value='/resources/static/img/Skict2025.svg'/>" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="<c:url value='/resources/static/img/ITsemi.svg'/>" class="d-block w-100" alt="...">
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
                <div class="col-md-3">
                    <!-- Login Section -->
                    <div class="login-section">
                        <div class="login-message">
                            <p>로그인하여 IP:PRO를 이용해보세요</p>
                            <a href="/login">
                                <button class="login-btn">IP:PRO 로그인</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container2">
            <div class="row" style="margin-top: 110px;">
                <div class="col-12">
                    <h4 style="font-weight: bold;">로그인 하고 AI 맟춤 면접 추천받기</h4>
                </div>
                <div class="scroll-container">
                    <div class="scroll-content">
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/Nexonmain.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">넥슨</p>
                                <h5 class="card-text">[넥토리얼]</h5>
                                <h5 class="card-text">게임프로그래밍</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/Kakaomain.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">카카오</p>
                                <h5 class="card-text">광고 SDK 개발 </h5>
                                <h5 class="card-text">FE개발자 (경력)</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/Netmarblemain.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">넷마블</p>
                                <h5 class="card-text">나 혼자만 레벨업</h5>
                                <h5 class="card-text">UI 디자인</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">Card 4</p>
                                <h5 class="card-text">corp name</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">Card 5</p>
                                <h5 class="card-text">corp name</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">Card 6</p>
                                <h5 class="card-text">corp name</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">Card 7</p>
                                <h5 class="card-text">corp name</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                        <div class="card corp-card">
                            <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 1 Image">
                            <div class="card-body">
                                <p class="card-title">Card 8</p>
                                <h5 class="card-text">corp name</h5>
                                <p class="card-date">2024-11-11(월)23:59</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sub-content">
        <div class="container3">
            <div class="col-12">
                <p>기업과 나를 잇는 면접 코칭 AI </p>
                <p> 면접 질문 준비부터 실전 면접 연습까지</p>
            </div>
        </div>
        <div class="container4">
            <img src="<c:url value='/resources/static/img/mainintroimg3.svg'/>" class="left-img" alt="AI Interview Image">
        </div>

        <!-- Container 5 -->
        <div class="container5">
            <!-- Title Section -->
            <div class="title-section">
                <h2 class="main-title">최고의 면접을 위한</h2>
                <h2 class="main-title">가장 똑똑한 방법, IP:PRO</h2>
                <div class="underline"></div>
            </div>

            <!-- Feature Grid -->
            <div class="feature-grid">
                <!-- Feature Item 1 -->
                <div class="feature-item">
                    <h3>완벽한 면접을 위해</h3>
                    <p>바로바로 체크해서 피드백</p>
                </div>

                <!-- Feature Item 2 -->
                <div class="feature-item">
                    <h3>형식적인 평가 시스템이 아닌,</h3>
                    <p>구직자의 성장을 위해</p>
                </div>

                <!-- Feature Item 3 -->
                <div class="feature-item">
                    <h3>실제 면접 후기와</h3>
                    <p>기업 완벽분석을 통해 만든 데이터</p>
                </div>
            </div>

            <!-- Gray Box Placeholders -->
            <div class="placeholder-grid">
                <div class="placeholder-box"></div>
                <div class="placeholder-box"></div>
                <div class="placeholder-box"></div>
            </div>
        </div>

    </div>


    <script>
        const scrollContainer = document.querySelector('.scroll-container');
        scrollContainer.addEventListener('wheel', (evt) => {
            evt.preventDefault();
            // Adjust the scrolling speed by increasing the scrollLeft increment
            const scrollSpeed = 40; // Increase this value for faster scrolling
            scrollContainer.scrollLeft += evt.deltaY * scrollSpeed;
        });
    </script>

<jsp:include page="footer.jsp"/>
</body>

</html>