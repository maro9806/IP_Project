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
    <link rel="stylesheet" href="<c:url value='/resources/static/myprofile.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp"/>

<div class="mypsidebar-container">

    <div class="main-content container-fluid">
        <div class="row g-0">
            <div class="col-2">
               <jsp:include page="mypagebar.jsp"/>
            </div>
            <div class="col-10">
                <div class="profile-header mb-4">
                    <h2 class="page-header mb-4">
                        프로필 정보
                    </h2>
                </div>
                <div class="profile-container p-4">
                        <!-- Profile Photo Section -->
                        <div class="row mb-5">
                            <div class="col-md-3">
                                <div class="profile-photo-section text-center">
                                    <div class="position-relative d-inline-block">
                                        <img src="/api/placeholder/150/150" alt="프로필 사진" class="rounded-circle mb-2"
                                             width="150" height="150">
                                        <button class="btn btn-sm btn-primary position-absolute bottom-0 end-0">
                                            변경
                                        </button>
                                    </div>
                                    <p class="text-muted mt-2">프로필 사진</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="member-id-section mb-3">
                                    <label for="memberId" class="form-label fw-bold">회원 ID</label>
                                    <input type="text" class="form-control" id="memberId" placeholder="회원 ID" readonly>
                                </div>
                            </div>
                        </div>

                        <!-- Education Section -->
                        <div class="mb-4">
                            <h4 class="mb-3">학력</h4>
                            <div id="educationContainer">
                                <div class="education-entry mb-3" id="education-0">
                                    <div class="row g-3">
                                        <div class="col-md-3">
                                            <label class="form-label">학교명</label>
                                            <input type="text" class="form-control" placeholder="학교명을 입력하세요">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">전공</label>
                                            <input type="text" class="form-control" placeholder="전공을 입력하세요">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">졸업상태</label>
                                            <select class="form-select">
                                                <option value="">선택하세요</option>
                                                <option value="graduated">졸업</option>
                                                <option value="attending">재학중</option>
                                                <option value="leave">휴학</option>
                                                <option value="dropout">중퇴</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3 d-flex align-items-end">
                                            <button type="button" class="btn btn-outline-danger"
                                                    onclick="removeSection('education-0')">
                                                삭제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-outline-primary btn-sm" id="addEducation">+ 학력
                                추가
                            </button>
                        </div>

                        <!-- Career Section -->
                        <div class="mb-4">
                            <h4 class="mb-3">경력</h4>
                            <div id="careerContainer">
                                <div class="career-entry mb-3" id="career-0">
                                    <div class="row g-3">
                                        <div class="col-md-3">
                                            <label class="form-label">회사명</label>
                                            <input type="text" class="form-control" placeholder="회사명을 입력하세요">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">직무</label>
                                            <input type="text" class="form-control" placeholder="직무를 입력하세요">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">근무기간</label>
                                            <div class="input-group">
                                                <input type="number" class="form-control" placeholder="년">
                                                <input type="number" class="form-control" placeholder="개월">
                                            </div>
                                        </div>
                                        <div class="col-md-3 d-flex align-items-end">
                                            <button type="button" class="btn btn-outline-danger"
                                                    onclick="removeSection('career-0')">
                                                삭제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-outline-primary btn-sm" id="addCareer">+ 경력
                                추가
                            </button>
                        </div>
                        <!-- Technical Stack Section -->
                        <!-- Technical Stack Section -->
                        <div class="mb-4">
                            <h4 class="mb-3">기술(스택)</h4>
                            <div class="tech-stack-container">
                                <!-- Selected Technologies Display -->
                                <div class="selected-techs-container mb-3 p-3 border rounded">
                                    <div id="selectedTechStack" class="d-flex flex-wrap gap-2">
                                        <!-- Selected tech tags will appear here -->
                                    </div>
                                </div>

                                <!-- Technology Selection Buttons -->
                                <div class="tech-categories mb-3">
                                    <!-- Frontend -->
                                    <div class="tech-category mb-3">
                                        <h6 class="mb-2">Frontend</h6>
                                        <div class="d-flex flex-wrap gap-2">
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="HTML">HTML
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="CSS">CSS
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="JavaScript">JavaScript
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="React">React
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Vue.js">Vue.js
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Angular">Angular
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Backend -->
                                    <div class="tech-category mb-3">
                                        <h6 class="mb-2">Backend</h6>
                                        <div class="d-flex flex-wrap gap-2">
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Python">Python
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Java">Java
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Node.js">Node.js
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Spring">Spring
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Django">Django
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="PHP">PHP
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Database -->
                                    <div class="tech-category mb-3">
                                        <h6 class="mb-2">Database</h6>
                                        <div class="d-flex flex-wrap gap-2">
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="MySQL">MySQL
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="PostgreSQL">PostgreSQL
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="MongoDB">MongoDB
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Oracle">Oracle
                                            </button>
                                        </div>
                                    </div>

                                    <!-- DevOps -->
                                    <div class="tech-category mb-3">
                                        <h6 class="mb-2">DevOps</h6>
                                        <div class="d-flex flex-wrap gap-2">
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Docker">Docker
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Kubernetes">Kubernetes
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="AWS">AWS
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary tech-btn"
                                                    data-tech="Git">Git
                                            </button>
                                        </div>
                                    </div>
                                    <div class="tech-category mb-3">
                                        <div class="d-flex align-items-center mb-2">
                                            <h6 class="mb-0 me-2">직접 입력</h6>
                                            <button type="button" class="btn btn-sm btn-outline-primary"
                                                    id="addCustomTechBtn">+
                                            </button>
                                        </div>
                                        <div id="customTechInput" class="custom-tech-input" style="display: none;">
                                            <div class="input-group mb-2" style="max-width: 300px;">
                                                <input type="text" class="form-control" id="newTechInput"
                                                       placeholder="기술 스택 입력">
                                                <button class="btn btn-primary" type="button" id="submitCustomTech">추가
                                                </button>
                                                <button class="btn btn-outline-secondary" type="button"
                                                        id="cancelCustomTech">취소
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Preferred Location Section -->
                        <div class="mb-4">
                            <h4 class="mb-3">희망 취업지역</h4>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option value="">시/도 선택</option>
                                        <option value="seoul">서울특별시</option>
                                        <option value="gyeonggi">경기도</option>
                                        <option value="incheon">인천광역시</option>
                                        <!-- Add more options as needed -->
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option value="">구/군 선택</option>
                                        <!-- This will be populated based on the first select -->
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Desired Salary Section -->
                        <div class="mb-2">
                            <h4 class="mb-3">희망 연봉</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="number" class="form-control" placeholder="희망 연봉을 입력하세요">
                                        <span class="input-group-text">만원</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Employment Type Section -->
                        <div class="mb-4">
                            <h4 class="mb-3">희망 취업 유형</h4>
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="fulltime">
                                        <label class="form-check-label" for="fulltime">정규직</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="contract">
                                        <label class="form-check-label" for="contract">계약직</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="intern">
                                        <label class="form-check-label" for="intern">인턴</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="freelance">
                                        <label class="form-check-label" for="freelance">프리랜서</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Buttons -->
                        <div class="d-flex gap-2 justify-content-end">
                            <button type="button" class="btn btn-secondary" id="editBtn">수정</button>
                            <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                            <button type="button" class="btn btn-primary" id="saveBtn">저장하기</button>
                        </div>
                        </form>
                    </div>
                </div>
                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        // 전체적인 input btn
                        const selectedTechStack = document.getElementById('selectedTechStack');
                        const techButtons = document.querySelectorAll('.tech-btn');
                        const addCustomTechBtn = document.getElementById('addCustomTechBtn');
                        const customTechInput = document.getElementById('customTechInput');
                        const newTechInput = document.getElementById('newTechInput');
                        const submitCustomTech = document.getElementById('submitCustomTech');
                        const cancelCustomTech = document.getElementById('cancelCustomTech');

                        let selectedTechs = new Set();

                        //스택별 태그 넣기
                        function addTechStack(tech) {
                            if (selectedTechs.has(tech)) return;
                            const tag = document.createElement('div');
                            tag.className = 'tech-tag';
                            tag.innerHTML = `
            <span class="tech-name">${tech}</span>
            <button type="button" class="delete-tech" aria-label="Remove ${tech}">-</button>
        `;
                            // 삭제 버튼 측면에 추가
                            tag.querySelector('.delete-tech').addEventListener('click', () => {
                                tag.remove();
                                selectedTechs.delete(tech);
                                updateButtonStates();
                            });

                            selectedTechStack.appendChild(tag);
                            selectedTechs.add(tech);
                            updateButtonStates();
                        }
                        techButtons.forEach(button => {
                            button.addEventListener('click', function() {
                                const tech = this.dataset.tech;
                                if (!selectedTechs.has(tech)) {
                                    addTechStack(tech);
                                }
                            });
                        });

                        // 커스텀 인풋
                        if (addCustomTechBtn) {
                            addCustomTechBtn.addEventListener('click', function() {
                                customTechInput.style.display = 'block';
                                newTechInput.focus();
                                addCustomTechBtn.style.display = 'none';
                            });
                        }

                        if (submitCustomTech) {
                            submitCustomTech.addEventListener('click', function() {
                                addCustomTechnology();
                            });
                        }

                        if (cancelCustomTech) {
                            cancelCustomTech.addEventListener('click', function() {
                                hideCustomTechInput();
                            });
                        }

                        if (newTechInput) {
                            newTechInput.addEventListener('keypress', function(e) {
                                if (e.key === 'Enter') {
                                    e.preventDefault();
                                    addCustomTechnology();
                                }
                            });
                        }

                        function addCustomTechnology() {
                            const techName = newTechInput.value.trim();
                            if (techName && !selectedTechs.has(techName)) {
                                addTechStack(techName);
                                hideCustomTechInput();
                            }
                        }

                        function hideCustomTechInput() {
                            if (customTechInput) customTechInput.style.display = 'none';
                            if (addCustomTechBtn) addCustomTechBtn.style.display = 'inline-block';
                            if (newTechInput) newTechInput.value = '';
                        }

                        //btn update
                        function updateButtonStates() {
                            techButtons.forEach(button => {
                                const tech = button.dataset.tech;
                                if (selectedTechs.has(tech)) {
                                    button.disabled = true;
                                    button.classList.add('selected');
                                } else {
                                    button.disabled = false;
                                    button.classList.remove('selected');
                                }
                            });
                        }

                        // 학력
                        let educationCounter = 0;
                        document.getElementById('addEducation')?.addEventListener('click', function() {
                            educationCounter++;
                            const newEducation = `
            <div class="education-entry mb-3" id="education-${educationCounter}">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">학교명</label>
                        <input type="text" class="form-control" placeholder="학교명을 입력하세요">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">전공</label>
                        <input type="text" class="form-control" placeholder="전공을 입력하세요">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">졸업상태</label>
                        <select class="form-select">
                            <option value="">선택하세요</option>
                            <option value="graduated">졸업</option>
                            <option value="attending">재학중</option>
                            <option value="leave">휴학</option>
                            <option value="dropout">중퇴</option>
                        </select>
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <button type="button" class="btn btn-outline-danger"
                                onclick="removeSection('education-${educationCounter}')">
                            삭제
                        </button>
                    </div>
                </div>
            </div>
        `;
                            const educationContainer = document.getElementById('educationContainer');
                            educationContainer.insertAdjacentHTML('beforeend', newEducation);
                        });

                        // 경력
                        let careerCounter = 0;
                        document.getElementById('addCareer')?.addEventListener('click', function() {
                            careerCounter++;
                            const newCareer = `
            <div class="career-entry mb-3" id="career-${careerCounter}">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">회사명</label>
                        <input type="text" class="form-control" placeholder="회사명을 입력하세요">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">직무</label>
                        <input type="text" class="form-control" placeholder="직무를 입력하세요">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">근무기간</label>
                        <div class="input-group">
                            <input type="number" class="form-control" placeholder="년">
                            <input type="number" class="form-control" placeholder="개월">
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <button type="button" class="btn btn-outline-danger"
                                onclick="removeSection('career-${careerCounter}')">
                            삭제
                        </button>
                    </div>
                </div>
            </div>
        `;
                            const careerContainer = document.getElementById('careerContainer');
                            careerContainer.insertAdjacentHTML('beforeend', newCareer);
                        });

                        // 수정 취소
                        const editBtn = document.getElementById('editBtn');
                        const cancelBtn = document.getElementById('cancelBtn');
                        const saveBtn = document.getElementById('saveBtn');

                        if (cancelBtn) cancelBtn.style.display = 'none';
                        if (saveBtn) saveBtn.style.display = 'none';

                        let originalValues = {};

                        function getFormValues() {
                            const values = {};
                            document.querySelectorAll('input, select, textarea').forEach(element => {
                                values[element.id || element.name] = element.value;
                            });
                            return values;
                        }

                        function setFieldsReadOnly(readonly) {
                            document.querySelectorAll('input, select, textarea').forEach(element => {
                                element.readOnly = readonly;
                                if (element.tagName.toLowerCase() === 'select') {
                                    element.disabled = readonly;
                                }
                            });

                            document.querySelectorAll('.btn-outline-primary').forEach(btn => {
                                btn.style.display = readonly ? 'none' : 'inline-block';
                            });

                            document.querySelectorAll('.btn-outline-danger').forEach(btn => {
                                btn.style.display = readonly ? 'none' : 'inline-block';
                            });

                            // 기술 스택 블럭화
                            techButtons.forEach(button => {
                                button.disabled = readonly;
                            });

                            document.querySelectorAll('.delete-tech').forEach(button => {
                                button.style.display = readonly ? 'none' : 'inline-block';
                            });

                            // 커스텀 인풋 추가 설정ㄴ
                            if (readonly) {
                                if (addCustomTechBtn) addCustomTechBtn.style.display = 'none';
                                if (customTechInput) customTechInput.style.display = 'none';
                            } else {
                                if (addCustomTechBtn) addCustomTechBtn.style.display = 'inline-block';
                            }
                        }

                        setFieldsReadOnly(true);

                        editBtn?.addEventListener('click', function() {
                            originalValues = getFormValues();

                            if (cancelBtn) cancelBtn.style.display = 'block';
                            if (saveBtn) saveBtn.style.display = 'block';
                            if (editBtn) editBtn.style.display = 'none';

                            setFieldsReadOnly(false);
                        });

                        cancelBtn?.addEventListener('click', function() {
                            for (let id in originalValues) {
                                const element = document.getElementById(id);
                                if (element) {
                                    element.value = originalValues[id];
                                }
                            }

                            if (cancelBtn) cancelBtn.style.display = 'none';
                            if (saveBtn) saveBtn.style.display = 'none';
                            if (editBtn) editBtn.style.display = 'block';

                            setFieldsReadOnly(true);
                        });

                        saveBtn?.addEventListener('click', function() {
                            originalValues = getFormValues();

                            if (cancelBtn) cancelBtn.style.display = 'none';
                            if (saveBtn) saveBtn.style.display = 'none';
                            if (editBtn) editBtn.style.display = 'block';

                            setFieldsReadOnly(true);

                            alert('저장되었습니다!');
                        });
                    });

                    // 전체 설정 (remove)
                    function removeSection(id) {
                        const section = document.getElementById(id);
                        if (section) {
                            section.remove();
                        }
                    }
                </script>
                <!-- Bootstrap JS -->

            </div>
        </div>
    </div>
</div>
</body>
</html>
