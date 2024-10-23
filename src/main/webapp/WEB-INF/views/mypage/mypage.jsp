<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>My Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/static/mypage.css'/>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp" />
<div class="mypsidebar-container">
    <div class="mypsidebar">
        <div class="sidebar-title">My IP</div>
        <ul class="sidebar-menu">
            <li>
                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypageint'/>"><i class="fas fa-file-alt"></i>자기소개서 내역</a>
            </li>
            <li>
                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypageque'/>"><i class="fas fa-briefcase"></i>기업 지원 현황</a>
            </li>
            <li>
                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypagevid'/>"><i class="fas fa-microchip"></i>AI 면접 준비 내역</a>
            </li>
            <li>
                <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypage'/>"><i class="fas fa-history"></i>지난 면접 내역</a>
            </li>
        </ul>

        <div class="sidebar-divider"></div>
        <div class="sidebar-title">기업 분석</div>

        <c:forEach var="company" items="${companies}">
            <div class="highlight-item">
                <img src="${company.logoUrl}" alt="company logo" onerror="this.src='https://via.placeholder.com/30'">
                <p>(주)${company.name} (${company.employeeCount}명)</p>
            </div>
        </c:forEach>
    </div>

    <!-- 메인 콘텐츠 영역 -->
    <div class="main-content">
        <h2>면접 내역</h2>
        <div class="interview-list">
            <c:forEach var="interview" items="${interviews}">
                <div class="interview-item">
                    <h3>${interview.position}</h3>
                    <p>지원자: ${interview.applicantName}</p>
                    <p>날짜: ${interview.interviewDate}</p>
                    <p>상태: ${interview.status}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>