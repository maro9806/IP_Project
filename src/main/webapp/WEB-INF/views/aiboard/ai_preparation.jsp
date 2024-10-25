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
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<!-- Interview Setup Section -->
<div id="setupSection" class="main-content">
    <div class="container">
        <!-- Centered greeting message -->
        <div class="row">
            <div class="col center-text fade-target">
                <p><strong>신현준님</strong>, 안녕하세요</p>
                <p>지금부터 영상 면접을 시작할게요.</p>
            </div>
        </div>

        <!-- Card section with video and interview settings (Horizontal layout) -->
        <div class="row justify-content-center position-relative">
            <div class="card col-lg-8 d-flex flex-row">
                <!-- Left section: Video -->
                <div class="video-section">
                    <span>video check</span>
                </div>
                <!-- Right section: Interview settings -->
                <div class="form-section fade-target">
                    <h4>면접 환경 설정</h4>
                    <div class="mb-3">
                        <label for="positionSelect" class="form-label">자소서 선택</label>
                        <input type="text" class="form-control" id="positionSelect" placeholder="선택">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">질문 종류</label><br>
                        <input type="checkbox" id="company" name="company">
                        <label for="company">기업</label>
                        <input type="checkbox" id="job" name="job">
                        <label for="job">직무</label>
                        <input type="checkbox" id="experience" name="experience">
                        <label for="experience">경험</label>
                    </div>
                    <button class="btn btn-primary w-100" onclick="startInterview()">면접 시작하기</button>
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
            // 면접 시작 API 호출
            const response = await fetch('/aiboard/api/interview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    applicantName: '신현준', // 실제로는 서버에서 현재 로그인한 사용자 정보를 사용
                    position: document.getElementById('positionSelect').value,
                    interviewDate: new Date().toISOString()
                })
            });

            if (!response.ok) {
                throw new Error('면접 시작에 실패했습니다.');
            }

            const data = await response.json();
            currentInterviewId = data.id;

            // 비디오 녹화 시작
            await startVideoRecording();

            // UI 전환 (기존 기능 유지)
            document.getElementById('setupSection').classList.add('hidden');
            document.getElementById('questionSection').classList.remove('hidden');
        } catch (error) {
            alert('Error: ' + error.message);
        }
    }

    async function startVideoRecording() {
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
            const videoElement = document.createElement('video');
            videoElement.srcObject = stream;
            videoElement.autoplay = true;

            // 기존 video check span 제거
            const videoSection = document.querySelector('.video-section');
            videoSection.innerHTML = '';  // 기존 내용 제거
            videoSection.appendChild(videoElement);

            mediaRecorder = new MediaRecorder(stream);
            mediaRecorder.ondataavailable = (event) => {
                if (event.data.size > 0) {
                    recordedChunks.push(event.data);
                }
            };
            mediaRecorder.start();
        } catch (error) {
            console.error('카메라 접근 오류:', error);
            alert('카메라 접근에 실패했습니다. 카메라 권한을 확인해주세요.');
        }
    }

    async function finishInterview() {
        try {
            if (mediaRecorder && mediaRecorder.state === 'recording') {
                mediaRecorder.stop();
                await new Promise(resolve => {
                    mediaRecorder.onstop = async () => {
                        const blob = new Blob(recordedChunks, { type: 'video/webm' });
                        const formData = new FormData();
                        formData.append('video', blob);
                        formData.append('interviewId', currentInterviewId);

                        try {
                            const response = await fetch(`/aiboard/api/interview/${currentInterviewId}/video`, {
                                method: 'POST',
                                body: formData
                            });

                            if (!response.ok) {
                                throw new Error('비디오 제출에 실패했습니다.');
                            }

                            resolve();
                        } catch (error) {
                            throw error;
                        }
                    };
                });
            }

            // 기존 UI 전환 유지
            document.getElementById('questionSection').classList.add('hidden');
            document.getElementById('endingSection').classList.remove('hidden');
            document.body.style.overflow = "hidden";
        } catch (error) {
            alert('Error: ' + error.message);
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
</script>

</body>
</html>