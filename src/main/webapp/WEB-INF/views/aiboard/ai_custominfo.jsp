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

    <div class="banner mb-5">
        <h3 class="title">AI 면접 코칭</h3>
        <p class="p-title">나의 자기소개서를 기반으로 지원 기업 맞춤 면접 준비를 도와줘요</p>
    </div>

    <h4 class="h-title">1. 면접 정보 입력하기</h4>
    <h5>자기소개서 작성 > 기업 및 직무 선택</h5>
    <hr style="width:100%;">

    <div id="questions-container" style="width:100%; padding:0 15%;">
        <div class="question-block">
            <table style="width:100%;">
                <colgroup>
                    <col style="width: 30%;">
                    <col style="width: 70%;">
                </colgroup>
                <tr>
                    <td><b><label for="company-name">기업명</label></b>
                        <select id="company-name" class="form-control" name="company-name" style="width:250px;">
                            <option value="" disabled selected hidden></option>
                            <option value="naver">네이버</option>
                            <option value="nexon">넥슨</option>
                            <option value="daangn">당근마켓</option>
                            <option value="line">라인플러스</option>
                        </select>
                    </td>
                    <td>
                        <b><label for="job-position">지원 직무 </label></b>
                        <select id="job-position" class="form-control" name="job-position" style="width:250px;">
                            <option value="" disabled selected hidden></option>
                            <option value="dev">개발직군</option>
                            <option value="design">디자인직군</option>
                            <option value="marketing">마케팅직군</option>
                            <option value="planning">기획직군</option>
                        </select>
                    </td>
                </tr>
                <tr style="border-top:1px solid gray;">
                    <td><strong>자기소개서 작성하기</strong></td>
                    <td colspan="2" style="text-align: right;">
                        <button id="load-button" class="btn btn-dark">자기소개서 불러오기</button>
                        <button id="add-question-button" class="btn btn-dark">+</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="first-question-row">
                        <input type="text" id="question-1" class="form-control" name="question[]" placeholder="문항1. 자기소개서 문항을 작성하세요." />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea id="coverLetter" class="form-control" rows="8" maxlength="1000" placeholder="여기에 자기소개서를 작성하세요." name="answer[]"></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align:right">
                        <div id="charCount">0자/1000자 (공백포함)</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <button onclick="location.href='<%= request.getContextPath() %>/aiboard/ai_question'" type="submit" id="next" class="btn btn-primary">→ NEXT</button>

</div>

<script>
    const questionsContainer = document.getElementById("questions-container");
    const addQuestionButton = document.getElementById("add-question-button");
    let questionCount = 1;

    addQuestionButton.addEventListener("click", function() {
        questionCount++;

        const questionRow = document.createElement("tr");
        questionRow.innerHTML = `
            <td colspan="2">
                <input type="text" id="question-${questionCount}" class="form-control" name="question[]" placeholder="문항${questionCount}. 자기소개서 문항을 작성하세요." />
                <button class="btn btn-danger btn-sm remove-question" style="margin-left: 10px;">-</button>
            </td>
        `;
        questionsContainer.querySelector("table").appendChild(questionRow);

        const answerRow = document.createElement("tr");
        answerRow.innerHTML = `
            <td colspan="2">
                <textarea id="coverLetter${questionCount}" class="form-control" rows="8" maxlength="1000" placeholder="여기에 자기소개서를 작성하세요." name="answer[]"></textarea>
            </td>
        `;
        questionsContainer.querySelector("table").appendChild(answerRow);

        // 글자 수 카운트 업데이트
        const charCount = document.createElement("div");
        charCount.id = "charCount" + questionCount;
        charCount.textContent = '0자/1000자 (공백포함)';
        answerRow.appendChild(charCount);

        // 글자 수 표시하는 이벤트 리스너 추가
        const coverLetterTextarea = document.getElementById(`coverLetter${questionCount}`);
        coverLetterTextarea.addEventListener("input", function() {
            const currentLength = coverLetterTextarea.value ? coverLetterTextarea.value.length : 0;
            const maxLength = coverLetterTextarea.getAttribute("maxlength") || 1000;
            charCount.textContent = currentLength + '자/' + maxLength +'자';
        });

        // 삭제 버튼 기능 추가
        const removeButton = questionRow.querySelector(".remove-question");
        removeButton.addEventListener("click", function() {
            questionRow.remove();
            answerRow.remove();
        });
    });

    // textarea와 글자 수 표시하는 div 요소
    const coverLetter = document.getElementById("coverLetter");
    const charCount = document.getElementById("charCount");

    // textarea의 입력 이벤트를 감지하여 글자 수 계산
    coverLetter.addEventListener("input", function() {
        const currentLength = coverLetter.value ? coverLetter.value.length : 0; // 현재 입력된 글자 수 (null 체크)
        const maxLength = coverLetter.getAttribute("maxlength") || 1000; // 최대 글자 수 가져오기 (기본값 1000)
        charCount.textContent = currentLength + '자/' + maxLength +'자';
    });
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>