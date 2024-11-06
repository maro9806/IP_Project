<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>IPro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/corpboard.css">

</head>

<body>
<jsp:include page="../navbar.jsp"/>
<div class="main-content">
    <div class="jumbotron p-5 rounded">
        <h1 class="display-4">기업 면접 후기 & 리뷰</h1>
        <p class="lead">앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?</p>
        <hr class="my-4 ">
        <p>현직 선배님들의 기업 리뷰와 미리 알아보는 면접 후기</p>
    </div>
    <div class="container">
        <!-- Search Section-->
        <div class="search-section">
    <form action="" method="get">
        <div class="search-dropdown">
            <select name="orderBy" class="dropdown-button">
                <option value="newest" ${param.orderBy == 'newest' ? 'selected' : ''}>최신순</option>
                <option value="oldest" ${param.orderBy == 'oldest' ? 'selected' : ''}>등록순</option>
            </select>
        </div>

        <div class="search-dropdown">
            <select name="reviewCareer" class="dropdown-button">
                <option value="all" ${param.career == 'all' ? 'selected' : ''}>경력 전체</option>
                <!-- 다른 경력 옵션들 -->
            </select>
        </div>

        <div class="search-dropdown">
            <select name="jobType" class="dropdown-button">
                <option value="all" ${param.jobType == 'all' ? 'selected' : ''}>직무·직업 전체</option>
                <!-- 다른 직무 옵션들 -->
            </select>
        </div>

        <input type="text" name="keyword" class="search-input" placeholder="기업명"
               value="${param.keyword}">
        <button type="submit" class="search-button">검색</button>
        <button type="button" class="reset-button" onclick="location.href='?'">⟲</button>
    </form>
