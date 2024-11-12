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
    <link rel="stylesheet" href="<c:url value='/resources/static/mypage/mypagebar.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/mypage/mypageint.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp"/>

<div class="mypsidebar-container">
    <jsp:include page="mypagebar.jsp"/>
    <div class="mypsidebar-content">
        <div class="Content-Section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="page-header">
                    <sec:authentication property="principal.member.name"/>님의 자기소개서 목록
                    <span class="header-badge">(총 ${fn:length(selfBoards)}건)</span>
                </h2>
                <!-- Write Button -->
                <button class="btn btn-primary write-btn" onclick="showSelfIntroModal()">
                    <i class="bi bi-pencil-square me-1"></i> 글쓰기
                </button>

                <!--Writing Form popup -->
                <div class="modal fade" id="selfIntroModal" tabindex="-1" aria-labelledby="selfIntroModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="selfIntroModalLabel">자기소개서 작성</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="selfIntroForm">
                                    <div class="mb-3">
                                        <label for="selfTitle" class="form-label"><b>자기소개서 작성하기</b></label>
                                        <input type="text" class="form-control" id="selfTitle" name="title"
                                               placeholder="자기소개서 제목을 작성하세요.">
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="companySelect" class="form-label"><b>기업명</b></label>
                                            <select id="companySelect" class="form-control" name="company">
                                                <option value="">기업명 선택하기</option>
                                                <option value="Nexon">넥슨</option>
                                                <option value="Kakao">카카오</option>
                                                <option value="Line">라인 플러스</option>
                                                <option value="Carrot">당근마켓</option>
                                                <option value="Naver">네이버</option>
                                                <option value="Delivery">배달의 민족</option>
                                                <option value="NCsoft">NC 소프트</option>
                                                <option value="Netmable">넷마블</option>
                                                <option value="Coupang">쿠팡</option>
                                                <option value="Toss">토스</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="jobSelect" class="form-label"><b>지원 직무</b></label>
                                            <select id="jobSelect" class="form-control" name="position">
                                                <option value="">직무 선택하기</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div id="questions-container">
                                        <div class="question-row mb-3">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <input type="text" class="form-control" name="questions[]"
                                                       placeholder="문항1. 자기소개서 문항을 작성하세요.">
                                                <button type="button" class="btn btn-outline-primary ms-2 add-question">
                                                    <i class="bi bi-plus"></i>
                                                </button>
                                            </div>
                                            <textarea class="form-control answer-textarea" rows="7" maxlength="1000"
                                                      name="answers[]" placeholder="여기에 자기소개서를 작성하세요."></textarea>
                                            <div class="text-end mt-1">
                                                <small class="char-count">0자/1000자 (공백포함)</small>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" onclick="submitForm()">저장하기</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="card">
                <div class="card-body">
                    <!-- Search and Filter Section -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="d-flex gap-3">
                            <select class="form-select" style="width: 150px;">
                                <option selected>전체보기</option>
                            </select>
                        </div>
                        <div class="d-flex gap-2">
                            <input type="text" class="form-control" placeholder="기업명을 입력하세요"
                                   style="width: 200px;">
                            <button class="btn btn-primary">검색</button>
                        </div>
                    </div>

                    <!-- Table Section -->
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">기업명</th>
                                <th scope="col">직무</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성일</th>
                                <th scope="col">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${selfBoards}" var="selfBoard" varStatus="i">
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td><c:out value="${selfBoard.selfCompany}"/></td>
                                    <td><c:out value="${selfBoard.selfPosition}"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/mypage/mypagelist/${selfBoard.selfIdx}"><c:out
                                                value="${selfBoard.selfTitle}"/></a></td>
                                    <td>${fn:substring(selfBoard.selfDate, 0, 10)} ${fn:substring(selfBoard.selfDate, 11, 16)}
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-sm btn-outline-primary"
                                                    onclick="location.href='${pageContext.request.contextPath}/mypage/mypagelist/${selfBoard.selfIdx}'">
                                                수정
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger"
                                                    onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='${pageContext.request.contextPath}/mypage/remove/${selfBoard.selfIdx}'">
                                                삭제
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Pagination -->
                    <div class="d-flex justify-content-center mt-4">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:set var="totalPages" value="${(fn:length(selfBoards) + 4) / 5}"/>
                                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                    <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script>
            // Job roles mapping
            const jobRoles = {
                'Nexon': ['백엔드 개발자', '프론트엔드 개발자', '게임 개발자', 'DevOps 엔지니어'],
                'Kakao': ['백엔드 개발자', '프론트엔드 개발자', '안드로이드 개발자', 'iOS 개발자'],
                'Line': ['백엔드 개발자', '프론트엔드 개발자', '모바일 개발자', '데이터 엔지니어'],
                'Carrot': ['백엔드 개발자', '프론트엔드 개발자', '안드로이드 개발자', 'iOS 개발자'],
                'Naver': ['백엔드 개발자', '프론트엔드 개발자', '머신러닝 엔지니어', '보안 엔지니어'],
                'Delivery': ['백엔드 개발자', '프론트엔드 개발자', '데브옵스 엔지니어', '데이터 엔지니어'],
                'NCsoft': ['게임 클라이언트 개발자', '게임 서버 개발자', '그래픽스 엔지니어', 'AI 엔지니어'],
                'Netmable': ['게임 개발자', '서버 개발자', '클라이언트 개발자', 'DevOps 엔지니어'],
                'Coupang': ['백엔드 개발자', '프론트엔드 개발자', '풀스택 개발자', '시스템 엔지니어'],
                'Toss': ['백엔드 개발자', '프론트엔드 개발자', '안드로이드 개발자', 'iOS 개발자']
            };

            // Modal instance
            let selfIntroModal = null;

            // Initialize when document is ready
            document.addEventListener('DOMContentLoaded', function() {
                selfIntroModal = new bootstrap.Modal(document.getElementById('selfIntroModal'));
                setupEventListeners();
            });

            // Show modal function
            function showSelfIntroModal() {
                selfIntroModal.show();
            }

            // Setup all event listeners
            function setupEventListeners() {
                // Company select change handler
                document.getElementById('companySelect').addEventListener('change', updateJobRoles);

                // Character counter for textareas
                document.addEventListener('input', handleTextareaInput);

                // Add question button handler
                document.addEventListener('click', handleAddQuestion);
            }

            // Update job roles based on selected company
            function updateJobRoles() {
                const companySelect = document.getElementById('companySelect');
                const jobSelect = document.getElementById('jobSelect');
                jobSelect.innerHTML = '<option value="">직무 선택하기</option>';

                const roles = jobRoles[companySelect.value] || [];
                roles.forEach(role => {
                    const option = document.createElement('option');
                    option.value = role;
                    option.textContent = role;
                    jobSelect.appendChild(option);
                });
            }

            // Handle textarea input for character counting
            function handleTextareaInput(e) {
                if (e.target.matches('.answer-textarea')) {
                    const count = e.target.value.length;
                    const countDisplay = e.target.parentElement.querySelector('.char-count');
                    if (countDisplay) {
                        countDisplay.textContent = `${count}자/1000자 (공백포함)`;
                    }
                }
            }

            // Handle adding new question
            function handleAddQuestion(e) {
                if (e.target.matches('.add-question') || e.target.closest('.add-question')) {
                    e.preventDefault();

                    const questionsContainer = document.getElementById('questions-container');
                    const questionBlocks = questionsContainer.querySelectorAll('.question-row');
                    const newQuestionNumber = questionBlocks.length + 1;

                    const newQuestionBlock = document.createElement('div');
                    newQuestionBlock.className = 'question-row mb-3';
                    newQuestionBlock.innerHTML = `
            <div class="d-flex justify-content-between align-items-center mb-2">
                <input type="text" class="form-control" name="questions[]"
                       placeholder="문항${newQuestionNumber}. 자기소개서 문항을 작성하세요.">
                <button type="button" class="btn btn-outline-primary ms-2 add-question">
                    <i class="bi bi-plus"></i>
                </button>
            </div>
            <textarea class="form-control answer-textarea" rows="7" maxlength="1000"
                      name="answers[]" placeholder="여기에 자기소개서를 작성하세요."></textarea>
            <div class="text-end mt-1">
                <small class="char-count">0자/1000자 (공백포함)</small>
            </div>
        `;

                    questionsContainer.appendChild(newQuestionBlock);
                }
            }

            // Form submission handler
            function submitForm() {
                const form = document.getElementById('selfIntroForm');
                const formData = new FormData(form);

                // Validate form
                if (!validateForm(formData)) {
                    return;
                }

                // Send form data to server
                fetch('/mypage/save', {
                    method: 'POST',
                    body: formData
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert('자기소개서가 저장되었습니다.');
                                selfIntroModal.hide();
                                location.reload();
                            } else {
                                alert('저장 중 오류가 발생했습니다.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('저장 중 오류가 발생했습니다.');
                        });
            }

            // Form validation
            function validateForm(formData) {
                if (!formData.get('title')) {
                    alert('제목을 입력해주세요.');
                    return false;
                }

                if (!formData.get('company')) {
                    alert('기업명을 선택해주세요.');
                    return false;
                }

                if (!formData.get('position')) {
                    alert('직무를 선택해주세요.');
                    return false;
                }

                const questions = formData.getAll('questions[]');
                const answers = formData.getAll('answers[]');

                for (let i = 0; i < questions.length; i++) {
                    if (!questions[i]) {
                        alert(`${i + 1}번 문항을 입력해주세요.`);
                        return false;
                    }
                    if (!answers[i]) {
                        alert(`${i + 1}번 답변을 입력해주세요.`);
                        return false;
                    }
                }

                return true;
            }
        </script>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom JS -->
        <script src="<c:url value='/resources/js/selfIntroModal.js'/>"></script>
</body>
</html>