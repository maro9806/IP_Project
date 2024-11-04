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

    <h4 class="h-title">1. 자기소개서 선택하기</h4>
    <h5>자기소개서 불러오기 / 작성하기</h5>
    <hr style="width:100%;">

    <div class="container d-flex flex-column align-items-center mt-0" style="width:70%;">
        <div style="width:100%; padding-left:5%;">
            <div class="question-block">
                <table style="width:100%;">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 40%;">
                        <col style="width: 30%;">

                    </colgroup>

                    <tr>
                        <td> <b><label for="select_company">기업명</label></b>
                            <input id="select_company" class="form-control" name="company-name" readonly style="width:200px; background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;"/>
                        </td>
                        <td>
                            <b><label for="select_position">지원 직무 </label></b>
                            <input id="select_position" class="form-control" name="job-position" readonly style="width:200px; background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;"/>
                        </td>
                        <td style="text-align: right;">
                            <button id="loadModalBtn" class="btn btn-dark">자기소개서 불러오기</button>
                        </td>
                    </tr>
                    <tbody id="QnAs">
                    <tr style="border-top:1px solid gray;">
                        <td colspan="3">
                            <label for="select_question"><strong>자기소개서</strong></label><input readonly id="select_question" type="text" class="form-control" name="select-company" style="background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <textarea id="select_answer" class="form-control" name="select-answers" rows="6" readonly style="background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 면접질문 생성하기 버튼 컨테이너 수정 -->
        <button onclick="location.href='<%= request.getContextPath() %>/aiboard/ai_makequestion'"
                type="submit" id="next" class="btn btn-primary">
            면접질문 생성하기
        </button>
    </div>

    <!-- 불러오기 모달 창 -->
    <div id="loadModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h5><strong>자기소개서 불러오기</strong></h5>
            <p>면접 질문을 추출할 자기소개서를 선택하세요</p>
            <div id="noSelfBoardMessage" style="display: ${empty selfBoards ? 'block' : 'none'};">
                <div class="card">
                    <div class="card-body d-flex justify-content-center align-items-center" style="height: 100px;">
                        <p>저장한 자기소개서 내역이 없습니다.</p>
                    </div>
                </div>
            </div>
            <ul style="list-style: none; padding: 0;">
                <c:forEach items="${selfBoards}" var="selfBoard">
                    <li onclick="loadSelfIntroduction(${selfBoard.selfIdx})" class="btn btn-outline-dark mb-2 text-start" style="width: 100%;">
                        <div>
                            <small>${fn:substring(selfBoard.selfDate, 0, 10)} ${fn:substring(selfBoard.selfDate, 11, 16)}</small>
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/><br> <!-- 작성일 표시 -->
                            <strong><c:out value="${selfBoard.selfCompany}"/></strong> <strong>${selfBoard.selfPosition}</strong> <br>
                            <span>${selfBoard.selfTitle}</span>

                        </div>
                    </li>
                </c:forEach>
            </ul>
            <button id="openModalBtn" class="btn btn-dark" type="submit" style="width:100%">자기소개서 작성하기</button>
        </div>
    </div>

    <!-- 작성하기 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="${pageContext.request.contextPath}/aiboard/saveIntroduction" method="post" onsubmit="return validateForm()">
                <div id="questions-container" style="width:95%; padding-left:5%;">
                    <div class="question-block">
                        <table style="width:100%;">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 70%;">
                            </colgroup>
                            <tr>
                                <td colspan="2" id="self_title"> <b><label for="self_title">자기소개서 작성하기</label></b>
                                    <input type="text" class="form-control" name="title" placeholder="자기소개서 제목을 작성하세요." />
                                </td>
                            </tr>

                            <tr>
                                <td style="padding-right:30px"> <b><label for="company-name">기업명</label></b>
                                    <select id="company-name" class="form-control" name="company" style="width:200px;">
                                        <option value="">기업명 선택하기</option>
                                        <option value="네이버">네이버</option>
                                        <option value="넥슨">넥슨</option>
                                        <option value="당근마켓">당근마켓</option>
                                        <option value="라인플러스">라인플러스</option>
                                    </select>
                                </td>
                                <td>
                                    <b><label for="job-position">지원 직무 </label></b>
                                    <select id="job-position" class="form-control" name="position" style="width:200px;">
                                        <option value="">직무 선택하기</option>
                                        <option value="Back-End개발자">Back-End</option>
                                        <option value="Front-End개발자">Front-End</option>
                                        <option value="개발직군">개발직군</option>
                                        <option value="디자인직군">디자인직군</option>
                                        <option value="마케팅직군">마케팅직군</option>
                                        <option value="기획직군">기획직군</option>

                                    </select>
                                </td>
                            </tr>
                            <tr style="border-top:1px solid gray;">
                                <td colspan="2" style="text-align: right;">
                                    <button id="add-question-button" style="background-color:white">+</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="first-question-row">
                                    <input type="text" id="question-1" class="form-control" name="questions" placeholder="문항1. 자기소개서 문항을 작성하세요." />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea id="coverLetter" class="form-control" rows="7" maxlength="1000"  name="answers" placeholder="여기에 자기소개서를 작성하세요."></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:right">
                                    <div id="charCount">0자/1000자 (공백포함)</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <button class="btn btn-dark" type="submit" style="width:100%">저장하기</button>
            </form>
        </div>
    </div>
</div>


