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
                        2024년 상반기
                    </span>
                <span class="tag">
                        <i class="fas fa-laptop-code"></i>
                        백엔드개발자
                    </span>
                <span class="tag">
                        <i class="fas fa-user-graduate"></i>
                        신입
                    </span>
                <span class="tag">
                        <i class="far fa-eye"></i>
                        3,464
                    </span>
            </div>
            <h1 class="interview-title">(주)네이버 - 백엔드개발자</h1>
        </div>

        <div class="question-container">
            <div class="question-block">
                <div class="question">
                    <span class="question-number">1</span>
                    면접은 어디에서, 몇 시에 보셨습니까?
                </div>
                <div class="answer">
                    강남 본사에서 오후 2시에 면접을 보았습니다. 지하철 2호선 강남역에서 도보 5분 거리에 위치해 있었고,
                    면접 시작 30분 전에 도착하여 대기실에서 담당자분께서 안내해 주셨습니다.
                </div>
            </div>

            <div class="question-block">
                <div class="question">
                    <span class="question-number">2</span>
                    면접관 및 지원자는 몇 명이었습니까?
                </div>
                <div class="answer">
                    면접관 4명, 지원자 1명으로 진행되었습니다.
                    면접관분들은 개발팀 리더 1명, 시니어 개발자 2명, HR 담당자 1명으로 구성되어 있었습니다.
                </div>
            </div>

            <div class="question-block">
                <div class="question">
                    <span class="question-number">3</span>
                    면접 진행방식에 대해 설명해주세요.
                </div>
                <div class="answer">
                    전체 면접은 약 1시간 정도 소요되었습니다.
                    먼저 자기소개를 하고, 이력서 기반 프로젝트 질문이 30분,
                    기술 질문이 20분, 마지막으로 회사 관련 질문이 10분 정도 진행되었습니다.
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