<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>기업 분석</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
    <link rel="stylesheet" href="/static/cor_analysis.css">
</head>

<body>

<!-- Search Section -->
<section class="search-section bg-secondary text-white">
    <div class="container">
        <h1>기업 분석</h1>
        <p>원하는 기업 분석을 한 눈에 기업 SWOT 레포트를 제공해요.</p>
        <form action="/news" method="get">  <!-- form 추가 -->
            <div class="input-group mb-3 w-50 mx-auto">
                <input type="text" class="form-control" placeholder="기업명을 입력하세요" aria-label="Search" name="corp" required/>
                <button class="btn btn-dark" type="submit">Search</button>
            </div>
        </form>
    </div>
</section>

<!-- 기업 정보 Section -->
<section class="container my-5">
    <h2>기업 정보</h2>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="placeholder">기업 로고</div>
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

<!-- SWOT 분석 Section -->
<section class="container my-5">
    <div class="row">
        <div class="col-md-12">
            <h2>SWOT 분석</h2>

            <!-- Tabs Navigation -->
            <ul class="nav nav-tabs" id="swotTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="strength-tab" data-bs-toggle="tab" data-bs-target="#strength"
                            type="button" role="tab" aria-controls="strength" aria-selected="true">Strengths</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="weakness-tab" data-bs-toggle="tab" data-bs-target="#weakness" type="button"
                            role="tab" aria-controls="weakness" aria-selected="false">Weaknesses</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="opportunity-tab" data-bs-toggle="tab" data-bs-target="#opportunity"
                            type="button" role="tab" aria-controls="opportunity" aria-selected="false">Opportunities</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="threat-tab" data-bs-toggle="tab" data-bs-target="#threat" type="button"
                            role="tab" aria-controls="threat" aria-selected="false">Threats</button>
                </li>
            </ul>

            <!-- Tabs Content -->
            <div class="tab-content" id="swotTabContent">
                <div class="tab-pane fade show active placeholder" id="strength" role="tabpanel"
                     aria-labelledby="strength-tab">
                    SWOT - S
                </div>
                <div class="tab-pane fade placeholder" id="weakness" role="tabpanel" aria-labelledby="weakness-tab">
                    SWOT - W
                </div>
                <div class="tab-pane fade placeholder" id="opportunity" role="tabpanel" aria-labelledby="opportunity-tab">
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
        <tr >
            <th>번호</th>
            <th style="width:100px;">이미지</th>
            <th style="width:900px;">제목</th>  <!-- 뉴스 제목--> <!-- 클릭하면 뉴스 url로-->
            <th>내용</th>  <!-- 뉴스 설명-->
        </tr>
        </thead>
        <tbody>
        {% for article in articles %}
        <tr>
            <td>{{ loop.index }}</td>  <!-- loop.index를 사용 -->
            <td>
                <a href="{{ article.url }}" target="_blank"><img src="{{ article.image_url }}" alt="뉴스 이미지"></a>
            </td>
            <td style="text-align:left"><a href="{{ article.url }}" target="_blank"><p>{{ article.title }}</p></a>
                <span> {{article.description}} </span></td>
            <td>{{ article.date}}</td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</section>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>