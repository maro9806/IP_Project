<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>


<title>기업 분석</title>
<link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/static/corp.css'/>">

<jsp:include page="../navbar.jsp"/>

<div class="main-content">
    <!-- Jumbotron -->
    <div class="jumbotron p-5 rounded">
        <h1 class="display-4">기업 분석</h1>
        <p class="lead">원하는 기업 분석을 한 눈에 기업 SWOT 레포트를 제공해요.</p>
        <hr class="my-4">
        <div class="input-group mb-3 w-50 mx-auto">
            <input type="text" class="form-control" placeholder="기업명을 입력하세요" aria-label="Search" />
            <button class="btn btn-toolbar btn-outline-" type="button">Search</button>
        </div>
    </div>

    <!-- 기업 정보 Section -->
    <section class="container my-5">
        <h2>기업 정보</h2>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <a id="infoimg">
                                <img src="/static/img/naver.svg" alt="Company Logo" class="img-fluid">
                            </a>
                        </div>
                        <div class="col-md-9">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>기업명:</th>
                                        <td>${board.companyName}</td>
                                        <th>기업 형태:</th>
                                        <td>${board.companyType}</td>
                                    </tr>
                                    <tr>
                                        <th>설립일:</th>
                                        <td>
                                            ${fn:replace(board.companyHistory, "\\n", "<br>")}
                                        </td>


                                        <th>대표자:</th>
                                        <td>${board.companyCeo}</td>
                                    </tr>
                                    <tr>
                                        <th>주소:</th>
                                        <td>${board.companyAddress}</td>
                                        <th>사원 수:</th>
                                        <td>${board.companyEmployees}명</td>
                                    </tr>
                                    <tr>
                                        <th>브랜드 명:</th>
                                        <td>
                                            ${fn:replace(board.companyContent, "\\n", "<br>")}
                                        </td>
                                        <th>업종:</th>
                                        <td>
                                            ${fn:replace(board.companyHistory, "\\n", "<br>")}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <!-- SWOT card section -->
    <section class="container my-5">
        <div class="row text-center">
            <!-- Strengths Card -->
                <div class="col-md-3 mb-4">
                    <div class="card swot-card" id="S">
                        <div class="card-body">
                            <h1 class="swot-letter swot-letter-S">S</h1>
                            <h5 class="card-title">Strengths</h5>
                            <ul class="card-text">
                                <li>${fn:replace(swot.strength, "\\n", "<br>")}</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Weaknesses Card -->
                <div class="col-md-3 mb-4">
                    <div class="card swot-card" id="W">
                        <div class="card-body">
                            <h1 class="swot-letter swot-letter-W">W</h1>
                            <h5 class="card-title">Weaknesses</h5>
                            <ul class="card-text">
                                ${fn:replace(swot.weakness, "\\n", "<br>")}
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Opportunities Card -->
                <div class="col-md-3 mb-4">
                    <div class="card swot-card" id="O">
                        <div class="card-body">
                            <h1 class="swot-letter swot-letter-O">O</h1>
                            <h5 class="card-title">Opportunities</h5>
                            <ul class="card-text">
                                ${fn:replace(swot.opportunity, "\\n", "<br>")}
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Threats Card -->
                <div class="col-md-3 mb-4">
                    <div class="card swot-card" id="T">
                        <div class="card-body">
                            <h1 class="swot-letter swot-letter-T">T</h1>
                            <h5 class="card-title">Threats</h5>
                            <ul class="card-text">
                                ${fn:replace(swot.threat, "\\n", "<br>")}
                            </ul>
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
                                aria-selected="true">Strengths</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="weakness-tab" data-bs-toggle="tab" data-bs-target="#weakness"
                                type="button" role="tab" aria-controls="weakness"
                                aria-selected="false">Weaknesses</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="opportunity-tab" data-bs-toggle="tab"
                                data-bs-target="#opportunity" type="button" role="tab" aria-controls="opportunity"
                                aria-selected="false">Opportunities</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="threat-tab" data-bs-toggle="tab" data-bs-target="#threat"
                                type="button" role="tab" aria-controls="threat" aria-selected="false">Threats</button>
                        </li>
                    </ul>

                    <!-- Tabs Content -->
                    <div class="tab-content" id="swotTabContent">
                        <div class="tab-pane fade show active placeholder" id="strength" role="tabpanel"
                            aria-labelledby="strength-tab">
                            기업 SWOT 세부 내용 작성
                        </div>
                        <div class="tab-pane fade placeholder" id="weakness" role="tabpanel"
                            aria-labelledby="weakness-tab">
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
                        <th style="width:900px;">제목</th> <!-- 뉴스 제목--> <!-- 클릭하면 뉴스 url로-->
                        <th>내용</th> <!-- 뉴스 설명-->
                    </tr>
                </thead>
                <tbody>
                    {% for article in articles %}
                    <tr>
                        <td>{{ loop.index }}</td> <!-- loop.index를 사용 -->
                        <td>
                            <a href="{{ article.url }}" target="_blank"><img src="{{ article.image_url }}"
                                    alt="뉴스 이미지"></a>
                        </td>
                        <td style="text-align:left"><a href="{{ article.url }}" target="_blank">
                                <p>{{ article.title }}</p>
                            </a>
                            <span> {{article.description}} </span>
                        </td>
                        <td>{{ article.date}}</td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
    </section>
</div>

<%@ include file="../footer.jsp" %>

<script>
    // jQuery 스크립트 내용 유지
</script>