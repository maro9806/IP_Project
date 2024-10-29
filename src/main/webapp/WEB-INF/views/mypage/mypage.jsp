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
    <link rel="stylesheet" href="<c:url value='/resources/static/mypage.css'/>">
</head>
<body>
    <jsp:include page="../navbar.jsp" />
    <div class="mypsidebar-container">
        <jsp:include page="mypagebar.jsp"/>
        <!-- 메인 콘텐츠 영역 -->
        <div class="mypsidebar-content">
            <h2>면접 내역</h2>
            <div class="interview-list">
                <%--<c:forEach var="interview" items="${interviews}">--%>
                    <div class="interview-item">
                        <h3>${interview.position}</h3>
                        <p>지원자: ${interview.applicantName}</p>
                        <p>날짜: ${interview.interviewDate}</p>
                        <p>상태: ${interview.status}</p>
                    </div>
                <%--</c:forEach>--%>
            </div>
        </div>
    </div>

</body>
</html>