<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<html>
<head>
    <title>2 stage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/stage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/2stage.css">


</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div class="content">
    <div class="banner">
        <h3 class="title">AI 면접 코칭</h3>
        <p class="p-title">나의 자기소개서를 기반으로 지원 기업 맞춤 면접 준비를 도와줘요</p>
    </div>

    <h4 class="h-title"> 2. 질문 답변하기 </h4>

    <p><h5>기업질문 > 직무질문 > 경험질문</h5></p>
    <hr style="width:80%; margin:0">

    <section class="container2">
        <div class="sidenav sn text-left">
            <div class="well">
                <table style="width:130px;">
                    <tr>
                        <th> 기업</th>
                    </tr>
                    <tr>
                        <td><a href="#">질문1</a></td>
                        <td>작성 완료</td>
                    </tr>
                    <tr>
                        <td><a href="#">질문2</a></td>
                        <td>작성 완료</td>
                    </tr>
                </table>
                <hr>
                <table style="width:130px;">
                    <tr>
                        <th> 직무</th>
                    </tr>
                    <tr>
                        <td><a href="#">질문3</a></td>
                        <td>작성 완료</td>
                    </tr>
                    <tr>
                        <td><a href="#">질문4</a></td>
                        <td>작성 완료</td>
                    </tr>
                </table>
                <hr>
                <table style="width:130px;">
                    <tr>
                        <th> 경험</th>
                    </tr>
                    <tr>
                        <td><a href="#">질문5</a></td>
                        <td>작성 중</td>
                    </tr>
                    <tr>
                        <td><a href="#">질문6</a></td>
                        <td>미작성</td>
                    </tr>
                </table>
            </div>
        </div>


        <div class="box">
            <div class="well text-left" style="font-size: 20px;">
                <p style="font-size:21px; font-weight:bold">질문1. 우리 회사에 지원하신 이유가 무엇입니까? </p>
            </div>

            <div class="answer-box well text-left">
                <form>
                    <table>
                        <div class="form-group">
                            <textarea class="form-control" rows="8" id="answer" placeholder="답변을 입력하세요"></textarea>
                        </div>

                        <div class="buttons">
                            <button class="btn btn-primary">다음 답변</button>
                            <button type="button" id="feedback-btn" class="btn btn-warning">AI 피드백 받기</button>
                        </div>
                    </table>
                </form>
            </div>

        </div>

        <div class="box2">
            <div class="well text-left" style="font-size: 20px;">
                <p style="font-size:21px; font-weight:bold">AI 피드백</p>
            </div>

            <div class="answer-box well text-left">
                <button class="accordion">답변 피드백</button>
                <div class="panel">
                    <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                </div>

                <button class="accordion">피드백 적용 답변</button>
                <div class="panel">
                    <p>다른 내용을 여기에 표시할 수 있습니다. 여러 개의 아코디언을 만들 수 있습니다.</p>
                    <div class="buttons">
                        <button class="btn btn-warning" style="margin:10px;">AI 피드백 적용</button>
                    </div>
                </div>
            </div>
        </div>


        <script>
            // AI 피드백 받기 버튼을 클릭했을 때 box2를 부드럽게 나타내기
            document.getElementById('feedback-btn').addEventListener('click', function () {
                var feedbackBox = document.querySelector('.box2');
                var container = document.querySelector('.container2'); // container를 여기서 정의

                feedbackBox.classList.toggle('show'); // 'show' 클래스 추가/제거로 전환

                // box2가 보일 때 'centered' 클래스를 추가하고, 숨길 때 제거
                if (feedbackBox.classList.contains('show')) {
                    container.classList.add('centered'); // box2가 보이면 centered 클래스를 추가
                } else {
                    container.classList.remove('centered'); // box2가 숨겨지면 centered 클래스를 제거
                }
            });


            // 모든 아코디언 버튼을 선택
            var acc = document.getElementsByClassName("accordion");

            for (var i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    // 현재 버튼 활성화 토글
                    this.classList.toggle("active");

                    // 패널을 찾고 토글 처리
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null; // 접기
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px"; // 펼치기
                    }
                });
            }
        </script>

    </section>

    <div style="width:100%; display:flex; flex-direction: column; align-items: flex-end; margin-right:200px;">
        <button type="submit" id="next" class="btn btn-primary"> → NEXT</button>


        <br>
        <div class="progress" style="width:90%;margin-bottom: 50px;">
            <div id="bar1" class="progress-bar" style="width:20%; margin-right:5px;">
                1 Stage
            </div>
            <div id="bar2" class="progress-bar" style="width:20%; margin:0 5px;">
                2 Stage
            </div>
            <div id="bar3" class="progress-bar" style="width:0; margin:0 5px;">
                3 Stage
            </div>
            <div id="bar4" class="progress-bar" style="width:0; margin:0 5px;">
                4 Stage
            </div>
            <div id="bar5" class="progress-bar" style="width:0; margin:0 5px;">
                5 Stage
            </div>
        </div>
    </div>

</div>


<!-- HTML -->
<footer class="footer">
    <div class="container">
        <div class="footer-left">
            <p>© 2024 Your Company Name</p>
        </div>
        <div class="footer-right">
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
    </div>
</footer>

<!-- 네비게이션 바 로드 스크립트 -->
<script>
    fetch('navbar.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('navbar-placeholder').innerHTML = data;
        });
</script>

</body>
</html>
