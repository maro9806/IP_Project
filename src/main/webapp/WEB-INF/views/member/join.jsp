<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${cpath}/resources/static/join.css">
</head>
<body>
<jsp:include page="../navbar.jsp" />
<div class="form-container">
    <form action="${cpath}/member/join" method="post" id="joinForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <div class="container1">
            <div class="form-group">
                <label for="id">아이디</label>
            </div>
            <div class="form-group id-group">
                <input type="text" id="id" name="username"
                       value="${param.username}"
                       placeholder="아이디 입력"
                       required
                       oninput="checkIdInput()"
                       pattern="^[a-zA-Z0-9]{4,20}$"
                       title="4~20자의 영문, 숫자만 사용 가능합니다">
                <button type="button" class="id-check-btn" id="check-btn" style="display: none;">중복확인</button>
                <span id="id-message" class="message"></span>
            </div>

            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="password"
                       placeholder="비밀번호"
                       required
                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
                       title="8자 이상의 영문, 숫자, 특수문자를 포함해야 합니다">
                <span id="pw-message" class="message"></span>
            </div>

            <div class="form-group">
                <label for="confirm-pw">비밀번호 확인</label>
                <input type="password" id="confirm-pw"
                       placeholder="비밀번호 확인"
                       required>
                <span id="confirm-pw-message" class="message"></span>
            </div>
        </div>

        <hr>

        <div class="container2">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name"
                       value="${param.name}"
                       placeholder="이름 입력"
                       required>
            </div>

            <div class="form-group">
                <label for="phone">핸드폰 번호</label>
                <input type="tel" id="phone" name="phone"
                       value="${param.phone}"
                       placeholder="01012341234"
                       required
                       pattern="^01[0-9]{8,9}$"
                       title="올바른 핸드폰 번호를 입력해주세요">
                <span id="phone-message" class="message"></span>
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email"
                       value="${param.email}"
                       placeholder="ID@email.com"
                       required>
                <span id="email-message" class="message"></span>
            </div>
        </div>

        <hr class="hr2">
        <button type="submit" class="signup-btn" disabled>회원가입</button>
    </form>
</div>

<script>
    let isIdChecked = false;

    function checkIdInput() {
        const idInput = document.getElementById("id").value;
        const checkBtn = document.getElementById("check-btn");
        const idMessage = document.getElementById("id-message");
        isIdChecked = false;

        if (idInput.length > 0) {
            checkBtn.style.display = "inline-block";
            idMessage.textContent = "중복확인이 필요합니다";
            idMessage.style.color = "red";
        } else {
            checkBtn.style.display = "none";
            idMessage.textContent = "";
        }
        updateSubmitButton();
    }

    // 비밀번호 실시간 검증
    document.getElementById('pw').addEventListener('input', function() {
        const pwMessage = document.getElementById('pw-message');
        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

        if(pwRegex.test(this.value)) {
            pwMessage.textContent = "사용 가능한 비밀번호입니다";
            pwMessage.style.color = "green";
        } else {
            pwMessage.textContent = "8자 이상의 영문, 숫자, 특수문자를 포함해야 합니다";
            pwMessage.style.color = "red";
        }
        updateSubmitButton();
    });

    // 비밀번호 확인 실시간 검증
    document.getElementById('confirm-pw').addEventListener('input', function() {
        const confirmPwMessage = document.getElementById('confirm-pw-message');
        const pwValue = document.getElementById('pw').value;

        if(this.value === pwValue) {
            confirmPwMessage.textContent = "비밀번호가 일치합니다";
            confirmPwMessage.style.color = "green";
        } else {
            confirmPwMessage.textContent = "비밀번호가 일치하지 않습니다";
            confirmPwMessage.style.color = "red";
        }
        updateSubmitButton();
    });

    // 전화번호 실시간 검증
    document.getElementById('phone').addEventListener('input', function() {
        const phoneMessage = document.getElementById('phone-message');
        const phoneRegex = /^01[0-9]{8,9}$/;

        if(phoneRegex.test(this.value)) {
            phoneMessage.textContent = "올바른 전화번호 형식입니다";
            phoneMessage.style.color = "green";
        } else {
            phoneMessage.textContent = "올바른 전화번호 형식이 아닙니다";
            phoneMessage.style.color = "red";
        }
        updateSubmitButton();
    });

    // 이메일 실시간 검증
    document.getElementById('email').addEventListener('input', function() {
        const emailMessage = document.getElementById('email-message');
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(emailRegex.test(this.value)) {
            emailMessage.textContent = "올바른 이메일 형식입니다";
            emailMessage.style.color = "green";
        } else {
            emailMessage.textContent = "올바른 이메일 형식이 아닙니다";
            emailMessage.style.color = "red";
        }
        updateSubmitButton();
    });

    // 중복확인 버튼 클릭 이벤트
    document.getElementById('check-btn').addEventListener("click", function() {
        const username = document.getElementById("id").value;
        const idMessage = document.getElementById("id-message");

        if(username.length < 4) {
            idMessage.textContent = "아이디는 4자 이상이어야 합니다";
            idMessage.style.color = "red";
            return;
        }

        fetch(`${pageContext.request.contextPath}/member/checkId?username=` + username)
            .then(response => response.json())
            .then(data => {
                if(data.available) {
                    idMessage.textContent = "사용 가능한 아이디입니다";
                    idMessage.style.color = "green";
                    isIdChecked = true;
                } else {
                    idMessage.textContent = "이미 사용중인 아이디입니다";
                    idMessage.style.color = "red";
                    isIdChecked = false;
                }
                updateSubmitButton();
            })
            .catch(error => {
                console.error('Error:', error);
                idMessage.textContent = "중복 확인 중 오류가 발생했습니다";
                idMessage.style.color = "red";
            });
    });

    // 회원가입 버튼 활성화 조건 확인
    function updateSubmitButton() {
        const submitBtn = document.querySelector(".signup-btn");
        const id = document.getElementById('id').value;
        const pw = document.getElementById('pw').value;
        const confirmPw = document.getElementById('confirm-pw').value;
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const email = document.getElementById('email').value;

        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        const phoneRegex = /^01[0-9]{8,9}$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        const isValid = isIdChecked &&
            pwRegex.test(pw) &&
            pw === confirmPw &&
            name.length > 0 &&
            phoneRegex.test(phone) &&
            emailRegex.test(email);

        submitBtn.disabled = !isValid;
    }

    // 폼 제출 전 최종 확인
    document.getElementById('joinForm').addEventListener('submit', function(e) {
        const idMessage = document.getElementById("id-message");

        if(!isIdChecked) {
            e.preventDefault();
            idMessage.textContent = "아이디 중복확인이 필요합니다";
            idMessage.style.color = "red";
            return;
        }

        const password = document.getElementById('pw').value;
        const confirmPassword = document.getElementById('confirm-pw').value;

        if(password !== confirmPassword) {
            e.preventDefault();
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
    });

    // 페이지 로드 시 초기 버튼 상태 설정
    window.addEventListener('load', updateSubmitButton);
</script>

<style>
    .message {
        font-size: 12px;
        margin-left: 5px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .signup-btn:disabled {
        background-color: #cccccc;
        cursor: not-allowed;
    }

    .signup-btn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
</style>

</body>
</html>