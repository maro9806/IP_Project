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

    <div id="AIQuestions-container" style="width:95%; padding-left:5%;">
        <div class="question-block">
            <table style="width:100%;">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 40%;">
                    <col style="width: 30%;">

                </colgroup>
                <tr>
                    <td><strong>지원 기업 선택하기</strong></td>
                </tr>
                <tr>
                    <td> <%--<b><label for="company-name">기업명</label></b>--%>
                        <select id="company-name" class="form-control" name="company-name" style="width:250px;">
                            <option value="">기업명 선택하기</option>
                            <option value="naver">네이버</option>
                            <option value="nexon">넥슨</option>
                            <option value="daangn">당근마켓</option>
                            <option value="line">라인플러스</option>
                        </select>
                    </td>
                    <td>
                        <b><%--<label for="job-position">지원 직무 </label></b>--%>
                        <select id="job-position" class="form-control" name="job-position" style="width:250px;">
                            <option value="">직무 선택하기</option>
                            <option value="dev">개발직군</option>
                            <option value="design">디자인직군</option>
                            <option value="marketing">마케팅직군</option>
                            <option value="planning">기획직군</option>
                        </select>
                    </td>
                    <td style="text-align: right;">
                        <button id="load-button" class="btn btn-dark">자기소개서 불러오기</button>
                    </td>
                </tr>
                <tr style="border-top:1px solid gray;">
                    <td><strong>자기소개서 입력하기</strong></td>
                    <td colspan="2" style="text-align: right;">
                        <button id="add-question-button" style="background-color:white">+</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="first-question-row">
                        <input type="text" id="question-1" class="form-control" name="question[]" placeholder="문항1. 자기소개서 문항을 작성하세요." />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <textarea id="coverLetter" class="form-control" rows="7" maxlength="1000" placeholder="여기에 자기소개서를 작성하세요." name="answer[]"></textarea>
                    </td>
                </tr>
                <tr>
                    <td><button class="btn btn-dark">저장하기</button></td>
                    <td colspan="2" style="text-align:right">
                        <div id="charCount">0자/1000자 (공백포함)</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!-- 면접질문 생성하기 버튼 컨테이너 수정 -->
    <div style="width:90%; margin: 20px auto;">
        <div style="display: flex; justify-content: flex-end;">
            <button onclick="location.href='<%= request.getContextPath() %>/aiboard/ai_question'"
                    type="submit" id="next"
                    class="btn btn-primary">
                면접질문 생성하기
            </button>
        </div>
    </div>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const container = document.getElementById('AIQuestions-container');
        const addButton = document.getElementById('add-question-button');
        let questionCounter = 1;

        addButton.addEventListener('click', function() {
            questionCounter++;

            // 새로운 div 생성
            const newQuestionBlock = document.createElement('div');
            newQuestionBlock.className = 'question-block';

            // 새로운 테이블 생성
            const newTable = document.createElement('table');
            newTable.style.width = '100%';

            // 테이블 내용 생성
            newTable.innerHTML =
                '<tr style="border-top:1px solid gray;">' +
                '<td style="width: 30%;"></td>' +
                '<td colspan="2" style="text-align: right;">' +
                '<button class="remove-button mr-3" style="background-color: white; margin-right: 5px;width: 25px;">-</button>' +
                '<button class="add-question-button" style="background-color: white; margin-right: 5px;width: 25px;">+</button>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="3">' +
                '<input type="text" class="form-control" name="question[]" ' +
                'placeholder="문항' + questionCounter + '. 자기소개서 문항을 작성하세요." />' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="3">' +
                '<textarea class="form-control coverLetter" rows="7" maxlength="1000" ' +
                'placeholder="여기에 자기소개서를 작성하세요." name="answer[]"></textarea>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td><button class="btn btn-dark">저장하기</button></td>' +
                '<td colspan="2" style="text-align:right">' +
                '<div class="charCount">0자/1000자 (공백포함)</div>' +
                '</td>' +
                '</tr>';

            newQuestionBlock.appendChild(newTable);
            container.appendChild(newQuestionBlock);

            // 새로 추가된 textarea에 대한 글자 수 카운터 이벤트 리스너
            const newTextarea = newQuestionBlock.querySelector('.coverLetter');
            const newCharCount = newQuestionBlock.querySelector('.charCount');

            newTextarea.addEventListener('input', function() {
                const currentLength = this.value ? this.value.length : 0;
                const maxLength = this.getAttribute('maxlength') || 1000;
                newCharCount.textContent = currentLength + '자/' + maxLength + '자 (공백포함)';
            });

            // 삭제 버튼 이벤트 리스너
            const removeButton = newQuestionBlock.querySelector('.remove-button');
            removeButton.addEventListener('click', function() {
                newQuestionBlock.remove();
            });

            // 새로운 추가 버튼 이벤트 리스너
            const newAddButton = newQuestionBlock.querySelector('.add-question-button');
            newAddButton.addEventListener('click', function() {
                addButton.click(); // 기존 추가 버튼의 클릭 이벤트를 재사용
            });
        });
    });
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>