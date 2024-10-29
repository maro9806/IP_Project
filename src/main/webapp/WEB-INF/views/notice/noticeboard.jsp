<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
  <%@ include file="../header.jsp" %>
  <link rel="stylesheet" href="<c:url value='/resources/static/noticeboard.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp" />
<!-- Main Content -->
<div class="main-content">
  <!-- Header Jumbotron -->
  <div class="jumbotron p-5 text-white rounded">
    <h1 class="display-4">면접의 고수</h1>
    <p class="lead">합격자들의 자소서와 취업 관련 최신 정보들까지</p>
    <hr class="my-4 opacity-25">
    <p class="mb-0">보증된 합격자들의 합격 노하우!</p>
  </div>
  <!-- Notice Board Content -->
  <div class="container mt-4">
    <div class="row g-4">
      <!-- User Posts Section -->
      <div class="col-6">
        <div class="card h-100">
          <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
            <h5 class="mb-0">합격자 자소서</h5>
            <button class="btn btn-primary btn-sm rounded-pill px-3">글쓰기</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-hover align-middle">
                <thead class="table-light">
                <tr>
                  <th style="width: 60%">제목</th>
                  <th style="width: 20%">작성자</th>
                  <th style="width: 20%">작성일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="text-primary">네이버 합격 자소서 공유합니다</td>
                  <td>김** </td>
                  <td>2024.10.25</td>
                </tr>
                <tr>
                  <td class="text-primary">카카오 최종 합격 후기</td>
                  <td>*하*</td>
                  <td>2024.10.24</td>
                </tr>
                <tr>
                  <td class="text-primary">중근당 합격 자소서입니다</td>
                  <td>**은</td>
                  <td>2024.10.23</td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <!-- Admin Notice Section -->
      <div class="col-6">
        <div class="card h-100">
          <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
            <h5 class="mb-0">취업 관련 유용한 자료</h5>
            <div class="d-flex gap-2">
              <button class="btn btn-primary btn-sm rounded-pill px-3">공지작성</button>
            </div>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-hover align-middle">
                <thead class="table-light">
                <tr>
                  <th style="width: 15%">구분</th>
                  <th style="width: 45%">제목</th>
                  <th style="width: 20%">작성자</th>
                  <th style="width: 20%">작성일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>공지</td>
                  <td class="text-primary">10월 채용 공고 모음</td>
                  <td>관리자</td>
                  <td>2024.10.25</td>
                </tr>
                <tr>
                  <td>취업</td>
                  <td class="text-primary">2024 하반기 공채 일정</td>
                  <td>관리자</td>
                  <td>2024.10.24</td>
                </tr>
                <tr>
                  <td>면접</td>
                  <td class="text-primary">IT 기업 면접 준비하기</td>
                  <td>관리자</td>
                  <td>2024.10.23</td>
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

</body>
</html>
