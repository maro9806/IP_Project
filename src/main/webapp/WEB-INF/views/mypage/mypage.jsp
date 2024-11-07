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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
                        <span class="user-name"><sec:authentication property="principal.member.name"/></span>님의 마이페이지
                    </h2>

                    <div class="status-cards">
                        <div class="status-item">
                            <div>자기소개서</div>
                            <div class="status-number">${fn:length(selfBoards)}</div>
                        </div>
                        <div class="status-item">
                            <div>면접 현황</div>
                            <div class="status-number">3</div>
                        </div>
                        <div class="status-item">
                            <div>관심 기업</div>
                            <div class="status-number">2</div>
                        </div>
                        <div class="status-item">
                            <div>지원현황</div>
                            <div class="status-number">4</div>
                        </div>
                    </div>

                    <div class="card-container">
                        <div class="custom-card">
                            <div class="card-title d-flex justify-content-between">
                                최근 자기소개서
                                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypageint'/>"  style="text-decoration: none; color:gray;">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                    <tr>
                                        <th>기업명</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>관리</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${selfBoards}" var="selfBoard" varStatus="status">
                                        <c:if test="${status.index < 3}">
                                            <tr>
                                                <td><c:out value="${selfBoard.selfCompany}"/></td>
                                                <td><c:out value="${selfBoard.selfTitle}"/></td>
                                                <td>${fn:substring(selfBoard.selfDate, 0, 10)} ${fn:substring(selfBoard.selfDate, 11, 16)}
                                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/></td>
                                                <td>
                                                    <button class="btn btn-outline-primary btn-small" onclick="location.href='${pageContext.request.contextPath}/mypage/mypagelist/${selfBoard.selfIdx}'">수정</button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="custom-card">
                            <div class="card-title d-flex justify-content-between">
                                AI 면접 내역
                                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypagevid'/>"  style="text-decoration: none; color:gray;">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                    <tr>
                                        <th>기업명</th>
                                        <th>지원직무</th>
                                        <th>면접일</th>
                                        <th>영상면접</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>(주)삼성전자</td>
                                        <td>2024 상반기 신입공채</td>
                                        <td>2024.04.15</td>
                                        <td>
                                            <button class="btn btn-outline-success btn-small">보러가기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>(주)LG전자</td>
                                        <td>SW 개발자 채용</td>
                                        <td>2024.04.20</td>
                                        <td>
                                            <button class="btn btn-outline-success btn-small">보러가기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>(주)현대자동차</td>
                                        <td>IT 시스템 개발</td>
                                        <td>2024.04.30</td>
                                        <td>
                                            <button class="btn btn-outline-success btn-small">보러가기</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="card-container">
                        <div class="custom-card">
                            <div class="card-title">관심 기업</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                    <tr>
                                        <th>기업명</th>
                                        <th>채용상태</th>
                                        <th>기업분석</th>
                                        <th>관리</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>(주)네이버</td>
                                        <td><span class="status-badge status-completed">채용중</span></td>
                                        <td>
                                            <button class="btn btn-outline-primary btn-small">기업분석</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-outline-danger btn-small">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>(주)카카오</td>
                                        <td><span class="status-badge status-pending">준비중</span></td>
                                        <td>
                                            <button class="btn btn-outline-primary btn-small">기업분석</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-outline-danger btn-small">삭제</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="custom-card">
                            <div class="card-title">지원 현황</div>
                            <div class="table-responsive">
                                <table class="table custom-table">
                                    <thead>
                                    <tr>
                                        <th>날짜</th>
                                        <th>기업명</th>
                                        <th>활동내용</th>
                                        <th>상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>2024.03.15</td>
                                        <td>네이버</td>
                                        <td>대졸 인턴 채용 면접 서류</td>
                                        <td><span class="status-badge status-completed">불합격</span></td>
                                    </tr>
                                    <tr>
                                        <td>2024.03.14</td>
                                        <td>카카오</td>
                                        <td>실무 면접 실시</td>
                                        <td><span class="status-badge status-pending">결과대기중</span></td>
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