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
    <link rel="stylesheet" href="<c:url value='/resources/static/mypagebar.css'/>">
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
                <div class="profile-container p-4">
                    <div class="profile-header mb-4">
                        <h2 class="mb-4">프로필 정보</h2>

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
                <script src="../static/editbtn.js"></script>
                <script src="../static/myprofile.js"></script>
                <!-- Bootstrap JS -->

            </div>
        </div>
    </div>
</div>
</body>
</html>
