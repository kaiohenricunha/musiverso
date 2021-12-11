<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style><%@include file="/WEB-INF/jsp/css/style.css"%></style>
</head>
<body>
<div class="container">
    <header class="header">
        <h1 id="title" class="text-center">Musiverso</h1>
        <p id="description" class="description text-center">
            Please, fill up the subscription form below
        </p>
        <h3 style="color: blanchedalmond" class="text-center">
            ${message}
        </h3>
    </header>
    <form id="survey-form" method="post" action="<%=request.getContextPath()%>/user/create">
        <div class="form-group">
            <label id="name-label" for="name">Name</label>
            <input
                    type="text"
                    name="name"
                    id="name"
                    class="form-control"
                    placeholder="Type your name"
                    required
            />
        </div>
        <div class="form-group">
            <label id="email-label" for="email">Email</label>
            <input
                    type="text"
                    name="email"
                    id="email"
                    class="form-control"
                    placeholder="Type your email"
                    required
            />
        </div>
        <div class="form-group">
            <label id="username-label" for="username">Username</label>
            <input
                    type="text"
                    name="username"
                    id="username"
                    class="form-control"
                    placeholder="Type your username"
                    required
            />
        </div>
        <div class="form-group">
            <label id="password-label" for="password">Password</label>
            <input
                    type="password"
                    name="password"
                    id="password"
                    class="form-control"
                    placeholder="Type your password"
                    required
            />
        </div>
        <div class="form-group">
            <label id="song-title-label" for="songTitle">Song Title</label>
            <input
                    type="text"
                    name="song-title"
                    id="songTitle"
                    class="form-control"
                    placeholder="Type your song title"
                    required
            />
        </div>
        <div class="form-group">
            <label id="song-link-label" for="songLink">Public Song Link</label>
            <input
                    type="text"
                    name="song-link"
                    id="songLink"
                    class="form-control"
                    placeholder="Type a public link to your song"
                    required
            />
        </div>
        <div class="form-group">
            <p>What option best defines you?</p>
            <select id="dropdown" name="role" class="form-control" required>
                <option disabled selected value>Select your current situation</option>
                <option value="student">Music Student</option>
                <option value="job">Amateur Musician</option>
                <option value="learner">Professional Musician</option>
                <option value="preferNo">Songwriter</option>
                <option value="other">Other</option>
            </select>
        </div>
        <div class="form-group">
                <input id="submit" class="submit-button" type="submit" value="Subscribe">
        </div>
            <a href="<%=request.getContextPath()%>/login/doLogin"><h3 class="text-center">Login</h3></a>
    </form>
</div>
</body>
</html>