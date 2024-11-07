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
    <link rel="stylesheet" href="<c:url value='/resources/static/mypageint.css'/>">
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
</body>
</html>