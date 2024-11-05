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

        <!-- Centered greeting message -->
<%--        <div class="card">--%>
<%--            <div class="card-body">--%>
<%--            <div class="col center-text fade-target">--%>
<%--                <p><strong>신현준님</strong>, 안녕하세요</p>--%>
<%--                <p>지금부터 영상 면접을 시작할게요.</p>--%>
<%--            </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Card section with video and AIInterview settings (Horizontal layout) -->
    <div class="camera-container">
        <div class="row justify-content-center position-relative">
            <div class="card camera-card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="video-section d-flex flex-column">
                    <h5><strong>면접 환경 설정</strong></h5>
                    <p><sec:authentication property="principal.member.name"/>님 영상 면접을 진행할 자기소개서와 질문을 선택해주세요.</p>
                    <video id="videoPreview" autoplay playsinline muted></video>
                    <div id="videoError" class="video-error" style="display: none;">
                        카메라에 접근할 수 없습니다. 카메라 권한을 확인해주세요.
                    </div>
                    <div class="recording-indicator" id="recordingIndicator" style="display: none;">
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
                                    <label for="questions"><strong>예상질문</strong></label>
                                    <input id="questions" readonly class="form-control" value="-"/>
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
                    <div class="mb-3">
                        <label class="form-label"><strong>질문 종류</strong></label><br>
                        <input type="checkbox" id="company" name="company">
                        <label for="company">기업</label>
                        <input type="checkbox" id="job" name="job">
                        <label for="job">직무</label>
                        <input type="checkbox" id="experience" name="experience">
                        <label for="experience">경험</label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label"><strong>답변 시간</strong></label><br>
                        <select class="form-control">
                            <option>30초</option>
                            <option>60초</option>
                            <option>1분 30초</option>
                        </select>
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
                                <div class="card-body d-flex justify-content-center align-items-center" style="height: 100px;border: 1px solid #616161;border-radius: 8px;">
                                    <p class="mb-0">저장한 자기소개서 내역이 없습니다.</p>
                                </div>
                            </div>
                        </div>
                        <ul style="list-style: none; padding: 0;">
                            <c:forEach items="${selfBoards}" var="selfBoard">
                                <li onclick="loadSelfIntroduction(${selfBoard.selfIdx})" class="btn btn-outline-dark mb-2 text-start" style="width: 100%;">
                                    <div>
                                        <small>${fn:substring(selfBoard.selfDate, 0, 10)} ${fn:substring(selfBoard.selfDate, 11, 16)}</small>
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/><br>
                                        <strong><c:out value="${selfBoard.selfCompany}"/></strong> <strong>${selfBoard.selfPosition}</strong><br>
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
        <div class="row">
            <div class="col center-text">
                <p><strong>Question 1</strong></p>
                <p>우리 회사의 개선점과 나아가야할 방향은 무엇이라고 생각하십니까?</p>
            </div>
        </div>
        <div class="row justify-content-center position-relative">
            <div class="card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="video-section">
                    <span>video check</span>
                </div>
                <!-- Right section: Answer section -->
                <div class="form-section fade-target">
                    <h4>답변 확인</h4>
                    <div class="mb-3">
                            <textarea class="form-control" placeholder="사용자 답변 출력 페이지"
                                      style="height: 300px;"></textarea>
                    </div>
                    <button class="btn btn-primary w-100" onclick="finishInterview()">답변 완료</button>
                    <!-- Back button -->
                    <button class="btn btn-outline-primary w-100 mt-3" onclick="goBack()">처음으로 돌아가기</button>
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
            // fetch 요청 전에 현재 경로를 확인
            console.log('Current path:', window.location.pathname);

            const response = await fetch('/aiboard/api/interview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                    // CSRF 토큰은 비활성화했으므로 제거
                },
                body: JSON.stringify({
                    position: document.getElementById('positionSelect').value,
                    questions: [
                        {
                            content: "회사를 선택한 이유는 무엇인가요?",
                            orderNumber: 1
                        },
                        {
                            content: "직무와 관련된 경험을 설명해주세요.",
                            orderNumber: 2
                        },
                        {
                            content: "향후 커리어 계획은 무엇인가요?",
                            orderNumber: 3
                        }
                    ]
                })
            });

            console.log('Response status:', response.status); // 응답 상태 확인

            if (!response.ok) {
                const errorText = await response.text();
                console.error('Server response:', errorText);
                throw new Error(`면접 시작에 실패했습니다. Status: ${response.status}`);
            }

            const data = await response.json();
            console.log('Received data:', data); // 받은 데이터 확인

            currentInterviewId = data.id;
            await startVideoRecording();

            document.getElementById('setupSection').classList.add('hidden');
            document.getElementById('questionSection').classList.remove('hidden');
        } catch (error) {
            console.error('Interview start error:', error);
            alert('Error: ' + error.message);
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

            const videoSection = document.querySelector('.video-section');
            videoSection.innerHTML = '';
            videoSection.appendChild(videoElement);

            mediaRecorder = new MediaRecorder(stream, {
                mimeType: 'video/webm;codecs=vp8,opus'
            });

            recordedChunks = []; // 새 녹화 시작 전 초기화
            mediaRecorder.ondataavailable = (event) => {
                if (event.data.size > 0) {
                    recordedChunks.push(event.data);
                }
            };

            mediaRecorder.start();
            document.getElementById('recordingIndicator').style.display = 'block';

        } catch (error) {
            console.error('카메라 접근 오류:', error);
            document.getElementById('videoError').style.display = 'block';
            throw new Error('카메라 접근에 실패했습니다. 카메라 권한을 확인해주세요.');
        }
    }

    async function finishInterview() {
        try {
            if (mediaRecorder && mediaRecorder.state === 'recording') {
                mediaRecorder.stop();
                await new Promise(resolve => {
                    mediaRecorder.onstop = async () => {
                        try {
                            const token = document.querySelector("meta[name='_csrf']").content;
                            const header = document.querySelector("meta[name='_csrf_header']").content;
                            const blob = new Blob(recordedChunks, { type: 'video/webm' });
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

                            document.getElementById('questionSection').classList.add('hidden');
                            document.getElementById('endingSection').classList.remove('hidden');
                            document.body.style.overflow = "hidden";

                            resolve();
                        } catch (error) {
                            console.error('Video submission error:', error);
                            throw error;
                        }
                    };
                });
            } else {
                throw new Error('녹화가 진행 중이지 않습니다.');
            }
        } catch (error) {
            alert('Error: ' + error.message);
        } finally {
            // 녹화 관련 리소스 정리
            if (mediaRecorder && mediaRecorder.stream) {
                const tracks = mediaRecorder.stream.getTracks();
                tracks.forEach(track => track.stop());
            }
        }
    }

    function goBack() {
        // 녹화 중지 및 리소스 정리
        if (mediaRecorder && mediaRecorder.state === 'recording') {
            mediaRecorder.stop();
            const tracks = mediaRecorder.stream.getTracks();
            tracks.forEach(track => track.stop());
        }

        // 비디오 요소 제거 및 초기 상태로 복원
        const videoSection = document.querySelector('.video-section');
        videoSection.innerHTML = '<span>video check</span>';  // 원래 내용 복원
        recordedChunks = [];

        // 기존 UI 전환 유지
        document.getElementById('questionSection').classList.add('hidden');
        document.getElementById('setupSection').classList.remove('hidden');
    }

    // 기존 유틸리티 함수 유지
    function showResults() {
        alert('면접 내역을 확인하세요.');
    }

    function changeBackgroundColor() {
        document.body.style.backgroundColor = "#8292FF";
    }

    // 페이지 로드 시 카메라 초기화
    document.addEventListener('DOMContentLoaded', initializeCamera);

    async function initializeCamera() {
        try {
            const stream = await navigator.mediaDevices.getUserMedia({
                video: {
                    width: { ideal: 1280 },
                    height: { ideal: 720 }
                },
                audio: false
            });

            // 'previewVideo'를 'videoPreview'로 수정
            const videoElement = document.getElementById('videoPreview');
            if (videoElement) {
                videoElement.srcObject = stream;
                document.getElementById('videoError').style.display = 'none';
            } else {
                console.error('Video element not found');
                document.getElementById('videoError').style.display = 'block';
            }
        } catch (error) {
            console.error('Camera access error:', error);
            document.getElementById('videoError').style.display = 'block';
        }
    }

    // Welcome message fade-in effect
    document.addEventListener('DOMContentLoaded', () => {
        const welcomeMessage = document.querySelector('.welcome-message');
        if (welcomeMessage) {
            setTimeout(() => {
                welcomeMessage.classList.add('fade-in');
            }, 100);
        }
    })

    document.addEventListener('DOMContentLoaded', function() {
        // 모달 창 관련 요소
        const loadModal = document.getElementById("loadModal");
        const loadModalBtn = document.getElementById("loadModalBtn");
        const loadCloseBtn = loadModal.querySelector(".close");

        // 모달 열기
        loadModalBtn.onclick = function() {
            loadModal.style.display = "block";
        };

        // 모달 닫기
        loadCloseBtn.onclick = function() {
            loadModal.style.display = "none";
        };

        // 모달 외부 클릭시 닫기
        window.onclick = function(event) {
            if (event.target == loadModal) {
                loadModal.style.display = "none";
            }
        };
    });


    // 자기소개서 로드 함수
    function loadSelfIntroduction(selfIdx) {
        $.ajax({
            url: `${pageContext.request.contextPath}/aiboard/loadSelfIntroduction/`+selfIdx,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const company = data.company;
                const position = data.position;
                const title = data.title;

                const resultDiv = document.getElementById('selectedSelfIntroduction');
                resultDiv.innerHTML =
                    '<strong>자기소개서<strong>'+
                    '<div class="form-control mb-3"><span>' +  company + '</span>'+
                    '<span> / ' + position + '</span></div>' +
                    // '<p class="mb-0"> ' + title + '</p></div>' +
                    '<strong>예상질문</strong>' +
                    '<select class="form-control">+' +
                    '<option>1.-----</option></select>';

                resultDiv.style.display = 'block';
                loadModal.style.display = "none";

        },         error: function(xhr, status, error) {
                console.error('자기소개서 불러오기 오류:', error);
                alert('자기소개서를 불러오는데 실패했습니다.');
            }
        });
    };
</script>

</body>
</html>