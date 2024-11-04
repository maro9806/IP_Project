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
    <link rel="stylesheet" href="<c:url value='/resources/static/interviewcomment.css'/>">
</head>
    <body>
    <jsp:include page="../navbar.jsp" />
    <!-- Main Content -->
    <div class="main-content">
        <div class="viewer-wrapper">
            <div class="metadata-header">
                <div class="metadata-bar">
                    <span>2024년 상반기</span>
                    <span>백엔드개발자</span>
                    <span>신입</span>
                    <span>조회수 3,464</span>
                </div>
                <h1 class="article-title">(주)네이버 - 백엔드개발자</h1>
            </div>

            <div class="content-section">
                <div class="question-section">
                    <div class="question">
                        <span class="question-number">1.</span>
                        면접은 어디에서, 몇 시에 보셨습니까?
                    </div>
                    <div class="answer">
                        강남 본사에서 오후 2시에 면접을 보았습니다. 지하철 2호선 강남역에서 도보 5분 거리에 위치해 있었고,
                        면접 시작 30분 전에 도착하여 대기실에서 담당자분께서 안내해 주셨습니다.
                    </div>
                </div>

                <div class="question-section">
                    <div class="question">
                        <span class="question-number">2.</span>
                        면접관 및 지원자는 몇 명이었습니까?
                    </div>
                    <div class="answer">
                        면접관 4명, 지원자 1명으로 진행되었습니다.
                        면접관분들은 개발팀 리더 1명, 시니어 개발자 2명, HR 담당자 1명으로 구성되어 있었습니다.
                    </div>
                </div>

                <div class="question-section">
                    <div class="question">
                        <span class="question-number">3.</span>
                        면접 진행방식에 대해 설명해주세요.
                    </div>
                    <div class="answer">
                        전체 면접은 약 1시간 정도 소요되었습니다.
                        먼저 자기소개를 하고, 이력서 기반 프로젝트 질문이 30분,
                        기술 질문이 20분, 마지막으로 회사 관련 질문이 10분 정도 진행되었습니다.
                    </div>
                </div>
            </div>

            <div class="comments-section">
                <div class="comments-header">
                    <h2 class="comments-title">댓글 <span class="comment-count">2</span></h2>
                </div>

                <div class="comment-form">
                    <textarea class="comment-input" placeholder="댓글을 작성하세요..."></textarea>
                    <button class="submit-comment">등록</button>
                </div>

                <div class="comment">
                    <div class="comment-header">
                        <span class="commenter">김개발</span>
                        <span class="comment-date">2024.03.15</span>
                    </div>
                    <div class="comment-text">
                        상세한 후기 감사합니다! 저도 다음 주에 면접 볼 예정인데 많은 도움이 되었습니다.
                    </div>
                    <div class="comment-actions">
                        <span class="comment-action">답글</span>
                        <span class="comment-action">수정</span>
                        <span class="comment-action">삭제</span>
                    </div>
                </div>

                <div class="comment">
                    <div class="comment-header">
                        <span class="commenter">이코딩</span>
                        <span class="comment-date">2024.03.14</span>
                    </div>
                    <div class="comment-text">
                        기술 면접 질문들도 자세히 공유해주시면 감사하겠습니다!
                    </div>
                    <div class="comment-actions">
                        <span class="comment-action">답글</span>
                        <span class="comment-action">수정</span>
                        <span class="comment-action">삭제</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize with first block
            addBlock('text');
        });

        function addBlock(type = 'text', insertAfter = null) {
            const block = document.createElement('div');
            block.className = 'content-block';

            const input = document.createElement('input');
            input.type = 'text';
            input.className = `block-input ${type}`;
            input.placeholder = type === 'text' ? 'Start typing...' : 'Heading';

            block.appendChild(input);

            if (insertAfter) {
                insertAfter.parentNode.insertBefore(block, insertAfter.nextSibling);
            } else {
                document.getElementById('blocks-container').appendChild(block);
            }

            setupBlockEvents(block);
            input.focus();
        }

        function setupBlockEvents(block) {
            const input = block.querySelector('.block-input');

            input.addEventListener('keydown', (e) => {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    addBlock('text', block);
                } else if (e.key === 'Backspace' && input.value === '') {
                    const blocks = document.querySelectorAll('.content-block');
                    if (blocks.length > 1) {
                        e.preventDefault();
                        const prevBlock = block.previousElementSibling;
                        if (prevBlock) {
                            prevBlock.querySelector('.block-input').focus();
                            block.remove();
                        }
                    }
                }
            });
        }

        // Auto-save functionality
        let autoSaveTimeout;
        function autoSave() {
            clearTimeout(autoSaveTimeout);
            autoSaveTimeout = setTimeout(() => {
                const blocks = Array.from(document.querySelectorAll('.content-block')).map(block => {
                    const input = block.querySelector('.block-input');
                    return {
                        type: Array.from(input.classList)
                            .find(cls => cls !== 'block-input'),
                        content: input.value
                    };
                });

                const title = document.querySelector('.page-title').value;
                const subject = document.querySelector('.subject-select').value;
                const data = {
                    title,
                    subject,
                    blocks
                };

                localStorage.setItem('notion-editor-content', JSON.stringify(data));
            }, 1000);
        }

        // Add auto-save listener to all inputs
        document.addEventListener('input', autoSave);

        // Load saved content on page load
        document.addEventListener('DOMContentLoaded', () => {
            const saved = localStorage.getItem('notion-editor-content');
            if (saved) {
                const data = JSON.parse(saved);
                document.querySelector('.page-title').value = data.title;
                document.querySelector('.subject-select').value = data.subject;

                document.getElementById('blocks-container').innerHTML = '';
                data.blocks.forEach(block => {
                    addBlock(block.type);
                    const lastInput = document.querySelector('.content-block:last-child .block-input');
                    lastInput.value = block.content;
                });
            }
        });
    </script>

    </body>
</html>
