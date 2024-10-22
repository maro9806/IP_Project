<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/static/main.css'/>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<!-- Navbar 포함 -->
<jsp:include page="navbar.jsp" />
<!-- Navbar 이용해서 로고이미지, 메뉴 총 4개, 검색 창, 마이페이지 버튼, 프로필 이미지, 알람 아이콘, 로그인 아이디, 로그아웃 아이콘-->

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
        <div class="col-md-4">
            <!-- Login Section -->
            <div class="login-section">
                <div class="login-message">
                    <p>로그인하여 IP:PRO를 이용해보세요</p>
                    <a href="${pageContext.request.contextPath}/member/login">
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
                    <img src="<c:url value='/resources/static/img/Kakaomain.svg'/>" class="card-img-top" alt="Card 2 Image">
                    <div class="card-body">
                        <p class="card-title">카카오</p>
                        <h5 class="card-text">광고 SDK 개발 </h5>
                        <h5 class="card-text">FE개발자 (경력)</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/Netmarblemain.svg'/>" class="card-img-top" alt="Card 3 Image">
                    <div class="card-body">
                        <p class="card-title">넷마블</p>
                        <h5 class="card-text">나 혼자만 레벨업</h5>
                        <h5 class="card-text">UI 디자인</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 4 Image">
                    <div class="card-body">
                        <p class="card-title">Card 4</p>
                        <h5 class="card-text">corp name</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 5 Image">
                    <div class="card-body">
                        <p class="card-title">Card 5</p>
                        <h5 class="card-text">corp name</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 6 Image">
                    <div class="card-body">
                        <p class="card-title">Card 6</p>
                        <h5 class="card-text">corp name</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 7 Image">
                    <div class="card-body">
                        <p class="card-title">Card 7</p>
                        <h5 class="card-text">corp name</h5>
                        <p class="card-date">2024-11-11(월)23:59</p>
                    </div>
                </div>
                <div class="card corp-card">
                    <img src="<c:url value='/resources/static/img/240card.svg'/>" class="card-img-top" alt="Card 8 Image">
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

<div class="container3">
    <div class="div">
        <div class="overlap-group">
            <div class="rectangle">
                <img src="<c:url value='/resources/static/img/400_260card.svg'/>" alt="400_260card">
            </div>
            <div class="rectangle-2">
                <img src="<c:url value='/resources/static/img/400_260card.svg'/>" alt="645x260card">
            </div>
            <div class="group">
                <div class="frame">
                    <p class="text-wrapper">Question 1. 우리 회사가 개선해야 할 것과 나아가야 할 방향은 무엇인가요?</p>
                </div>
            </div>
            <div class="frame-wrapper">
                <div class="div-wrapper">
                    <p class="p">Q. 자신이 가장 잘하는 것 자신이 성장하거나 일하는데 가장 도움이 되었던 것은?</p>
                </div>
            </div>
        </div>
        <div class="AI-wrapper">
            <p class="AI">기업과 나를 잇는 면접 코칭 AI<br />면접 질문 준비부터 실전 면접 연습까지</p>
        </div>
        <div class="text-wrapper-2">맞춤형 AI 면접 코칭</div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const scrollContainer = document.querySelector('.scroll-container');

    scrollContainer.addEventListener('wheel', (evt) => {
        evt.preventDefault();
        const scrollSpeed = 20;
        scrollContainer.scrollLeft += evt.deltaY * scrollSpeed;
    });

    // jQuery 코드 수정
    $("a:not([href^='/member/'])").on("click", function(e){
        e.preventDefault();
        let idx = $(this).attr("href");

        $.ajax({
            url : "${pageContext.request.contextPath}/get",
            type : "get",
            data : {"idx" : idx},
            dataType : "json",
            success : function(response) {
                // 성공 처리 로직
                console.log(response);
            },
            error : function() {
                alert("error");
            }
        });
    });
</script>
</body>

</html>