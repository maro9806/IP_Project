<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Interview Setup</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/aiboard/ai_preparation.css">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<!-- Interview Setup Section -->
<div id="setupSection" class="main-content">
	<div class="container-fluid">
		<div class="camera-card d-flex">
			<!-- Left section: Video -->
			<div class="col-7 pe-4">
				<div class="video-section">
					<div class="setup-header">
						<h5>면접 환경 설정</h5>
						<p><sec:authentication property="principal.member.name"/>님 영상 면접을 진행할 자기소개서와 질문을 선택해주세요.</p>
					</div>
					<div class="video-container bv">
						<!-- Video placeholder -->
					</div>
					<div id="setupVideoError-1" class="video-error" style="display: none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
							<circle cx="12" cy="12" r="10"></circle>
							<line x1="12" y1="8" x2="12" y2="12"></line>
							<line x1="12" y1="16" x2="12" y2="16"></line>
						</svg>
						카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
					</div>
				</div>
			</div>
			<!-- Right section: Settings -->
			<div class="col-5">
				<div class="form-section">
					<div class="mb-4">
						<div id="selectedSelfIntroduction">
							<label class="form-label mb-2"><strong>자기소개서</strong></label>
							<input id="coverLetter" readonly class="form-control mb-3" value="-"/>
							<button id="loadModalBtn" class="btn btn-load w-100">
								자기소개서 불러오기
							</button>
						</div>
					</div>
					<button class="btn btn-start w-100" onclick="startInterview()">
						면접 시작하기
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Question Section -->
<div id="questionSection" class="main-content hidden">
	<div class="container-fluid">
		<div class="camera-card">
			<!-- Left section: Video -->
			<div class="video-column">
				<div class="video-area">
					<div class="question-header">
						<h5>면접 질문</h5>
						<div class="current-question">
							<p class="question-number"><strong>Question 1</strong></p>
							<p class="question-content">회사를 선택한 이유는 무엇인가요?</p>
						</div>
					</div>
					<div class="video-container">
						<!-- Video placeholder -->
						<div id="interviewRecordingIndicator-2" class="recording-indicator" style="display: none;">
							<span class="recording-dot"></span>
							녹화중
						</div>
					</div>
					<div id="interviewVideoError-2" class="video-error" style="display: none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
							<circle cx="12" cy="12" r="10"></circle>
							<line x1="12" y1="8" x2="12" y2="12"></line>
							<line x1="12" y1="16" x2="12" y2="16"></line>
						</svg>
						카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
					</div>
					<div class="recording-controls">
						<button id="interviewStartButton" onclick="startRecording()" class="btn-record start">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
								<circle cx="12" cy="12" r="10"></circle>
								<circle cx="12" cy="12" r="3"></circle>
							</svg>
							녹화 시작
						</button>
						<button id="interviewStopButton" onclick="stopRecording()" class="btn-record stop" disabled>
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
								<rect x="6" y="6" width="12" height="12"></rect>
							</svg>
							녹화 종료
						</button>
					</div>
				</div>
			</div>

			<!-- Right section: Transcript -->
			<div class="transcript-column">
				<div class="transcript-section">
					<div class="transcript-header">
						<h6 class="mb-0"><strong>답변 기록</strong></h6>
					</div>
					<div class="transcript-list">
						<div class="transcript-list">
							<div class="transcript-item" data-listener-added="false">
								<p class="transcript-question">Q1. 회사를 선택한 이유는 무엇인가요?</p>
								<p class="transcript-answer">귀사의 혁신적인 기술력과 글로벌 시장에서의 성장 가능성에 매력을 느꼈습니다. 특히 AI 기술을 활용한 서비스 개발에 중점을 두고 있는 점이 제 경력 목표와 잘 맞았습니다.</p>
							</div>
						<div class="transcript-item">
							<p class="transcript-question">Q2. 직무와 관련된 경험을 설명해주세요.</p>
							<p class="transcript-answer">대학 시절 프로젝트에서 팀 리더를 맡아.</p>
						</div>
						<div class="transcript-item">
							<p class="transcript-question">Q3. 향후 커리어 계획은 무엇인가요?</p>
							<p class="transcript-answer">전문성을 키워 프로젝트 매니저로 성장하고 싶습니다.</p>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Ending Section  -->
