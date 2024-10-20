<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
            <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
        </div>

        <!-- Join Form -->
        <form action="${cpath}/member/join" method="post">
            <input type="text" id="username" class="fadeIn second" name="username" placeholder="username">
            <input type="text" id="password" class="fadeIn third" name="password" placeholder="password">
            <input type="text" id="name" class="fadeIn third" name="name" placeholder="name">
            <br>
            ADMIN<input type="checkbox" id="role" value="ADMIN" class="fadeIn third" name="role" placeholder="password">
            &nbsp;&nbsp;
            MANAGER<input type="checkbox" id="role" value="MANAGER" class="fadeIn third" name="role" placeholder="password">
            &nbsp;&nbsp;
            MEMBER<input type="checkbox" id="role" value="MEMBER" class="fadeIn third" name="role" placeholder="password">


            <input type="submit" class="fadeIn fourth" value="join">
        </form>

    </div>
    </div>
</body>
</html>