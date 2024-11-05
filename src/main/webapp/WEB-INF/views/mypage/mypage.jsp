<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../header.jsp" %>
    <title>My Page</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/mypagemain.css'/>">
</head>
<body>

<jsp:include page="../navbar.jsp" />
<div class="mypsidebar-container">
    <div class="main-content">
        <div class="row">
            <div class="col-2">
                <jsp:include page="mypagebar.jsp"/>
            </div>
            <div class="col-10">
                <div class="content-section">
                    <h2 class="page-header">
                        <span class="user-name">${userName}</span>님의 마이페이지
                    </h2>

                    <div class="status-cards">
                        <div class="status-item">
                            <div>면접 현황</div>
                            <div class="status-number">2</div>
                        </div>
                        <div class="status-item">
                            <div>나의 일정</div>
                            <div class="status-number">3</div>
                        </div>
                        <div class="status-item">
                            <div>지원할만한 공고</div>
                            <div class="status-number">5</div>
                        </div>
                        <div class="status-item">
                            <div>관심기업</div>
                            <div class="status-number">4</div>
                        </div>
                    </div>

                    <div class="card-container">
                        <div class="custom-card">
                            <div class="card-title">_님의 자기소개서 내역</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th>기업명</th>
                                            <th>작성일</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>신입 개발자 지원</td>
                                            <td>(주)네이버</td>
                                            <td>2024.03.15</td>
                                            <td><span class="status-badge status-reviewing">검토중</span></td>
                                            <td>
                                                <button class="btn btn-outline-primary btn-small">수정</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>백엔드 개발자</td>
                                            <td>(주)카카오</td>
                                            <td>2024.03.10</td>
                                            <td><span class="status-badge status-completed">완료</span></td>
                                            <td>
                                                <button class="btn btn-outline-primary btn-small">수정</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2024 상반기 공채</td>
                                            <td>(주)라인</td>
                                            <td>2024.03.05</td>
                                            <td><span class="status-badge status-pending">작성중</span></td>
                                            <td>
                                                <button class="btn btn-outline-primary btn-small">수정</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="custom-card">
                            <div class="card-title">지원할만한 공고</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                        <tr>
                                            <th>기업명</th>
                                            <th>공고명</th>
                                            <th>마감일</th>
                                            <th>지원</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>(주)삼성전자</td>
                                            <td>2024 상반기 신입공채</td>
                                            <td>2024.04.15</td>
                                            <td>
                                                <button class="btn btn-outline-success btn-small">지원하기</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>(주)LG전자</td>
                                            <td>SW 개발자 채용</td>
                                            <td>2024.04.20</td>
                                            <td>
                                                <button class="btn btn-outline-success btn-small">지원하기</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>(주)현대자동차</td>
                                            <td>IT 시스템 개발</td>
                                            <td>2024.04.30</td>
                                            <td>
                                                <button class="btn btn-outline-success btn-small">지원하기</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="card-container">
                        <div class="custom-card">
                            <div class="card-title">최근 활동</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>활동내용</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2024.03.15</td>
                                            <td>''기업 모의 면접</td>
                                            <td><span class="status-badge status-completed">완료</span></td>
                                        </tr>
                                        <tr>
                                            <td>2024.03.14</td>
                                            <td>면접 답변</td>
                                            <td><span class="status-badge status-pending">대기중</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="custom-card">
                            <div class="card-title">관심 기업</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                        <tr>
                                            <th>기업명</th>
                                            <th>채용상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>(주)네이버</td>
                                            <td><span class="status-badge status-completed">채용중</span></td>
                                            <td>
                                                <button class="btn btn-outline-danger btn-small">삭제</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>(주)카카오</td>
                                            <td><span class="status-badge status-pending">준비중</span></td>
                                            <td>
                                                <button class="btn btn-outline-danger btn-small">삭제</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>