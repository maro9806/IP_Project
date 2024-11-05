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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/ai_preparation.css">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<!-- Interview Setup Section -->
<div id="setupSection" class="main-content">

    <!-- Card section with video and AIInterview settings (Horizontal layout) -->
    <div class="camera-container">
        <div class="row justify-content-center position-relative">
            <div class="card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="video-section">
                    <div class="video-container">
                        <!-- 여기에 비디오가 동적으로 추가됨 -->
                    </div>
                    <div id="questionVideoError" class="video-error" style="display: none;">
                        카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
                    </div>
                    <div id="questionRecordingIndicator" class="recording-indicator" style="display: none;">
                        <span class="recording-dot"></span>
                        녹화중
                    </div>
                </div>
                <!-- Right section: Interview settings -->
                <div class="form-section fade-target">
                    <div class="mb-3">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <!-- 불러온 자기소개서 정보를 표시할 위치 -->
                                    <div id="selectedSelfIntroduction" class="mt-3">
                                        <label for="coverLetter"><strong>자기소개서</strong></label>
                                        <input id="coverLetter" readonly class="form-control" value="-"/>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button id="loadModalBtn" class="btn btn-dark w-100 mt-3">자기소개서 불러오기</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <button class="btn btn-primary w-100" onclick="startInterview()">면접 시작하기</button>
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
        </div>
    </div>
</div>

