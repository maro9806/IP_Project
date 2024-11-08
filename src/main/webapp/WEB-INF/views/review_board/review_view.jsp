<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>면접 후기</title>
    <%@ include file="../header.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/static/review_view.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp" />

<div class="main-content">
    <!-- Navigation and Action Buttons -->
    <div class="nav-actions">
        <a href="javascript:history.back()" class="back-button">
            <i class="fas fa-arrow-left"></i>
            뒤로가기
        </a>
        <div class="action-buttons">
            <button onclick="location.href='edit?id=${interview.id}'" class="action-button edit-button">
                <i class="fas fa-edit"></i>
                수정하기
            </button>
            <button onclick="showDeleteConfirm()" class="action-button delete-button">
                <i class="fas fa-trash"></i>
                삭제하기
            </button>
        </div>
    </div>

    <!-- Interview Content -->
    <div class="interview-card">
        <div class="interview-header">
            <div class="metadata-tags">
                 <span class="tag">
                        <i class="far fa-calendar"></i>
                        ${reviewDto.period}
                    </span>
                <span class="tag">
                        <i class="fas fa-laptop-code"></i>
                        ${reviewDto.reviewPosition}
                    </span>
                <button type="button" class="result-tag">
                    <c:set var="resultClass" value="" />
                    <c:choose>
                    <c:when test="${reviewDto.result == '합격'}">
                        <c:set var="resultClass" value="pass" />
                    </c:when>
                    <c:when test="${reviewDto.result == '불합격'}">
                        <c:set var="resultClass" value="fail" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="resultClass" value="pending" />
                    </c:otherwise>
                    </c:choose>
                    <button type="button" class="result-tag ${resultClass}">
                        ${reviewDto.result}
                    </button>

            </div>
            <h1 class="interview-title">${reviewDto.reviewCompany} - ${reviewDto.reviewPosition}</h1>
        </div>

        <div class="question-container">
            <div class="question-block">
                <div class="question">
                    <span class="question-number">1</span>
                    면접 분위기나 진행방식은 어떠했습니까?
                </div>
                <div class="answer">
                    ${reviewDto.atmosphere}
                </div>
            </div>

            <div class="question-block">
                <div class="question">
                    <span class="question-number">2</span>
                    면접에서 좋았던 점이나 아쉬웠던 점은 무엇입니까?
                </div>
                <div class="answer">
                    ${reviewDto.sorrow}
                </div>
            </div>

            <div class="question-block">
                <div class="question">
                    <span class="question-number">3</span>
                    면접 합격 팁이나 조언이 있다면?
                </div>
                <div class="answer">
                    ${reviewDto.advice}
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">게시글 삭제</h3>
        </div>
        <div class="modal-body">
            정말로 이 게시글을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
        </div>
        <div class="modal-actions">
            <button onclick="hideDeleteConfirm()" class="modal-button modal-cancel">취소</button>
            <button onclick="deletePost()" class="modal-button modal-confirm">삭제</button>
        </div>
    </div>
</div>

<script>
    function showDeleteConfirm() {
        document.getElementById('deleteModal').style.display = 'flex';
    }

    function hideDeleteConfirm() {
        document.getElementById('deleteModal').style.display = 'none';
    }

    function deletePost() {
        const postId = '${interview.id}';

        fetch(`/api/interviews/${postId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            }
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = '/interviews';
                } else {
                    alert('삭제 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 중 오류가 발생했습니다.');
            });
    }

    window.onclick = function(event) {
        const modal = document.getElementById('deleteModal');
        if (event.target == modal) {
            hideDeleteConfirm();
        }
    }
</script>
</body>
</html>