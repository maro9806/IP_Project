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
            <div class="Content-Section p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>'홍길동'님의 자기소개서 목록</h2>
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
                        <tr>
                            <td>1</td>
                            <td>중근당</td>
                            <td>Back-End 개발자</td>
                            <td>자소서 제목이 만약에 엄청나게 길다면~~~~~~~~~~~~</td>
                            <td>2024.10.15</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-outline-primary">수정</button>
                                    <button class="btn btn-sm btn-outline-danger">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>LG화학</td>
                            <td>Front-End 개발자</td>
                            <td>자소서 제목</td>
                            <td>2024.10.14</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-outline-primary">수정</button>
                                    <button class="btn btn-sm btn-outline-danger">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>카카오</td>
                            <td>Full-Stack 개발자</td>
                            <td>자소서 제목</td>
                            <td>2024.10.13</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-outline-primary">수정</button>
                                    <button class="btn btn-sm btn-outline-danger">삭제</button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination -->
                <div class="d-flex justify-content-center mt-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
            </div>
        </div>
    </div>

</body>
</html>