</div>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모달 창 요소 가져오기
        var loadModal = document.getElementById("loadModal");
        var modal = document.getElementById("myModal");

        // 모달 열기 버튼 요소 가져오기
        var loadModalBtn = document.getElementById("loadModalBtn")
        var openModalBtn = document.getElementById("openModalBtn");

        // 각 모달의 닫기 버튼 요소 가져오기
        var loadCloseBtn = loadModal.querySelector(".close");
        var myCloseBtn = modal.querySelector(".close");

        // 페이지 로드 시 loadModal 표시
        window.onload = function() {
            if (loadModal.style.display !== "block") {
                loadModal.style.display = "block";
            }
        };

        // "자기소개서 불러오기" 버튼을 클릭하면 모달을 보여줍니다
        loadModalBtn.onclick = function() {
            loadModal.style.display = "block";
        };

        // "자기소개서 작성하기" 버튼을 클릭하면 모달을 보여줍니다
        openModalBtn.onclick = function() {
            modal.style.display = "block";
        }

        // 각 모달의 닫기 버튼 클릭 시 해당 모달을 닫음
        loadCloseBtn.onclick = function() {
            loadModal.style.display = "none";
        };
        myCloseBtn.onclick = function() {
            modal.style.display = "none";
        }

        // 모달 바깥을 클릭하면 해당 모달을 닫음
        window.onclick = function(event) {
            if (event.target == loadModal) {
                loadModal.style.display = "none";
            } else if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        const container = document.getElementById('questions-container');
        const addButton = document.getElementById('add-question-button');
        let questionCounter = 1;

        // 원래 있는 coverLetter 텍스트 영역과 글자 수 카운터 가져오기
        const originalCoverLetter = document.getElementById("coverLetter");
        const originalCharCount = document.getElementById("charCount");

        // 원래 있는 coverLetter에 글자 수 세기 기능 추가
        originalCoverLetter.addEventListener('input', function() {
            const currentLength = this.value.length;
            const maxLength = this.getAttribute('maxlength') || 1000;
            originalCharCount.textContent = currentLength + '자/' + maxLength + '자 (공백포함)';
        });

        addButton.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 제출 동작을 막음
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
                '<td colspan="2">' +
                '<input type="text" class="form-control" name="questions" ' +
                'placeholder="문항' + questionCounter + '. 자기소개서 문항을 작성하세요." />' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="2">' +
                '<textarea class="form-control coverLetter" rows="7" maxlength="1000" ' +
                'placeholder="여기에 자기소개서를 작성하세요." name="answers"></textarea>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="2" style="text-align:right">' +
                '<div class="charCount">0자/1000자 (공백포함)</div>' +
                '</td>' +
                '</tr>';

            newQuestionBlock.appendChild(newTable);
            container.appendChild(newQuestionBlock);

            // 입력된 문자 수 세기
            const coverLetter = document.getElementById("coverLetter");
            const charCount = document.getElementById("charCount");

            const currentLength = this.value ? this.value.length : 0;

            coverLetter.addEventListener('input', function() {
                charCount.textContent = currentLength+'자/1000자 (공백 포함)';
            });

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
            newAddButton.addEventListener('click', function(event) {
                event.preventDefault();
                addButton.click(); // 기존 추가 버튼의 클릭 이벤트를 재사용
            });
        });
    });

    // 폼 유효성 검사 함수
    function validateForm() {
        const title = document.querySelector("input[name='title']").value;
        const company = document.querySelector("select[name='company']").value;
        const position = document.querySelector("select[name='position']").value;
        const question = document.querySelector("input[name='questions']").value;
        const answer = document.querySelector("textarea[name='answers']").value;

        if (!title || !company || !position || !question || !answer) {
            alert("모든 필드를 채워주세요.");
            return false;  // 폼 제출 방지
        }
        return true;  // 유효성 검사 통과
    }

    document.getElementById('closeModal').onclick = function() {
        // 모달을 숨기도록 설정
        document.getElementById('modal').style.display = 'none';
    };

    function loadSelfIntroduction(selfIdx) {
        // AJAX 요청으로 데이터를 가져오기
        $.ajax({
            url: `${pageContext.request.contextPath}/aiboard/loadSelfIntroduction/`+selfIdx,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                // 가져온 데이터를 input, textarea에 채우기
                document.getElementById("select_company").value = data.company;
                document.getElementById("select_position").value = data.position;

                // 질문과 답변을 추가할 tbody 선택
                const questionsAndAnswers = document.getElementById('QnAs');
                questionsAndAnswers.innerHTML = ''; // 기존 내용 지우기

                // 질문과 답변 배열 길이
                const questionsLength = data.questions.length;
                const answersLength = data.answers.length;
// 질문과 답변을 테이블에 추가
                for (let i = 0; i < Math.min(questionsLength, answersLength); i++) {
                    const question = data.questions[i];
                    const answer = data.answers[i];

                    // 질문 행 추가
                    const questionRow = document.createElement('tr');
                    questionRow.style.borderTop = '1px solid gray';
                    questionRow.innerHTML = '<td colspan="3">' +
                        '<label for="select_question_' + i + '"><strong>자기소개서 문항 ' + (i + 1) + '</strong></label>' +
                        '<input readonly id="select_question_' + i + '" type="text" class="form-control" name="select-question-' + i + '" value="' + question + '" style="background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;" />' +
                        '</td>';
                    questionsAndAnswers.appendChild(questionRow);

                    // 답변 행 추가
                    const answerRow = document.createElement('tr');
                    answerRow.innerHTML = '<td colspan="3">' +
                        '<textarea id="select_answer_' + i + '" class="form-control" name="select-answer-' + i + '" rows="5" readonly style="background-color: #f5f5f5; color: #6c757d; border: 1px solid #ced4da;">' + answer + '</textarea>' +
                        '</td>';
                    questionsAndAnswers.appendChild(answerRow);
                }

                // 모달 닫기
                loadModal.style.display = "none";
            },
            error: function(xhr, status, error) {
                console.error('Error fetching self-introduction:', error);
            }
        });
    }
</script>

<jsp:include page="../footer.jsp"/>

</body>
</html>