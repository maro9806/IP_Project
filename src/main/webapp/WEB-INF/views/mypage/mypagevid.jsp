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
	<link rel="stylesheet" href="<c:url value='/resources/static/mypage/mypagevid.css'/>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<!-- Video Toggle Button -->
<button class="video-toggle" aria-label="Toggle Video Section">
	<i class="fas fa-video"></i>
</button>


<<div class="video-section">

	<h4 class="section-title">면접 영상</h4>
	<button class="video-close" aria-label="Close Video Section">
		<i class="fas fa-times"></i>
	</button>
	<div class="video-preview">
		<div class="video-box">
			<video id="interviewVideo" controls>
				<source src="" type="video/mp4">

			</video>
		</div>
	</div>
</div>

<div class="main-content">
	<div class="row">
		<div class="col-2">
			<jsp:include page="mypagebar.jsp"/>
		</div>
		<div class="col-10">
			<div class="mypcontent">
				<h2 class="page-header">면접 영상 내역</h2>
				<div class="row">
					<!-- Questions Section -->
					<div class="col-6">
						<div class="video-questions">
							<h4 class="section-title">면접 질문</h4>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q1.</span>CSS적용도
								</button>
							</div>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q2.</span>제대로
								</button>
							</div>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q3.</span>안하고
								</button>
							</div>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q4.</span>30분 끙끙대서
								</button>
							</div>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q5.</span>만든게
								</button>
							</div>
							<div class="question-item">
								<button class="question-button">
									<span class="question-number">Q6.</span>진짜 멍청했네..
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Answer Section -->
				<div class="answer-box-info">
					<h4 class="section-title">사용자 답변</h4>
					<div class="answer-box" data-question="1">
						<p>CSS 관련 답변입니다...</p>
					</div>
					<div class="answer-box" data-question="2">
						<p>제대로 관련 답변입니다...</p>
					</div>
					<div class="answer-box" data-question="3">
						<p>안하고 관련 답변입니다...</p>
					</div>
					<div class="answer-box" data-question="4">
						<p>30분 공장대서 관련 답변입니다...</p>
					</div>
					<div class="answer-box" data-question="5">
						<p>만든게 관련 답변입니다...</p>
					</div>
					<div class="answer-box" data-question="6">
						<p>진짜 멍청했네 관련 답변입니다...</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const answerBoxes = document.querySelectorAll('.answer-box');
        const questionButtons = document.querySelectorAll('.question-button');
        const videoToggle = document.querySelector('.video-toggle');
        const videoSection = document.querySelector('.video-section');
        const mainContent = document.querySelector('.main-content');
        const toggleIcon = videoToggle.querySelector('i');
        const videoClose = document.querySelector('.video-close');

        const dummyAnswers = {
            '1': '첫 번째 질문에 대한 더미 답변입니다.',
            '2': '두 번째 질문의 답변이에요.',
            '3': '세 번째 답변입니다.',
            '4': '네 번째 질문의 더미 답변이에요.',
            '5': '다섯 번째 답변입니다.',
            '6': '여섯 번째 더미 답변이에요.'
        };

        // Show first answer by default
        if (answerBoxes.length > 0) {
            answerBoxes[0].classList.add('active');
            questionButtons[0].classList.add('active');
        }

        // 비디오 섹션 열기
        videoToggle.addEventListener('click', function() {
            videoSection.classList.add('active');
            mainContent.classList.add('video-active');
            videoToggle.style.display = 'none';
        });

        // 비디오 섹션 닫기
        videoClose.addEventListener('click', function() {
            videoSection.classList.remove('active');
            mainContent.classList.remove('video-active');
            videoToggle.style.display = 'flex';  // 토글 버튼 다시 표시
        });

        // Question button click handlers
        questionButtons.forEach(button => {
            button.addEventListener('click', function () {
                // Remove active class from all buttons
                questionButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Get question number
                const questionNumber = this.querySelector('.question-number').textContent
                    .replace('Q', '').replace('.', '');

                // Update answer text
                const answerText = dummyAnswers[questionNumber];
                const answerBox = document.querySelector('.answer-box-info');
                answerBox.innerHTML =
                    '<h4 class="section-title">'
                    + '사용자 답변'
                    + '</h4>'
                    + '<div class="answer-box active">'
                    + '<p>' + answerText + '</p>'
                    + '</div>'
                ;


            });
        });
    });
</script>
</body>
</html>