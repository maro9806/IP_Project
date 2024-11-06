<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<head>
    <title>기업 분석</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/navbar.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/corp.css'/>">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<div class="main-content">
    <!-- Jumbotron -->
    <div class="jumbotron p-5 rounded">
        <h1 class="display-4">기업 분석</h1>
        <p class="lead">원하는 기업 분석을 한 눈에 기업 SWOT 레포트를 제공해요.</p>
        <hr class="my-4">
        <div class="input-group mb-0 w-50 mx-auto">
            <input type="text" class="form-control" placeholder="기업명을 입력하세요" aria-label="Search" name="corp" id="corpInput" required
                   value="${param.corp}"/>
            <button class="btn btn-toolbar btn-dark" id="searchButton" type="button">Search</button>
        </div>
    </div>

    <!-- 기업 정보 Section -->
    <section class="container my-5">
        <%--        <h2>기업 정보</h2>--%>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <a id="infoimg">
                            <img src="<c:url value='/resources/static/img/${board.img}'/>" class="img-fluid">
                        </a>
                    </div>
                    <div class="col-md-9">
                        <table class="table">
                            <colgroup>

                            </colgroup>
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
                                <th>인재상:</th>
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


    <!-- 기업 최신 동향 Section -->
    <section class="container my-5">
        <h4>최신 동향</h4>
        <table class="news-table">
            <thead>
            <tr>
                <th>번호</th>
                <th style="width:100px;">이미지</th>
                <th style="width:900px;">제목</th> <!-- 뉴스 제목--> <!-- 클릭하면 뉴스 url로-->
                <th>내용</th> <!-- 뉴스 설명-->
            </tr>
            </thead>
            <tbody id="newsTableBody">

            </tbody>
        </table>
    </section>
</div>

<%@ include file="../footer.jsp" %>

<script>
    $(document).ready(function() {
        // 페이지가 로드된 후 AJAX 요청을 직접 호출
        const corpName = $('#corpInput').val();
        if (corpName) {
            fetchNews(corpName); // 기업명으로 뉴스 가져오기
        }

        $('#searchButton').click(function() {
            const corpName = $('#corpInput').val();
            if (corpName) {
                fetchNews(corpName); // 기업명으로 뉴스 가져오기
            } else {
                alert('기업명을 입력하세요.');
            }
        });

        // 뉴스 가져오는 함수
        function fetchNews(corpName) {
            $.ajax({
                url: 'http://127.0.0.1:5000/news', // Flask API 엔드포인트
                method: 'GET',
                data: { corp: corpName },
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    // 이전의 테이블 내용을 지우기
                    $('#newsTableBody').empty();

                    // 데이터가 존재하면 테이블에 추가
                    if (data && data.articles) {
                        $.each(data.articles, function(index, article) {
                            const row = '<tr><td>' + (parseInt(index) + 1) +
                                '</td><td><a href="' + article.url + '" target="_blank">' +
                                '<img src="' + article.image_url + '" alt="뉴스 이미지"></a></td>' +
                                '<td style="text-align:left">' +
                                '<a href="' + article.url + '" target="_blank">' +
                                '<p>' + article.title + '</p></a>' +
                                '<span>' + article.description + '</span></td>' +
                                '<td>' + article.date + '</td></tr>';

                            $('#newsTableBody').append(row);
                        });
                    } else {
                        $('#newsTableBody').append('<tr><td colspan="4">No articles found.</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 요청 실패 from Flask:', error);
                }
            });
        }
    });
</script>

</body>
