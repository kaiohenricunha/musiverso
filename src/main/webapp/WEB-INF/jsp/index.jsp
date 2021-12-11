<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style><%@include file="/WEB-INF/jsp/css/index-style.css"%></style>
</head>
    <body>
    <div class="container">
        <header class="header">
            <h1 id="title" class="text-center">Musiverso Annual Song Contest</h1>
            <p id="description" class="description text-center">
                Get your songs in front of #1 songwriters and the music industry.<br>
                Enter for your chance to win $ 10,000.
            </p>
        </header>

        <a href="<%=request.getContextPath()%>/user/create"><h3 class="text-center">Enter Now</h3></a>

    </div>
    </body>
</html>