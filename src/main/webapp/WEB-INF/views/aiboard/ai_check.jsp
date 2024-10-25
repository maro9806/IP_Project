<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>3 stage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/stage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/2stage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/3stage.css">
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<div class="content">
    <div class="banner mb-5">
        <h3 class="title">AI 면접 코칭</h3>
        <br>
        <h5 class="p-title">면접 답변이 모두 완료 되었습니다.</h5>
        <h5 class="p-title"> 질문 및 답변 확인을 확인하세요. </h5>
    </div>

    <h4 class="h-title">3. 질문 및 답변 확인하기</h4>
    <h5>질문 답변 확인 > 저장</h5>

    <hr style="width:100%;">

    <!-- 질문 및 답변 테이블 -->
    <div class="table-container d-flex flex-column align-items-center w-100 mb-5">
        <table>
            <thead>
            <tr>
                <th colspan="3">면접 질문 및 답변</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td rowspan="2">기업</td>
                <td>질문1</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>질문2</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>

            <tr>
                <td rowspan="2">직무</td>
                <td>질문3</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>질문4</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td rowspan="2">경험</td>
                <td>질문5</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>질문6</td>
                <td>
                    <button class="accordion">답변 피드백</button>
                    <div class="panel">
                        <p>이곳에 표시될 내용입니다. 클릭 시 이 내용이 보이거나 숨겨집니다.</p>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- 다음 단계로 이동하는 버튼 -->
        <button onclick="location.href='${pageContext.request.contextPath}/aiboard/ai_video'" class="btn btn-dark">영상면접
            응시하기
        </button>

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

<script>
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

<jsp:include page="../footer.jsp"/>
</body>
</html>
