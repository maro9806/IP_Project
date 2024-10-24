<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>기업 분석</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/static/corp.css'/>">
</head>

<body>
<jsp:include page="../navbar.jsp"/>
<!-- Search Section -->
<section class="search-section bg-secondary text-white">
    <div class="container">
        <h1>기업 분석</h1>
        <p>원하는 기업 분석을 한 눈에 기업 SWOT 레포트를 제공해요.</p>
        <div class="input-group mb-3 w-50 mx-auto">
            <input type="text" class="form-control" placeholder="기업명을 입력하세요" aria-label="Search"/>
            <button class="btn btn-dark" type="button">Search</button>
        </div>
    </div>
</section>

<!-- 기업 정보 Section -->
<section class="container my-5">
    <h2>기업 정보</h2>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="placeholder"></div>
                </div>
                <div class="col-md-9">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>기업명:</th>
                            <td>Example Company</td>
                            <th>기업 형태:</th>
                            <td>주식회사</td>
                        </tr>
                        <tr>
                            <th>설립일:</th>
                            <td>2000년 1월 1일</td>
                            <th>대표자:</th>
                            <td>신현준</td>
                        </tr>
                        <tr>
                            <th>주소:</th>
                            <td>광주 대성학원 2F</td>
                            <th>사원 수:</th>
                            <td>500명</td>
                        </tr>
                        <tr>
                            <th>브랜드 명:</th>
                            <td>Example Brand</td>
                            <th>업종:</th>
                            <td>IT</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<!--SWOT card section-->
<section class="container my-5">
    <h2>SWOT 요약</h2>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card text-white">
                <img src="/static/img/S.svg" class="card-img" alt="Strengths Image">
                <div class="card-img-overlay d-flex justify-content-center align-items-center">
                    <h3 class="card-title">Strengths</h3>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-white">
                <img src="/static/img/W.svg" class="card-img" alt="Weaknesses Image">
                <div class="card-img-overlay d-flex justify-content-center align-items-center">
                    <h3 class="card-title">Weaknesses</h3>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-white">
                <img src="/static/img/O.svg" class="card-img" alt="Opportunities Image">
                <div class="card-img-overlay d-flex justify-content-center align-items-center">
                    <h3 class="card-title">Opportunities</h3>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-white">
                <img src="/static/img/T.svg" class="card-img" alt="Threats Image">
                <div class="card-img-overlay d-flex justify-content-center align-items-center">
                    <h3 class="card-title">Threats</h3>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- SWOT 분석 Section -->
<section class="container my-5">
    <div class="row">
        <div class="col-md-12">
            <h2>SWOT 분석</h2>

            <!-- Tabs Navigation -->
            <ul class="nav nav-tabs" id="swotTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="strength-tab" data-bs-toggle="tab"
                            data-bs-target="#strength" type="button" role="tab" aria-controls="strength"
                            aria-selected="true">Strengths
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="weakness-tab" data-bs-toggle="tab" data-bs-target="#weakness"
                            type="button" role="tab" aria-controls="weakness" aria-selected="false">Weaknesses
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="opportunity-tab" data-bs-toggle="tab" data-bs-target="#opportunity"
                            type="button" role="tab" aria-controls="opportunity"
                            aria-selected="false">Opportunities
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="threat-tab" data-bs-toggle="tab" data-bs-target="#threat"
                            type="button" role="tab" aria-controls="threat" aria-selected="false">Threats
                    </button>
                </li>
            </ul>

            <!-- Tabs Content -->
            <div class="tab-content" id="swotTabContent">
                <div class="tab-pane fade show active placeholder" id="strength" role="tabpanel"
                     aria-labelledby="strength-tab">
                    기업 SWOT 세부 내용 작성
                </div>
                <div class="tab-pane fade placeholder" id="weakness" role="tabpanel" aria-labelledby="weakness-tab">
                    SWOT - W
                </div>
                <div class="tab-pane fade placeholder" id="opportunity" role="tabpanel"
                     aria-labelledby="opportunity-tab">
                    SWOT - O
                </div>
                <div class="tab-pane fade placeholder" id="threat" role="tabpanel" aria-labelledby="threat-tab">
                    SWOT - T
                </div>
            </div>
        </div>
    </div>
</section>


<!-- 기업 최신 동향 Section -->
<section class="container my-5">
    <h2>기업 최신 동향</h2>
    <table class="news-table">
        <thead>
        <tr>
            <th>번호</th>
            <th style="width:100px;">이미지</th>
            <th style="width:900px;">제목</th>
            <th>내용</th>
        </tr>
        </thead>
        <tbody id="newsTableBody">
        <!-- 뉴스 데이터가 여기에 동적으로 추가됨 -->
        </tbody>
    </table>
</section>
<script>
    $(document).ready(function() {
        // 검색 버튼 클릭 시 뉴스 데이터 가져오기
        $('.btn-dark').click(function() {
            const corpName = $('input.form-control').val();
            if (corpName) {
                fetchNews(corpName);
            }
        });

        function fetchNews(corpName) {
            $.ajax({
                url: '/api/news',
                method: 'GET',
                data: { corpName: corpName },
                success: function(articles) {
                    updateNewsTable(articles);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching news:', error);
                }
            });
        }

        function updateNewsTable(articles) {
            const tbody = $('#newsTableBody');
            tbody.empty();

            articles.forEach((article, index) => {
                const row = `
                <tr>
                    <td>${index + 1}</td>
                    <td>
                        <a href="${article.url}" target="_blank">
                            <img src="${article.urlToImage || '/resources/static/img/no-image.png'}"
                                 alt="뉴스 이미지" style="width:100px;">
                        </a>
                    </td>
                    <td style="text-align:left">
                        <a href="${article.url}" target="_blank">
                            <p>${article.title}</p>
                        </a>
                        <span>${article.description || ''}</span>
                    </td>
                    <td>${article.publishedAt.substring(0, 10)}</td>
                </tr>
            `;
                tbody.append(row);
            });
        }
    });
</script>
</body>

</html>