</div>
        <!-- AIInterview review Section Table style -->
        <!-- Table Section for Notice Board -->
        <h2 class="section-title">면접 후기</h2>
        <table class="table table-striped notice-board">
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">기업명</th>
                <th scope="col">글 제목</th>
                <th scope="col">Date</th>
                <th scope="col">Count</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${list}" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${board.reviewCompany}</td>
                    <td>${board.reviewTitle}</td>
                    <td>${board.formattedReviewDate}</td>
                    <td>${board.count}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


        <!-- Pagination -->
        <div class="pagination">
            <c:if test="${groupStart > 1}">
                <button onclick="location.href='?page=${groupStart-1}'">&lt;</button>
            </c:if>

            <c:forEach begin="${groupStart}" end="${groupEnd}" var="pageNum">
                <button onclick="location.href='?page=${pageNum}'"
                        class="${pageNum == currentPage ? 'active' : ''}">
                        ${pageNum}
                </button>
            </c:forEach>

            <c:if test="${groupEnd < totalPages}">
                <button onclick="location.href='?page=${groupEnd+1}'">&gt;</button>
            </c:if>
        </div>
        <!-- Write Button -->
        <button class="write-button" onclick="location.href='${pageContext.request.contextPath}/review_board/review_write'">
            <span class="write-icon">✎</span>
            후기 등록하기
        </button>
        <!--corp review Section -->
        <h2 class="section-title mt-5">기업 리뷰</h2>
        <div class="row row-cols-1 g-4">
            <div class="col">
                <div class="reviewcard">
                    <div class="reviewcard-body">
                        <img src="/api/placeholder/100/100" alt="review Image">
                        <div class="corpreviewtitle">
                            <h5 class="reviewcard-title">넥슨(주)</h5>
                            <p class="reviewcard-text">뭘 써야할까</p>
                            <footer class="blockquote-footer">사용자 닉네임 1</footer>
                        </div>
                        <div class="content-wrapper">
                            <div class="corpreviewtext1">
                                <a># 대기업</a>
                                <a># 복장 자유</a>
                                <a># 자유로운 출근</a>
                            </div>
                            <div class="corpreviewtext2">
                                <p>"근무시간 상관없이 주어진 업무만 다 하면 퇴근이 가능하다."</p>
                                <p>"자유로운 분위기 속에서 책임감이 부여되는 곳, 열린 마인드의 경영진"</p>
                            </div>
                        </div>
                        <span class="review-count">기업 리뷰 -건</span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="reviewcard">
                    <div class="reviewcard-body">
                        <img src="/api/placeholder/100/100" alt="review Image">
                        <div class="corpreviewtitle">
                            <h5 class="reviewcard-title">넥슨(주)</h5>
                            <p class="reviewcard-text">뭘 써야할까</p>
                            <footer class="blockquote-footer">사용자 닉네임 1</footer>
                        </div>
                        <div class="content-wrapper">
                            <div class="corpreviewtext1">
                                <a># 대기업</a>
                                <a># 복장 자유</a>
                                <a># 자유로운 출근</a>
                            </div>
                            <div class="corpreviewtext2">
                                <p>"근무시간 상관없이 주어진 업무만 다 하면 퇴근이 가능하다."</p>
                                <p>"자유로운 분위기 속에서 책임감이 부여되는 곳, 열린 마인드의 경영진"</p>
                            </div>
                        </div>
                        <span class="review-count">기업 리뷰 -건</span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="reviewcard">
                    <div class="reviewcard-body">
                        <img src="/api/placeholder/100/100" alt="review Image">
                        <div class="corpreviewtitle">
                            <h5 class="reviewcard-title">넥슨(주)</h5>
                            <p class="reviewcard-text">뭘 써야할까</p>
                            <footer class="blockquote-footer">사용자 닉네임 1</footer>
                        </div>
                        <div class="content-wrapper">
                            <div class="corpreviewtext1">
                                <a># 대기업</a>
                                <a># 복장 자유</a>
                                <a># 자유로운 출근</a>
                            </div>
                            <div class="corpreviewtext2">
                                <p>"근무시간 상관없이 주어진 업무만 다 하면 퇴근이 가능하다."</p>
                                <p>"자유로운 분위기 속에서 책임감이 부여되는 곳, 열린 마인드의 경영진"</p>
                            </div>
                        </div>
                        <span class="review-count">기업 리뷰 -건</span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="reviewcard">
                    <div class="reviewcard-body">
                        <img src="/api/placeholder/100/100" alt="review Image">
                        <div class="corpreviewtitle">
                            <h5 class="reviewcard-title">넥슨(주)</h5>
                            <p class="reviewcard-text">뭘 써야할까</p>
                            <footer class="blockquote-footer">사용자 닉네임 1</footer>
                        </div>
                        <div class="content-wrapper">
                            <div class="corpreviewtext1">
                                <a># 대기업</a>
                                <a># 복장 자유</a>
                                <a># 자유로운 출근</a>
                            </div>
                            <div class="corpreviewtext2">
                                <p>"근무시간 상관없이 주어진 업무만 다 하면 퇴근이 가능하다."</p>
                                <p>"자유로운 분위기 속에서 책임감이 부여되는 곳, 열린 마인드의 경영진"</p>
                            </div>
                        </div>
                        <span class="review-count">기업 리뷰 -건</span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="reviewcard">
                    <div class="reviewcard-body">
                        <img src="/api/placeholder/100/100" alt="review Image">
                        <div class="corpreviewtitle">
                            <h5 class="reviewcard-title">넥슨(주)</h5>
                            <p class="reviewcard-text">뭘 써야할까</p>
                            <footer class="blockquote-footer">사용자 닉네임 1</footer>
                        </div>
                        <div class="content-wrapper">
                            <div class="corpreviewtext1">
                                <a># 대기업</a>
                                <a># 복장 자유</a>
                                <a># 자유로운 출근</a>
                            </div>
                            <div class="corpreviewtext2">
                                <p>"근무시간 상관없이 주어진 업무만 다 하면 퇴근이 가능하다."</p>
                                <p>"자유로운 분위기 속에서 책임감이 부여되는 곳, 열린 마인드의 경영진"</p>
                            </div>
                        </div>
                        <span class="review-count">기업 리뷰 -건</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('.AIInterview-header').forEach(header => {
        header.addEventListener('click', () => {
            const card = header.closest('.AIInterview-card');
            card.classList.toggle('active');
        });
    });
</script>


<jsp:include page="../navbar.jsp"/>
</body>

</html>