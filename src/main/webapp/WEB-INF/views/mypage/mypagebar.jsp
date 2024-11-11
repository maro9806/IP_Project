<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Side Navigation</title>
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="<c:url value='/resources/static/mypagebar.css'/>">
</head>
<body>
<!-- Sidebar -->
<div class="mypsidebar">
  <div class="sidebar-title">My IP</div>
  <div class="sidebar-divider"></div>
  <ul class="sidebar-menu">
    <li>
      <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypage'/>">
        <i class="fas fa-home"></i>
        <span>마이홈</span>
      </a>
    </li>
    <li>
      <a href="<c:url value='${pageContext.request.contextPath}/mypage/myprofile'/>">
        <i class="fas fa-briefcase"></i>
        <span>회원정보이력</span>
      </a>
    </li>
    <li>
      <a href="<c:url value='${pageContext.request.contextPath}/mypage/mypageint'/>">
        <i class="fas fa-file-alt"></i>
        <span>자기소개서 내역</span>
      </a>
    </li>
  </ul>

  <div class="sidebar-title">관심 기업</div>
  <div class="sidebar-divider"></div>

  <c:forEach var="company" items="${companies}">
    <div class="highlight-item">
      <img src="${company.logoUrl}" alt="company logo" onerror="this.src='https://via.placeholder.com/30'">
      <p>(주)${company.name}</p>
    </div>
  </c:forEach>
</div>
</body>
</html>