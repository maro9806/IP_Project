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
    <div class="camera-container">
        <div class="row justify-content-center position-relative">
            <div class="card camera-card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="video-section d-flex flex-column">
                    <h5><strong>면접 환경 설정</strong></h5>
                    <p><sec:authentication property="principal.member.name"/>님 영상 면접을 진행할 자기소개서와 질문을 선택해주세요.</p>
                    <div class="video-container">
                        <!-- 여기에 비디오가 동적으로 추가됨 -->
                    </div>
                    <div id="setupVideoError-1" class="video-error" style="display: none;">
                        카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
                    </div>
                    <div id="setupRecordingIndicator-1" class="recording-indicator" style="display: none;">
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
            <div class="card camera-card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="col-md-8">
                    <div class="question-header">
                        <h5><strong>면접 질문</strong></h5>
                        <div class="current-question mb-4">
                            <p class="question-number"><strong>Question 1</strong></p>
                            <p class="question-content"></p>
                        </div>
                    </div>
                    <div class="video-section">
                        <div class="video-container">
                            <!-- 비디오가 동적으로 추가됨 -->
                        </div>
                        <div id="interviewVideoError-2" class="video-error" style="display: none;">
                            카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
                        </div>
                        <div id="interviewRecordingIndicator-2" class="recording-indicator" style="display: none;">
                            <span class="recording-dot"></span>
                            녹화중
                        </div>
                    </div>
                    <!-- 녹화 제어 버튼 -->
                    <div class="button-group mt-3">
                        <button id="interviewStartButton" onclick="startRecording()" class="btn btn-primary">녹화 시작
                        </button>
                        <button id="interviewStopButton" onclick="stopRecording()" class="btn btn-danger" disabled>
                            녹화 종료
                        </button>
                    </div>
                </div>

                <!-- Right section: Questions -->
                <div class="col-md-4 question-section">

                    <div class="selected-questions-list">
                        <!-- 선택된 질문들이 여기에 표시됨 -->
                    </div>
                </div>`
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
                throw new Error(`면접 시작에 실패했습니다. Status: ${response.status}`);
            }

            const data = await response.json();
            currentInterviewId = data.id;

            // 화면 전환
            document.getElementById('setupSection').classList.add('hidden');
            document.getElementById('questionSection').classList.remove('hidden');

            // 질문 섹션 업데이트
            const questionSectionDiv = document.querySelector('.question-section');

// 헤더 부분 생성
            const headerDiv = document.createElement('div');
            headerDiv.className = 'question-header';

            const title = document.createElement('h5');
            title.innerHTML = '<strong>면접 질문</strong>';

            const currentQuestionDiv = document.createElement('div');
            currentQuestionDiv.className = 'current-question mb-4';

            const currentQuestionNumber = document.createElement('p');
            currentQuestionNumber.className = 'question-number';
            currentQuestionNumber.innerHTML = '<strong>Question 1</strong>';

            const currentQuestionContent = document.createElement('p');
            currentQuestionContent.className = 'question-content';
            currentQuestionContent.textContent = selectedQuestions[0].content;

// 현재 질문 조립
            currentQuestionDiv.appendChild(currentQuestionNumber);
            currentQuestionDiv.appendChild(currentQuestionContent);

// 헤더 조립
            headerDiv.appendChild(title);
            headerDiv.appendChild(currentQuestionDiv);

// 질문 리스트 생성
            const questionsList = document.createElement('div');
            questionsList.className = 'selected-questions-list';

// 각 질문 아이템 생성
            selectedQuestions.forEach(question => {
                const questionItem = document.createElement('div');
                questionItem.className = 'question-item';

                const numberPara = document.createElement('p');
                numberPara.className = 'question-number';
                numberPara.innerHTML = `<strong>Question ${question.orderNumber}</strong>`;

                const contentPara = document.createElement('p');
                contentPara.className = 'question-content';
                contentPara.textContent = question.content;

                questionItem.appendChild(numberPara);
                questionItem.appendChild(contentPara);
                questionsList.appendChild(questionItem);
            });

// 기존 내용 제거
            questionSectionDiv.innerHTML = '';

// 새로운 내용 추가
            questionSectionDiv.appendChild(headerDiv);
            questionSectionDiv.appendChild(questionsList);

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
        selfId = selfIdx; // selfId 저장
        $.ajax({
            url: `${pageContext.request.contextPath}/aiboard/loadSelfIntroduction/` + selfIdx,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                username = data.username;
                const company = data.company;
                const position = data.position;
                const title = data.title;
                const questions = data.questions;
                const answers = data.answers;

                // position 저장
                selectedPosition = position;

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
        const setupIndicator = document.getElementById('setupRecordingIndicator-1');
        const interviewIndicator = document.getElementById('interviewRecordingIndicator-2');

        if (setupIndicator) setupIndicator.style.display = 'none';
        if (interviewIndicator) interviewIndicator.style.display = 'none';
    }

    let isRecording = false;

    function startRecording() {
        try {
            document.getElementById('interviewStartButton').disabled = true;
            document.getElementById('interviewStopButton').disabled = false;
            document.getElementById('interviewRecordingIndicator-2').style.display = 'block';

            if (mediaRecorder && mediaRecorder.state === 'inactive') {
                recordedChunks = []; // 녹화 시작시 초기화
                mediaRecorder.start();
                isRecording = true;
                console.log('녹화가 시작되었습니다.');
            }
        } catch (error) {
            console.error('녹화 시작 오류:', error);
            alert('녹화 시작 중 오류가 발생했습니다.');
        }
    }


    function stopRecording() {
        try {
            if (!isRecording || !mediaRecorder) {
                console.error('녹화 중이 아닙니다.');
                return;
            }

            document.getElementById('interviewStartButton').disabled = false;
            document.getElementById('interviewStopButton').disabled = true;
            document.getElementById('interviewRecordingIndicator-2').style.display = 'none';

            // mediaRecorder의 ondataavailable 이벤트 핸들러 설정
            mediaRecorder.ondataavailable = async (event) => {
                if (event.data && event.data.size > 0) {
                    recordedChunks.push(event.data);
                    // 마지막 데이터 수집 후 저장 처리
                    await saveRecording();
                }
            };

            // 녹화 중지
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
            console.log('녹화 데이터 크기:', recordedChunks.length);
            if (recordedChunks.length === 0) {
                throw new Error('녹화된 데이터가 없습니다.');
            }

            const blob = new Blob(recordedChunks, { type: 'video/webm' });
            const formData = new FormData();
            formData.append('video', blob, 'recording.webm');

            // CSRF 토큰 처리를 위한 헤더
            const headers = {};
            const token = document.querySelector("meta[name='_csrf']").content;
            const headerName = document.querySelector("meta[name='_csrf_header']").content;

            if (token && headerName) {
                headers[headerName] = token;
            }

            console.log('업로드 시작...');
            const response = await fetch('/aiboard/api/interview/video', {
                method: 'POST',
                headers: headers,
                body: formData
            });

            if (!response.ok) {
                throw new Error(`서버 응답 오류: ${response.status}`);
            }

            console.log('업로드 완료');

            // 다음 질문으로 이동 또는 종료 처리
            const currentQuestionNumber = parseInt(document.querySelector('.current-question .question-number strong').textContent.split(' ')[1]);
            const totalQuestions = document.querySelectorAll('.question-item').length;

            if (currentQuestionNumber < totalQuestions) {
                updateCurrentQuestion(currentQuestionNumber + 1);
            } else {
                finishInterview();
            }

        } catch (error) {
            console.error('업로드 오류:', error);
            alert('녹화 파일 업로드 중 오류가 발생했습니다.');
        }
    }

    async function saveRecording() {
        try {
            if (recordedChunks.length === 0) {
                throw new Error('녹화된 데이터가 없습니다.');
            }

            // Blob 생성
            const blob = new Blob(recordedChunks, { type: 'video/webm' });

            // 현재 날짜를 YYYYMMDD 형식으로 포매팅
            const date = new Date();
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const formattedDate = `${year}${month}${day}`;

            // 파일명 생성 (username과 selfId 포함)
            const fileName = `${username}_${selfId}_${formattedDate}.webm`;

            // 파일 다운로드
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.style.display = 'none';
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            document.body.removeChild(a);

            // 다음 질문으로 이동 또는 종료
            const currentQuestionNumber = parseInt(document.querySelector('.current-question .question-number strong').textContent.split(' ')[1]);
            const totalQuestions = document.querySelectorAll('.question-item').length;

            if (currentQuestionNumber < totalQuestions) {
                updateCurrentQuestion(currentQuestionNumber + 1);
            } else {
                finishInterview();
            }

            // 녹화 데이터 초기화
            recordedChunks = [];
            console.log('녹화 저장 완료:', fileName);

        } catch (error) {
            console.error('저장 오류:', error);
            alert('녹화 파일 저장 중 오류가 발생했습니다: ' + error.message);
        }
    }

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