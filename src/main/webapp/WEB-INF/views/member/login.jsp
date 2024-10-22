<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/static/login.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
<jsp:include page="../navbar.jsp" />
<!-- Login Form -->
<div class="login-container">
    <div class="login-box">
        <img src="<c:url value='/resources/static/img/logo.svg'/>" alt="Logo" class="logo" width="50">
        <span class="login-title">AI 면접의 첫 걸음</span>

        <form action="${pageContext.request.contextPath}/member/login-process" method="POST">
            <input type="text" class="form-control" name="username" placeholder="ID" required>
            <input type="password" class="form-control" name="password" placeholder="PW" required>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="remember">
                <label class="form-check-label" for="remember">아이디 기억하기</label>
            </div>
            <p></p>
            <button type="submit" class="btn btn-dark login-btn">Login</button>
        </form>
        <div class="social-login">
            <a href="${pageContext.request.contextPath}/oauth2/authorization/google" class="btn btn-google btn-block">
                <i class="fab fa-google"></i> Login with Google
            </a>
            <a href="${pageContext.request.contextPath}/oauth2/authorization/kakao" class="btn btn-kakao btn-block">
                <i class="fab fa-kickstarter-k"></i> Login with Kakao
            </a>
        </div>

        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/member/findid">아이디 찾기 |</a>
            <a href="${pageContext.request.contextPath}/idpw">비밀번호 찾기 |</a>
            <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
        </div>
    </div>
</div>

<!-- idpw container -->
<div id="idpw-container" class="idpw-container hidden">
    <div id="id-section" class="idpw-section hidden">
        <span class="login-title">아이디 찾기</span>
        <form action="${pageContext.request.contextPath}/member/id_recovery" method="POST">
            <input type="text" class="form-control" name="email" placeholder="이메일을 입력하세요" required>
            <button type="submit" class="btn btn-dark login-btn">아이디 찾기</button>
        </form>
    </div>

    <div id="pw-section" class="idpw-section hidden">
        <span class="login-title">비밀번호 찾기</span>
        <form action="${pageContext.request.contextPath}/member/pw_recovery" method="POST">
            <input type="text" class="form-control" name="username" placeholder="아이디를 입력하세요" required>
            <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요" required>
            <button type="submit" class="btn btn-dark login-btn">비밀번호 찾기</button>
        </form>
    </div>

    <button id="close-btn" class="btn close-btn">닫기</button>
</div>

<script>
    // Get the elements
    const loginContainer = document.querySelector('.login-container'); // Login container
    const idpwContainer = document.getElementById('idpw-container'); // ID/PW container
    const closeButton = document.getElementById('close-btn'); // Close button

    const idSection = document.getElementById('id-section'); // ID recovery section
    const pwSection = document.getElementById('pw-section'); // PW recovery section
    const idLink = document.querySelector('.footer-links a:first-child');
    const pwLink = document.querySelector('.footer-links a:nth-child(2)');

    idLink.addEventListener('click', function (event) {
        event.preventDefault();
        idpwContainer.classList.remove('hidden');
        idSection.classList.remove('hidden');
        pwSection.classList.add('hidden');
        loginContainer.classList.add('hidden');
    });

    pwLink.addEventListener('click', function (event) {
        event.preventDefault();
        idpwContainer.classList.remove('hidden');
        pwSection.classList.remove('hidden');
        idSection.classList.add('hidden');
        loginContainer.classList.add('hidden');
    });


    closeButton.addEventListener('click', function () {
        idpwContainer.classList.add('hidden');
        loginContainer.classList.remove('hidden');
        idSection.classList.add('hidden');
        pwSection.classList.add('hidden');
    });

    fetch('navbar.jsp')
        .then(response => response.text())
        .then(data => {
            document.getElementById('navbar-placeholder').innerHTML = data;
        });
</script>
</body>
</html>