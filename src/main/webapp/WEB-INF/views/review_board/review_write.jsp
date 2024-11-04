<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
    <%@ include file="../header.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/static/interviewwrite.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<!-- Main Content -->
<div class="main-content">
    <div class="editor-wrapper">
        <div class="editor-header">
            <div class="metadata-grid">
                <div class="input-group">
                    <label class="input-label">시기</label>
                    <select class="input-field">
                        <option>2024년 상반기</option>
                        <option>2024년 하반기</option>
                        <option>2023년 상반기</option>
                        <option>2023년 하반기</option>
                    </select>
                </div>

                <div class="input-group">
                    <label class="input-label">직무</label>
                    <input type="text" class="input-field" placeholder="직무명을 입력하세요">
                </div>

                <div class="input-group">
                    <label class="input-label">회사명</label>
                    <input type="text" class="input-field" placeholder="회사명을 입력하세요">
                </div>

                <div class="input-group">
                    <label class="input-label">경력구분</label>
                    <select class="input-field">
                        <option>신입</option>
                        <option>경력</option>
                        <option>인턴</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="content-section">
            <div id="questions-container">
                <div class="question-section">
                    <div class="question">
                            <span class="question-number">1
                            </span>
                        <input type="text" class="question-input-field" placeholder="ex) 면접은 어디에서, 몇 시에 보셨습니까?">
                    </div>
                    <textarea class="answer" placeholder="답변을 입력하세요..."></textarea>
                </div>
            </div>

            <div class="add-question-wrapper">
                <button class="add-btn">+</button>
            </div>

            <div class="buttons-wrapper">
                <button class="cancel-btn">취소</button>
                <button class="submit-btn">작성하기</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        //elements
        const form = document.querySelector('.editor-wrapper');
        const addBtn = document.querySelector('.add-btn');
        const submitBtn = document.querySelector('.submit-btn');
        const cancelBtn = document.querySelector('.cancel-btn');
        const questionsContainer = document.getElementById('questions-container');

        // 질문 갯수
        let questionCounter = 1;

        // 새 질문 추가 기능
        function createQuestionSection(number) {
            const section = document.createElement('div');
            section.className = 'question-section';
            section.innerHTML = `
            <div class="question">
                <span class="question-number">${number}.</span>
                <input type="text" class="question-input-field" placeholder=" ">
            </div>
            <textarea class="answer" placeholder=" "></textarea>
        `;
            return section;
        }

        // 추가 버튼
        addBtn.addEventListener('click', () => {
            questionCounter++;
            const newSection = createQuestionSection(questionCounter);
            questionsContainer.appendChild(newSection);

            // 스크롤링
            newSection.scrollIntoView({behavior: 'smooth', block: 'center'});
        });

        // 작성 시 답변 질문  handler
        submitBtn.addEventListener('click', async () => {
            const formData = {
                period: document.querySelector('select:nth-child(1)').value,
                position: document.querySelector('.input-field[placeholder="직무명을 입력하세요"]').value,
                company: document.querySelector('.input-field[placeholder="회사명을 입력하세요"]').value,
                level: document.querySelector('select:nth-child(2)').value,
                questions: Array.from(document.querySelectorAll('.question-section')).map(section => ({
                    question: section.querySelector('.question-input-field').value,
                    answer: section.querySelector('.answer').value
                }))
            };

            // Validate form
            if (!formData.position.trim() || !formData.company.trim()) {
                alert('직무명과 회사명을 입력해주세요.');
                return;
            }

            if (!formData.questions.some(q => q.question.trim() && q.answer.trim())) {
                alert('최소 하나의 질문과 답변을 입력해주세요.');
                return;
            }
        });
    });
</script>
</html>