<!-- Question Section -->
<div id="questionSection" class="main-content hidden">
    <div class="container">
        <div class="row justify-content-center position-relative">
            <div class="card col-lg-10 d-flex flex-row interview-card">
                <!-- Left section: Video -->
                <div class="col-md-8">
                    <div class="video-section">
                        <div class="video-container">
                            <!-- 비디오가 동적으로 추가됨 -->
                        </div>
                        <div id="setupVideoError" class="video-error" style="display: none;">
                            카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
                        </div>
                        <div id="setupRecordingIndicator" class="recording-indicator" style="display: none;">
                            <span class="recording-dot"></span>
                            녹화중
                        </div>
                        <!-- 녹화 제어 버튼 -->
                        <div class="button-group mt-3">
                            <button id="startButton" onclick="startRecording()" class="btn btn-primary">녹화 시작</button>
                            <button id="stopButton" onclick="stopRecording()" class="btn btn-danger" disabled>녹화 종료</button>
                        </div>
                    </div>
                </div>

                <!-- Right section: Questions -->
                <div class="col-md-4 question-section">
                    <div class="question-header">
                        <h5><strong>면접 질문</strong></h5>
                        <div class="current-question mb-4">
                            <p class="question-number"><strong>Question 1</strong></p>
                            <p class="question-content"></p>
                        </div>
                    </div>
                    <div class="selected-questions-list">
                        <!-- 선택된 질문들이 여기에 표시됨 -->
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

            // 선택된 질문들 가져오기
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
                username: null, // 서버에서 설정됨
                position: position,
                questions: selectedQuestions,
                interviewDate: new Date().toISOString(),
                videoStatus: null, // 서버에서 설정됨
                videoUrl: null,
                memberId: null // 서버에서 설정됨
            };

            console.log('Request data:', requestData); // 요청 데이터 로그

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
                throw new Error(`면접 시작에 실패했습니다. Status: ${response.status}`);
            }

            const data = await response.json();
            console.log('Received data:', data);

            currentInterviewId = data.id;

            // 화면 전환 전에 비디오 녹화 시작
            await startVideoRecording();

            // 화면 요소 존재 여부 확인
            const setupSection = document.getElementById('setupSection');
            const questionSection = document.getElementById('questionSection');

            if (!setupSection || !questionSection) {
                throw new Error('필요한 화면 요소를 찾을 수 없습니다.');
            }

            // 화면 전환
            setupSection.classList.add('hidden');
            questionSection.classList.remove('hidden');

            // 질문 표시 요소 확인
            const questionTitle = questionSection.querySelector('.center-text p:first-child');
            const questionContent = questionSection.querySelector('.center-text p:last-child');

            if (!questionTitle || !questionContent) {
                throw new Error('질문 표시 요소를 찾을 수 없습니다.');
            }

            const selectedQuestion = selectedQuestions[0];
            if (!selectedQuestion) {
                throw new Error('선택된 질문이 없습니다.');
            }

            questionTitle.textContent = `Question ${selectedQuestion.orderNumber}`;
            questionContent.textContent = selectedQuestion.content;

            // 비디오 섹션 확인
            const videoSection = document.querySelector('#questionSection .video-section');
            if (!videoSection) {
                throw new Error('비디오 섹션을 찾을 수 없습니다.');
            }

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

            const questionVideoContainer = document.querySelector('#questionSection .video-container');
            if (!questionVideoContainer) {
                throw new Error('면접 비디오 컨테이너를 찾을 수 없습니다.');
            }

            const videoElement = document.createElement('video');
            videoElement.srcObject = stream;
            videoElement.autoplay = true;
            videoElement.playsInline = true;
            videoElement.style.width = '100%';
            videoElement.style.height = 'auto';

            questionVideoContainer.innerHTML = '';
            questionVideoContainer.appendChild(videoElement);

            mediaRecorder = new MediaRecorder(stream, {
                mimeType: 'video/webm;codecs=vp8,opus'
            });

            recordedChunks = [];
            mediaRecorder.ondataavailable = (event) => {
                if (event.data.size > 0) {
                    recordedChunks.push(event.data);
                }
            };

            mediaRecorder.start();

            const recordingIndicator = document.getElementById('questionRecordingIndicator');
            if (recordingIndicator) {
                recordingIndicator.style.display = 'block';
            }

        } catch (error) {
            handleCameraError(error, 'question');
            throw error; // 상위 함수에서 처리할 수 있도록 에러를 다시 던짐
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
        const videoContainer = document.querySelector('.video-container');
        if (videoContainer) {
            videoContainer.innerHTML = ''; // 비디오 요소 제거
        }

        recordedChunks = [];

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
            videoElement.style.height = 'auto';

            videoContainer.innerHTML = ''; // 기존 내용 제거
            videoContainer.appendChild(videoElement);
            document.getElementById('setupVideoError').style.display = 'none';

        } catch (error) {
            handleCameraError(error, 'setup');
        }
    }

    function handleCameraError(error, section = 'setup') {
        console.error('Camera error:', error);
        const errorId = section === 'setup' ? 'setupVideoError' : 'questionVideoError';
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


    // 자기소개서 로드 함수
    // 자기소개서 로드 함수
    function loadSelfIntroduction(selfIdx) {
        $.ajax({
            url: `${pageContext.request.contextPath}/aiboard/loadSelfIntroduction/` + selfIdx,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                const company = data.company;
                const position = data.position;
                const title = data.title;
                const questions = data.questions;
                const answers = data.answers;

                const resultDiv = document.getElementById('selectedSelfIntroduction');
                resultDiv.innerHTML = '<strong>자기소개서</strong>' +
                    '<div class="form-control mb-3"><span>' + company + '</span>' +
                    '<span> / ' + position + '</span></div>' +
                    '<strong>예상질문</strong><div class="question-list">';

                // 문항 수만큼 체크박스로 예상 질문 표시
                const defaultQuestions = [
                    "회사를 선택한 이유는 무엇인가요?",
                    "직무와 관련된 경험을 설명해주세요.",
                    "향후 커리어 계획은 무엇인가요?"
                ];

                // 문항 수만큼 예상 질문 표시
                for (let i = 0; i < questions.length; i++) {
                    resultDiv.innerHTML += `
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="${defaultQuestions[i]}"
                               id="question${i}" name="selectedQuestions">
                        <label class="form-check-label" for="question${i}">
                            ${i + 1}. ${defaultQuestions[i]}
                        </label>
                    </div>`;
                }

                resultDiv.innerHTML += '</div>';
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
        const setupIndicator = document.getElementById('setupRecordingIndicator');
        const questionIndicator = document.getElementById('questionRecordingIndicator');

        if (setupIndicator) {
            setupIndicator.style.display = 'none';
        }
        if (questionIndicator) {
            questionIndicator.style.display = 'none';
        }
    }

    function startRecording() {
        document.getElementById('startButton').disabled = true;
        document.getElementById('stopButton').disabled = false;
        document.getElementById('setupRecordingIndicator').style.display = 'block';

        if (mediaRecorder && mediaRecorder.state === 'inactive') {
            mediaRecorder.start();
        }
    }

    function stopRecording() {
        document.getElementById('startButton').disabled = false;
        document.getElementById('stopButton').disabled = true;
        document.getElementById('setupRecordingIndicator').style.display = 'none';

        if (mediaRecorder && mediaRecorder.state === 'recording') {
            mediaRecorder.stop();
            finishInterview();
        }
    }

    // 선택된 질문 표시 함수
    function displaySelectedQuestions(questions) {
        const questionsContainer = document.querySelector('.selected-questions-list');
        if (questionsContainer) {
            questionsContainer.innerHTML = questions.map((question, index) => `
            <div class="question-item">
                <strong>질문 ${index + 1}</strong>
                <p>${question.content}</p>
            </div>
        `).join('');
        }
    }
</script>

</body>
</html>