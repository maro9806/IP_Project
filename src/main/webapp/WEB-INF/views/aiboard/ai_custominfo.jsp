<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>1stage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/stage.css">
</head>
<body>
<jsp:include page="../navbar.jsp" />

<div class="content">
    <div class="banner">
        <h3 class="title">AI 면접 코칭</h3>
        <p class="p-title">나의 자기소개서를 기반으로 지원 기업 맞춤 면접 준비를 도와줘요</p>
    </div>
    <h4 class="h-title">1. 정보 선택하기</h4>
    <h5>자기소개서 작성 > 기업 및 직무 선택</h5>
    <hr width="80%">

    <section class="container">
        <div id="card" class="card">
            <div id="card-body1" class="card-body">
                <form action="${pageContext.request.contextPath}/ai_board/ai_custominfo" method="post">
                    <h5 class="fw-bold">자기소개서</h5>
                    <p>자기소개서나 이력서에서 질문을 추출해줘요.</p>
                    <br>
                    <select class="form-control fw-bold">
                        <option value="">자기소개서 불러오기</option>
                        <option value="1">2024.10.22. 넥슨 자기소개서</option>
                        <option value="2">2024.09.10. 네이버 자기소개서</option>
                    </select>
                    <br>
                    <button id="openModalBtn" class="form-control text-start fw-bold" type="button">
                        자기소개서 작성하기
                    </button>
                </form>
            </div>
            <div id="card-body2" class="card-body">
                <h5 class="fw-bold">기업</h5>
                <p>기업이나 직무에 맞는 면접 질문을 추출해줘요.</p>
                <br>
                <select class="form-control fw-bold">
                    <option value="">기업 선택하기</option>
                    <option value="naver">네이버</option>
                    <option value="nexon">넥슨</option>
                    <option value="daangn">당근마켓</option>
                    <option value="line">라인플러스</option>
                </select>
                <br>
                <select class="form-control fw-bold">
                    <option value="">직무 선택하기</option>
                    <option value="dev">개발직군</option>
                    <option value="design">디자인직군</option>
                    <option value="marketing">마케팅직군</option>
                    <option value="planning">기획직군</option>
                </select>
            </div>
        </div>
    </section>

    <div class="d-flex flex-column align-items-end pe-5">
        <button type="submit" id="next" class="btn btn-primary">→ NEXT</button>
        <br>
        <div class="progress w-90 mb-5">
            <div id="bar1" class="progress-bar bar" style="width:20%">1 Stage</div>
            <div id="bar2" class="progress-bar bar" style="width:0%">2 Stage</div>
            <div id="bar3" class="progress-bar bar" style="width:0%">3 Stage</div>
            <div id="bar4" class="progress-bar bar" style="width:0%">4 Stage</div>
            <div id="bar5" class="progress-bar bar" style="width:0%">5 Stage</div>
        </div>
    </div>
</div>

<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p>자기소개서 문항</p>
        <textarea class="form-control" rows="1" placeholder="자기소개서 문항을 작성하세요."></textarea>
        <p>자기소개서 내용</p>
        <textarea class="form-control" rows="4" placeholder="여기에 자기소개서를 작성하세요."></textarea>
        <button class="btn btn-primary mt-3">제출하기</button>
    </div>
</div>

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

<script>
    var modal = document.getElementById("myModal");
    var openModalBtn = document.getElementById("openModalBtn");
    var closeBtn = document.getElementsByClassName("close")[0];

    openModalBtn.onclick = function() {
        modal.style.display = "block";
    }

    closeBtn.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>