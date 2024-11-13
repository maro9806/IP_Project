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
	<link rel="stylesheet" href="<c:url value='/resources/static/review_board/review_view.css'/>">
</head>
<body>
<jsp:include page="../navbar.jsp" />

<div class="main-content">
	<div class="nav-actions">
		<a href="javascript:history.back()" class="back-button">
			<i class="fas fa-arrow-left"></i>
			뒤로가기
		</a>
		<div class="action-buttons">
			<c:if test="${reviewDto.member.username eq pageContext.request.userPrincipal.name}">
				<button onclick="location.href='/review_board/edit/${reviewDto.reviewIdx}'" class="action-button edit-button">
					<i class="fas fa-edit"></i>
					수정하기
				</button>
				<button onclick="showDeleteConfirm()" class="action-button delete-button">
					<i class="fas fa-trash"></i>
					삭제하기
				</button>
			</c:if>
		</div>
	</div>
	
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
			<h1 class="interview-title">${reviewDto.reviewTitle}</h1>
			<div class="interview-meta">
				<span class="author">${reviewDto.member.username}</span>
				<span class="date">${reviewDto.formattedReviewDate}</span>
				<span class="views">조회수: ${reviewDto.count}</span>
			</div>
		</div>
		
		<div class="format-toggle">
			<button type="button" class="toggle-btn active" data-format="free">자유 양식</button>
			<button type="button" class="toggle-btn" data-format="qa">질문-답변</button>
		</div>
		
		<!-- 자유 양식 섹션 -->
		<div id="free-format" class="question-container active">
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
		
		<!-- 질문-답변 섹션 (더미 데이터 DTO 연결 필요) -->
		<div id="qa-format" class="question-container">
			<!-- 질문 1 -->
			<div class="question-block">
				<div class="question">
					<span class="question-number">1</span>
					자기소개 해주세요.
				</div>
				<div class="answer">
					안녕하세요. 저는 3년차 백엔드 개발자입니다. 주로 Spring Boot를 사용하여 웹 애플리케이션을 개발해왔으며...
				</div>
			</div>
			
			<!-- 질문 2 -->
			<div class="question-block">
				<div class="question">
					<span class="question-number">2</span>
					지원동기가 무엇인가요?
				</div>
				<div class="answer">
					귀사의 혁신적인 기술 스택과 개발 문화에 깊은 인상을 받았습니다. 특히 마이크로서비스 아키텍처를 도입하여...
				</div>
			</div>
			
			<!-- 질문 3 -->
			<div class="question-block">
				<div class="question">
					<span class="question-number">3</span>
					기술적으로 어려웠던 경험이 있다면?
				</div>
				<div class="answer">
					이전 프로젝트에서 대용량 트래픽 처리 문제가 있었습니다. 캐싱 전략을 도입하고 성능 최적화를 통해...
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
    document.addEventListener('DOMContentLoaded', function() {
        const toggleBtns = document.querySelectorAll('.toggle-btn');
        const freeFormat = document.getElementById('free-format');
        const qaFormat = document.getElementById('qa-format');

        toggleBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                // 모든 버튼의 활성화 클래스 제거
                toggleBtns.forEach(b => b.classList.remove('active'));
                // 현재 클릭된 버튼 활성화
                this.classList.add('active');

                const format = this.dataset.format;
                if (format === 'free') {
                    freeFormat.classList.add('active');
                    qaFormat.classList.remove('active');
                } else {
                    freeFormat.classList.remove('active');
                    qaFormat.classList.add('active');
                }
            });
        });
    });

    function showDeleteConfirm() {
        document.getElementById('deleteModal').style.display = 'flex';
    }

    function hideDeleteConfirm() {
        document.getElementById('deleteModal').style.display = 'none';
    }

    function deletePost() {
        const postId = ${reviewDto.reviewIdx};

        fetch(`/review_board/delete/${postId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            }
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = '/review_board/review_list';
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