<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<title>기업 분석 메인</title>
<link rel="stylesheet" href="<c:url value='/resources/static/corpmain.css'/>">

<jsp:include page="../navbar.jsp"/>

<div class="main-content">
    <div class="jumbotron p-5 rounded">
        <h1 class="display-4">기업 분석</h1>
        <p class="lead">AI가 분석해주는 SWOT · 최신 동향</p>
        <hr class="my-4">
        <div class="input-group mb-0 w-50 mx-auto">
            <input type="text" class="form-control" placeholder="기업명을 입력하세요" aria-label="Search" name="corp"
                   id="corpInput" required
                   value="${param.corp}"/>
            <button class="btn btn-toolbar btn-dark" id="searchButton" type="button">Search</button>
        </div>
    </div>
    <div class="container mt-4">

        <div class="row row-cols-1 row-cols-md-5 g-4">
            <c:forEach var="vo" items="${list}" varStatus="i">
                <a href="<c:url value='${pageContext.request.contextPath}/company/corp?companyIdx=${vo.companyIdx}&corp=${vo.companyName}'/>"
                   class="text-decoration-none">
                    <div class="col">
                        <div class="card h-100">
                            <img src="<c:url value='/resources/static/img/${vo.img}'/>" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${vo.companyName}</h5>
                                <p class="card-text1">${vo.companyType}</p>
                                <p class="card-text2">${vo.companyIndustry}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        <hr>
    </div>
</div>

<%@ include file="../footer.jsp" %>