<div id="endingSection" class="Ending hidden">
	<div class="container d-flex justify-content-center align-items-center vh-100">
		<div class="col center-text text-center">
			<Strong><p> 수고하셨습니다</p>
				<p>모든 답변이 완료 되었습니다.</p></Strong>
			<div class="endingbtn">
				<button class="btn btn-dark w-25 mt-3">면접 종료</button>
			</div>
		</div>
	</div>
</div>

<!-- 불러오기 모달 창 -->
<div id="loadModal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<h5><strong>자기소개서 불러오기</strong></h5>
		<p>영상 면접을 진행할 자기소개서를 선택하세요</p>
		<div id="noSelfBoardMessage" style="display: ${empty selfBoards ? 'block' : 'none'};">
			<div class="card">
				<div class="card-body d-flex justify-content-center align-items-center"
				     style="height: 100px;border: 1px solid #616161;border-radius: 8px;">
					<p class="mb-0">저장한 자기소개서 내역이 없습니다.</p>
				</div>
			</div>
		</div>
		<ul style="list-style: none; padding: 0;">
			<c:forEach items="${selfBoards}" var="selfBoard">
				<li onclick="loadSelfIntroduction(${selfBoard.selfIdx})"
				    class="btn btn-outline-dark mb-2 text-start" style="width: 100%;">
					<div>
						<small>${fn:substring(selfBoard.selfDate, 0, 10)} ${fn:substring(selfBoard.selfDate, 11, 16)}</small>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/><br>
						<strong><c:out value="${selfBoard.selfCompany}"/></strong>
						<strong>${selfBoard.selfPosition}</strong><br>
						<span>${selfBoard.selfTitle}</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<script>
    let currentInterviewId = null;
    let mediaRecorder;
    let recordedChunks = [];

    async function startInterview() {
        try {
            // 자기소개서가 선택되었는지 확인
            const selfIntroDiv = document.getElementById('selectedSelfIntroduction');
            const formControl = selfIntroDiv.querySelector('.form-control');

            if (!formControl || formControl.textContent.trim() === '-') {
                alert('자기소개서를 선택해주세요.');
                return;
            }

            // 선택된 질문들을 배열로 가져오기
            const selectedQuestions = Array.from(document.querySelectorAll('input[name="selectedQuestions"]:checked'))
                .map((checkbox, index) => ({
                    content: checkbox.value,
                    orderNumber: index + 1
                }));

            // 질문 선택 검증
            if (selectedQuestions.length === 0) {
                alert('최소 1개의 질문을 선택해주세요.');
                return;
            }
            if (selectedQuestions.length > 6) {
                alert('최대 6개의 질문만 선택할 수 있습니다.');
                return;
            }

            // 요청 데이터 구성
            const requestData = {
                username: null,
                position: selectedPosition,
                questions: selectedQuestions,
                interviewDate: new Date().toISOString(),
                videoStatus: null,
                videoUrl: null,
                memberId: null
            };

            const response = await fetch('/aiboard/api/interview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData)
            });

            if (!response.ok) {
                const errorText = await response.text();
                console.error('Server response:', errorText);
                throw new Error('면접 시작에 실패했습니다. Status: ' + response.status);
            }

            const data = await response.json();
            currentInterviewId = data.id;

            // 화면 전환
            document.getElementById('setupSection').classList.add('hidden');
            document.getElementById('questionSection').classList.remove('hidden');

            // 여기서부터 수정된 코드
            const questionHeader = document.querySelector('.question-header');

            // 기존 내용을 지우고 새로운 내용으로 대체
            questionHeader.innerHTML = '<h5>면접 질문</h5>' +
                '<div class="current-question">' +
                '<p class="question-number"><strong>Question 1</strong></p>' +
                '<p class="question-content">' + selectedQuestions[0].content + '</p>' +
                '</div>';

            // 비디오 녹화 시작
            await startVideoRecording();

        } catch (error) {
            console.error('Interview start error:', error);
            alert(error.message);
        }
    }

    async function startVideoRecording() {
        try {
            const stream = await navigator.mediaDevices.getUserMedia({
                video: true,
                audio: true
            });

            const videoElement = document.createElement('video');
            videoElement.srcObject = stream;
            videoElement.autoplay = true;
            videoElement.playsInline = true;
            videoElement.style.width = '100%';
            videoElement.style.height = '100%';

            const container = document.querySelector('#questionSection .video-container');
            container.innerHTML = '';
            container.appendChild(videoElement);

            mediaRecorder = new MediaRecorder(stream, {
                mimeType: 'video/webm;codecs=vp8,opus'
            });

            mediaRecorder.ondataavailable = (event) => {
                if (event.data && event.data.size > 0) {
                    recordedChunks.push(event.data);
                }
            };

            console.log('MediaRecorder 설정 완료');

        } catch (error) {
            console.error('카메라 설정 오류:', error);
            handleCameraError(error, 'question');
            throw error;
        }
    }

    async function finishInterview() {
        try {
            if (!mediaRecorder || mediaRecorder.state !== 'recording') {
                throw new Error('녹화가 진행 중이지 않습니다.');
            }

            await new Promise((resolve, reject) => {
                mediaRecorder.onstop = async () => {
                    try {
                        const token = document.querySelector("meta[name='_csrf']").content;
                        const header = document.querySelector("meta[name='_csrf_header']").content;

                        const blob = new Blob(recordedChunks, {type: 'video/webm'});
                        const formData = new FormData();
                        formData.append('video', blob);

                        const response = await fetch(`/aiboard/api/interview/${currentInterviewId}/video`, {
                            method: 'POST',
                            headers: {
                                [header]: token
                            },
                            body: formData
                        });

                        if (!response.ok) {
                            throw new Error('비디오 제출에 실패했습니다.');
                        }

                        resolve();
                    } catch (error) {
                        reject(error);
                    }
                };
                mediaRecorder.stop();
            });

            // 화면 전환
            document.getElementById('questionSection').classList.add('hidden');
            document.getElementById('endingSection').classList.remove('hidden');
            document.body.style.overflow = "hidden";

        } catch (error) {
            console.error('Interview finish error:', error);
            alert('Error: ' + error.message);
        } finally {
            cleanupVideoResources();
        }
    }

    function goBack() {
        cleanupVideoResources();

        // UI 초기화
        const videoContainer = document.querySelector('#questionSection .video-container');
        if (videoContainer) {
            // Check if recording indicator already exists
            if (!document.getElementById('interviewRecordingIndicator-2')) {
                const recordingIndicator = document.createElement('div');
                recordingIndicator.id = 'interviewRecordingIndicator-2';
                recordingIndicator.className = 'recording-indicator';
                recordingIndicator.style.display = 'none';
                recordingIndicator.innerHTML =
                    '<span class="recording-dot"></span>' +
                    '녹화중';
                videoContainer.appendChild(recordingIndicator);
            }
        }

        // 화면 전환
        document.getElementById('questionSection').classList.add('hidden');
        document.getElementById('setupSection').classList.remove('hidden');

        // 카메라 다시 초기화
        initializeCamera();
    }


    // 페이지 로드 시 카메라 초기화
    document.addEventListener('DOMContentLoaded', initializeCamera);

    async function initializeCamera() {
        try {
            // 먼저 카메라 권한 상태 확인
            const permissions = await navigator.permissions.query({name: 'camera'});
            if (permissions.state === 'denied') {
                throw new Error('카메라 권한이 거부되었습니다. 브라우저 설정에서 카메라 권한을 허용해주세요.');
            }

            const stream = await navigator.mediaDevices.getUserMedia({
                video: {
                    width: {ideal: 1280},
                    height: {ideal: 720}
                },
                audio: false
            });

            const videoContainer = document.querySelector('.video-container');
            if (!videoContainer) {
                throw new Error('비디오 컨테이너를 찾을 수 없습니다.');
            }

            const videoElement = document.createElement('video');
            videoElement.srcObject = stream;
            videoElement.autoplay = true;
            videoElement.playsInline = true;
            videoElement.muted = true;
            videoElement.style.width = '100%';
            videoElement.style.height = '100%';

            videoContainer.innerHTML = '';
            videoContainer.appendChild(videoElement);
            document.getElementById('setupVideoError-1').style.display = 'none';

        } catch (error) {
            handleCameraError(error, 'setup');
        }
    }


    function handleCameraError(error, section = 'setup') {
        console.error('Camera error:', error);
        const errorId = section === 'setup' ? 'setupVideoError-1' : 'interviewVideoError-2';
        const videoError = document.getElementById(errorId);

        if (videoError) {
            if (error.name === 'NotAllowedError' || error.name === 'PermissionDeniedError') {
                videoError.textContent = '카메라 권한이 거부되었습니다. 브라우저 설정에서 카메라 권한을 허용해주세요.';
            } else if (error.name === 'NotFoundError') {
                videoError.textContent = '카메라를 찾을 수 없습니다. 카메라가 연결되어 있는지 확인해주세요.';
            } else {
                videoError.textContent = '카메라 접근에 실패했습니다: ' + error.message;
            }
            videoError.style.display = 'block';
        }
    }


    document.addEventListener('DOMContentLoaded', function () {
        // 모달 창 관련 요소
        const loadModal = document.getElementById("loadModal");
        const loadModalBtn = document.getElementById("loadModalBtn");
        const loadCloseBtn = loadModal.querySelector(".close");


        // 모달 열기
        loadModalBtn.onclick = function () {
            loadModal.style.display = "block";
        };

        // 모달 닫기
        loadCloseBtn.onclick = function () {
            loadModal.style.display = "none";
        };

        // 모달 외부 클릭시 닫기
        window.onclick = function (event) {
            if (event.target == loadModal) {
                loadModal.style.display = "none";
            }
        };
    });

    // 전역 변수로 선택된 자기소개서의 position을 저장
    let selectedPosition = '';
    let username = '';
    let selfId = '';

    function loadSelfIntroduction(selfIdx) {
        selfId = selfIdx;
        $.ajax({
            url: `${pageContext.request.contextPath}/aiboard/loadSelfIntroduction/` + selfIdx,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                username = data.username;
                const company = data.company;
                const position = data.position;
                const title = data.title;
                const iproQuestions = data.iproQuestions;

                selectedPosition = position;

                const resultDiv = document.getElementById('selectedSelfIntroduction');
                resultDiv.innerHTML = '<strong>자기소개서</strong>' +
                    '<div class="form-control mb-3"><span>' + company + '</span>' +
                    '<span> / ' + position + '</span></div>' +
                    '<strong>예상질문</strong>';

                // 질문 테이블 생성
                const tableDiv = document.createElement('div');
                tableDiv.className = 'table-responsive mt-3';

                let tableHtml = '<table class="table">' +
                    '<thead>' +
                    '<tr>' +
                    '<th style="width: 10%">번호</th>' +
                    '<th style="width: 80%">질문 내용</th>' +
                    '<th style="width: 10%">선택</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>';

                if (iproQuestions && iproQuestions.length > 0) {
                    iproQuestions.forEach((question, i) => {
                        tableHtml += '<tr>' +
                            '<td>' + (i + 1) + '</td>' +
                            '<td>' + question + '</td>' +
                            '<td>' +
                            '<input class="form-check-input" type="checkbox" ' +
                            'value="' + question + '" ' +
                            'id="question' + i + '" ' +
                            'name="selectedQuestions">' +
                            '</td>' +
                            '</tr>';
                    });
                } else {
                    const defaultQuestions = [
                        "회사를 선택한 이유는 무엇인가요?",
                        "직무와 관련된 경험을 설명해주세요.",
                        "향후 커리어 계획은 무엇인가요?"
                    ];

                    defaultQuestions.forEach((question, i) => {
                        tableHtml += '<tr>' +
                            '<td>' + (i + 1) + '</td>' +
                            '<td>' + question + '</td>' +
                            '<td>' +
                            '<input class="form-check-input" type="checkbox" ' +
                            'value="' + question + '" ' +
                            'id="question' + i + '" ' +
                            'name="selectedQuestions">' +
                            '</td>' +
                            '</tr>';
                    });
                }

                tableHtml += '</tbody></table>';
                tableDiv.innerHTML = tableHtml;
                resultDiv.appendChild(tableDiv);
                resultDiv.style.display = 'block';
                loadModal.style.display = "none";

                // 체크박스 이벤트 리스너 추가
                const checkboxes = document.querySelectorAll('input[name="selectedQuestions"]');
                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        const checked = document.querySelectorAll('input[name="selectedQuestions"]:checked');
                        if (checked.length > 6) {
                            this.checked = false;
                            alert('최대 6개의 질문만 선택할 수 있습니다.');
                        }
                    });
                });
            },
            error: function (xhr, status, error) {
                console.error('자기소개서 불러오기 오류:', error);
                alert('자기소개서를 불러오는데 실패했습니다.');
            }
        });
    }

    function cleanupVideoResources() {
        // 모든 비디오 스트림 정지
        const videoElements = document.querySelectorAll('video');
        videoElements.forEach(video => {
            if (video.srcObject) {
                video.srcObject.getTracks().forEach(track => track.stop());
                video.srcObject = null;
            }
        });

        // MediaRecorder 정리
        if (mediaRecorder && mediaRecorder.state !== 'inactive') {
            mediaRecorder.stop();
        }

        // 녹화 표시기 숨기기
        const setupIndicator = document.getElementById('setupRecordingIndicator-1');
        const interviewIndicator = document.getElementById('interviewRecordingIndicator-2');

        if (setupIndicator) setupIndicator.style.display = 'none';
        if (interviewIndicator) interviewIndicator.style.display = 'none';
    }

    let isRecording = false;

    function startRecording() {
        try {
            const startButton = document.getElementById('interviewStartButton');
            const stopButton = document.getElementById('interviewStopButton');
            const videoContainer = document.querySelector('#questionSection .video-container');
            let recordingIndicator = document.getElementById('interviewRecordingIndicator-2');

            // Create recording indicator if it doesn't exist
            if (!recordingIndicator && videoContainer) {
                const newRecordingIndicator = document.createElement('div');
                newRecordingIndicator.id = 'interviewRecordingIndicator-2';
                newRecordingIndicator.className = 'recording-indicator';
                newRecordingIndicator.style.display = 'none';
                newRecordingIndicator.innerHTML =
                    '<span class="recording-dot"></span>' +
                    '녹화중';
                videoContainer.appendChild(newRecordingIndicator);
                recordingIndicator = newRecordingIndicator;
            }

            if (!mediaRecorder || mediaRecorder.state === 'recording') {
                throw new Error('MediaRecorder가 준비되지 않았거나 이미 녹화 중입니다.');
            }
            if (recordedChunks.length === 0) {
                throw new Error('녹화된 데이터가 없습니다.');
            }

            const blob = new Blob(recordedChunks, { type: 'video/webm' });
            const currentQuestionNumber = parseInt(document.querySelector('.current-question .question-number strong').textContent.split(' ')[1]);

            updateTranscriptAnswer(currentQuestionNumber, dummyAnswers[currentQuestionNumber] || "답변이 녹화되었습니다.");

            // Reset recorded chunks
            recordedChunks = [];

            // Update UI
            if (startButton) startButton.disabled = true;
            if (stopButton) stopButton.disabled = false;
            if (recordingIndicator) recordingIndicator.style.display = 'flex';

            // Start recording
            mediaRecorder.start();
            isRecording = true;
            console.log('녹화가 시작되었습니다.');

        } catch (error) {
            console.error('녹화 시작 오류:', error);
            alert('녹화 시작 중 오류가 발생했습니다.: ' + error.message);
        }
    }

    function stopRecording() {
        try {
            if (!isRecording || !mediaRecorder) {
                console.error('녹화 중이 아닙니다.');
                return;
            }

            const startButton = document.getElementById('interviewStartButton');
            const stopButton = document.getElementById('interviewStopButton');
            const recordingIndicator = document.getElementById('interviewRecordingIndicator-2');

            // Update UI
            if (startButton) startButton.disabled = false;
            if (stopButton) stopButton.disabled = true;
            if (recordingIndicator) recordingIndicator.style.display = 'none';

            mediaRecorder.ondataavailable = async (event) => {
                if (event.data && event.data.size > 0) {
                    recordedChunks.push(event.data);
                    await saveRecording();
                }
            };

            mediaRecorder.stop();
            isRecording = false;
            console.log('녹화가 중지되었습니다.');

        } catch (error) {
            console.error('녹화 중지 오류:', error);
            alert('녹화 중지 중 오류가 발생했습니다.');
        }
    }

    async function uploadRecording() {
        try {
            if (recordedChunks.length === 0) {
                throw new Error('녹화된 데이터가 없습니다.');
            }

            const blob = new Blob(recordedChunks, {type: 'video/webm'});
            const formData = new FormData();
            formData.append('video', blob);

            // Spring Security CSRF 토큰
            const token = document.querySelector("meta[name='_csrf']").content;
            const header = document.querySelector("meta[name='_csrf_header']").content;

            const response = await fetch('/aiboard/api/interview/video', {
                method: 'POST',
                headers: {
                    [header]: token
                },
                body: formData
            });

            if (!response.ok) {
                throw new Error('서버 응답 오류: ' + response.status);
            }

            console.log('업로드 완료');

        } catch (error) {
            console.error('업로드 오류:', error);
            alert('녹화 파일 업로드 중 오류가 발생했습니다.');
        }
    }

    function updateTranscriptList(selectedQuestions) {
        const transcriptList = document.querySelector('.transcript-list');
        const tableHtml = '<div class="table-responsive"><table class="table"><tbody>' +
            selectedQuestions.map((question, index) =>
                '<tr class="transcript-item" data-question-number="' + (index + 1) + '" data-listener-added="false">' +
                '<td>' +
                '<p class="transcript-question">Q' + (index + 1) + '. ' + question.content + '</p>' +
                '<p class="transcript-answer">' + (dummyAnswers[index + 1] || '') + '</p>' +
                '</td>' +
                '</tr>'
            ).join('') +
            '</tbody></table></div>';

        transcriptList.innerHTML = tableHtml;
        setupTranscriptItemListeners();
    }

    function setupTranscriptItemListeners() {
        const transcriptItems = document.querySelectorAll('.transcript-item');

        transcriptItems.forEach(item => {
            if (!item.hasAttribute('data-listener-added')) {
                item.setAttribute('data-listener-added', 'true');

                item.addEventListener('click', function() {
                    const isExpanded = this.classList.contains('expanded');

                    // Collapse all items first
                    document.querySelectorAll('.transcript-item.expanded')
                        .forEach(expandedItem => expandedItem.classList.remove('expanded'));

                    // If wasn't expanded before, expand it
                    if (!isExpanded) {
                        this.classList.add('expanded');
                    }
                });
            }
        });
    }

    // Dummy answers object
    const dummyAnswers = {
        1: "저는 귀사의 혁신적인 기술 개발과 글로벌 시장에서의 성장 가능성에 매력을 느꼈습니다. 특히 AI 기술을 활용한 서비스 개발에 중점을 두고 있는 점이 제 경력 목표와 잘 맞았습니다.",
        2: "대학교 3학년 때 진행했던 AI 기반 추천 시스템 프로젝트가 가장 기억에 남습니다. 6명의 팀원들과 함께 3개월간 프로젝트를 진행하면서 팀장을 맡아 일정 관리와 팀원들 간의 의사소통을 조율했습니다.",
        3: "단기적으로는 현재 지원한 포지션에서 기술력을 높이고 실무 경험을 쌓아 해당 분야의 전문가가 되는 것이 목표입니다.",
        4: "제 장점은 문제 해결에 대한 끈기와 열정입니다. 학부 프로젝트에서 겪었던 기술적 어려움을 해결하기 위해 밤늦게까지 공부하고 연구했던 경험이 있습니다.",
        5: "저는 스트레스 관리를 위해 규칙적인 운동과 취미 활동을 하고 있습니다.",
        6: "귀사에서 일하게 된다면, 첫 3개월은 회사의 시스템과 업무 프로세스를 완벽히 파악하는 데 집중하고 싶습니다."
    };

    function updateTranscriptAnswer(questionNumber, answer) {
        const transcriptItems = document.querySelectorAll('.transcript-item');
        if (transcriptItems[questionNumber - 1]) {
            const answerElement = transcriptItems[questionNumber - 1].querySelector('.transcript-answer');
            if (answerElement) {
                answerElement.textContent = answer;
            }
        }
    }

    async function saveRecording() {
        try {
            // Keep all existing code
            if (recordedChunks.length === 0) {
                throw new Error('녹화된 데이터가 없습니다.');
            }

            const blob = new Blob(recordedChunks, { type: 'video/webm' });
            const currentQuestionNumber = parseInt(document.querySelector('.current-question .question-number strong').textContent.split(' ')[1]);

            // Keep existing date formatting
            const date = new Date();
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const formattedDate = year + month + day;

            const fileName = selfId + '_Question' + currentQuestionNumber + '_' + formattedDate + '.webm';

            // Keep existing file handling
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.style.display = 'none';
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            document.body.removeChild(a);

            // Add this one new line
            updateTranscriptAnswer(currentQuestionNumber, "답변이 녹화되었습니다.");

            // Keep existing navigation code
            const totalQuestions = document.querySelectorAll('input[name="selectedQuestions"]:checked').length;
            if (currentQuestionNumber < totalQuestions) {
                updateCurrentQuestion(currentQuestionNumber + 1);
            } else {
                finishInterview();
            }

            recordedChunks = [];
            console.log('녹화 저장 완료:', fileName);

        } catch (error) {
            console.error('저장 오류:', error);
            alert('녹화 파일 저장 중 오류가 발생했습니다: ' + error.message);
        }
    }

    async function startInterview() {
        try {
            // Keep all existing code
            const selfIntroDiv = document.getElementById('selectedSelfIntroduction');
            const formControl = selfIntroDiv.querySelector('.form-control');

            if (!formControl || formControl.textContent.trim() === '-') {
                alert('자기소개서를 선택해주세요.');
                return;
            }

            // Keep existing question selection code
            const selectedQuestions = Array.from(document.querySelectorAll('input[name="selectedQuestions"]:checked'))
                .map((checkbox, index) => ({
                    content: checkbox.value,
                    orderNumber: index + 1
                }));

            if (selectedQuestions.length === 0) {
                alert('최소 1개의 질문을 선택해주세요.');
                return;
            }
            if (selectedQuestions.length > 6) {
                alert('최대 6개의 질문만 선택할 수 있습니다.');
                return;
            }

            // Keep existing API call
            const requestData = {
                username: null,
                position: selectedPosition,
                questions: selectedQuestions,
                interviewDate: new Date().toISOString(),
                videoStatus: null,
                videoUrl: null,
                memberId: null
            };

            const response = await fetch('/aiboard/api/interview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData)
            });

            if (!response.ok) {
                const errorText = await response.text();
                console.error('Server response:', errorText);
                throw new Error('면접 시작에 실패했습니다. Status: ' + response.status);
            }

            const data = await response.json();
            currentInterviewId = data.id;

            // Add this one new line
            updateTranscriptList(selectedQuestions);

            // Keep rest of existing code
            document.getElementById('setupSection').classList.add('hidden');
            document.getElementById('questionSection').classList.remove('hidden');

            const questionHeader = document.querySelector('.question-header');
            questionHeader.innerHTML = '<h5>면접 질문</h5>' +
                '<div class="current-question">' +
                '<p class="question-number"><strong>Question 1</strong></p>' +
                '<p class="question-content">' + selectedQuestions[0].content + '</p>' +
                '</div>';

            await startVideoRecording();

        } catch (error) {
            console.error('Interview start error:', error);
            alert(error.message);
        }
    }


    document.addEventListener('DOMContentLoaded', function() {
        const transcriptItems = document.querySelectorAll('.transcript-item');

        transcriptItems.forEach(item => {
            item.addEventListener('click', function() {
                // If this item is already expanded, collapse it
                if (this.classList.contains('expanded')) {
                    this.classList.remove('expanded');
                    return;
                }

                // Collapse any other expanded items
                const expandedItems = document.querySelectorAll('.transcript-item.expanded');
                expandedItems.forEach(expandedItem => {
                    if (expandedItem !== this) {
                        expandedItem.classList.remove('expanded');
                    }
                });

                // Expand this item
                this.classList.add('expanded');
            });
        });
    });
    
    function updateCurrentQuestion(questionNumber) {
        const questionItems = document.querySelectorAll('.question-item');
        if (questionNumber <= questionItems.length) {
            const currentQuestionDiv = document.querySelector('.current-question');
            const targetQuestion = questionItems[questionNumber - 1];

            currentQuestionDiv.querySelector('.question-number strong').textContent = `Question ${questionNumber}`;
            currentQuestionDiv.querySelector('.question-content').textContent =
                targetQuestion.querySelector('.question-content').textContent;
        }
    }
    
    function finishInterview() {
        cleanupVideoResources();
        document.getElementById('questionSection').classList.add('hidden');
        document.getElementById('endingSection').classList.remove('hidden');
        document.body.style.overflow = "hidden";
    }
    
    
</script>

</body>
</html>