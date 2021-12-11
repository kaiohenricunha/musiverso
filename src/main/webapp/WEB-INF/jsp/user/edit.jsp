<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <style><%@include file="/WEB-INF/jsp/css/edit-style.css"%></style>
</head>

<body>
<div class="container">
  <header class="header">
    <h1 id="title" class="text-center">Edit Page</h1>
    <h3 style="color: blanchedalmond" class="text-center">
      ${message}
    </h3>
  </header>
  <br>
  <form method="post" action="<%=request.getContextPath()%>/user/edit">
    <div class="form-group">
      <input type="hidden" name="id" value="${user.id}" >
      <label id="name-label" for="name">Name</label>
      <input
              type="text"
              name="name"
              id="name"
              class="form-control"
              placeholder="Type your name"
              value="${user.name}"
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
              value="${user.email}"
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
              value="${user.username}"
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
              value="${user.password}"
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
              value="${user.song.songName}"
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
              value="${user.song.songLink}"
              required
      />
    </div>
    <div class="form-group">
      <input id="submit" class="submit-button" type="submit" value="Salvar">
    </div>
    <a href="<%=request.getContextPath()%>/user/list"><h3 class="text-center">List Subscribed Artists</h3></a>
  </form>
</div>
</body>
</html>