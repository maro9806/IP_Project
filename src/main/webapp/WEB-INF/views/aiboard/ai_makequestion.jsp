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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../navbar.jsp"/>
<div class="jumbotron p-5 rounded">
    <h1 class="display-4">AI 면접 준비</h1>
    <p class="lead">나의 자기소개서를 기반으로 지원 기업 맞춤 면접 준비를 도와줘요</p>
    <hr>
</div>

<div class="content">

    <h4 class="h-title">2. AI 예상 질문 확인하기</h4>
    <h5>예상 질문 확인 > 질문 답변하기</h5>

    <hr style="width:100%;">

    <!-- 질문 및 답변 테이블 -->
    <div class="container d-flex flex-column align-items-center mt-3" style="gap:0">
    <div class="table-container mb-5 ml-5">
        <table class="text-center" style="width:1000px">
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 80%;">
            </colgroup>
            <thead>
            <tr>
                <th colspan="3">
                    <sec:authentication property="principal.member.name"/>님 AI 예상 면접 질문
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td rowspan="2"><strong>기업</strong></td>
                <td>질문1</td>
                <td>
                    <button id="q1" class="accordion">${questions[0].IPRO_QUESTION}</button>
                </td>
            </tr>
            <tr style="border-bottom:1px solid #edebeb;">
                <td>질문2</td>
                <td>
                    <button id="q2" class="accordion">${questions[1].IPRO_QUESTION}</button>
                </td>
            </tr>

            <tr>
                <td rowspan="2"><strong>직무</strong></td>
                <td>질문3</td>
                <td>
                    <button id="q3" class="accordion">${questions[2].IPRO_QUESTION}</button>
                </td>
            </tr>
            <tr style="border-bottom:1px solid #edebeb;">
                <td>질문4</td>
                <td>
                    <button id="q4" class="accordion">${questions[3].IPRO_QUESTION}</button>
                </td>
            </tr>

            <tr>
                <td rowspan="2"><strong>경험</strong></td>
                <td>질문5</td>
                <td>
                    <button id="q5" class="accordion">${questions[4].IPRO_QUESTION}</button>
                </td>
            </tr>
            <tr>
                <td>질문6</td>
                <td>
                    <button id="q6" class="accordion">${questions[5].IPRO_QUESTION}</button>
                </td>
            </tr>
            </tbody>
        </table>

    </div>
        <div>
            <button onclick="location.href='<%= request.getContextPath() %>/aiboard/ai_custominfo'" class="btn btn-secondary">질문 다시 생성하기</button>
            <button onclick="location.href='<%= request.getContextPath() %>/aiboard/ai_question'"
                    type="submit" id="next"
                    class="btn btn-primary">
                면접 답변 시작하기
            </button>

        </div>

    </div>

</div>
        <jsp:include page="../footer.jsp"/>

<script>
    // 모든 버튼에 이벤트 리스너 추가
    const buttons = document.querySelectorAll('.accordion');
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            // 버튼의 스타일을 제거
            this.style.backgroundColor = ''; // 배경색 초기화
            this.style.color = ''; // 글자색 초기화
            // this.classList.remove('accordion'); // 필요에 따라 class도 제거 가능
        });
    });
</script>


</body>
</html>
