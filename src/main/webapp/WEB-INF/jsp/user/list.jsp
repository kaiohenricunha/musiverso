<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style><%@include file="/WEB-INF/jsp/css/list-style.css"%></style>
</head>
<body>
<center>
    <h1>
        Registered Songwriters
    </h1>

    <h3 style="color: blanchedalmond">
        <c:out value="Authentication succesfully made" />
    </h3>

    <table width="100%" border="4px">
        <tr>
            <th>
                Edit
            </th>
            <th>
                Delete
            </th>
            <th>
                Id
            </th>
            <th>
                Name
            </th>
            <th>
                Email
            </th>
            <th>
                Username
            </th>
            <th>
                Song
            </th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>
                    <c:if test="${userSession != null && userSession.getLoggedUser() != null && userSession.getLoggedUser().id == user.id}">
                        <a class="blue-link" href="<%=request.getContextPath()%>/user/edit?id=${user.id}">Edit</a>
                    </c:if>
                </td>
                <td>
                    <c:if test="${userSession != null && userSession.getLoggedUser() != null && userSession.getLoggedUser().id == user.id}">
                        <a class="blue-link" href="<%=request.getContextPath()%>/user/delete?id=${user.id}">Delete</a>
                    </c:if>
                </td>
                <td>
                    <c:out value="${user.id}" />
                </td>
                <td>
                    <c:out value="${user.name}" />
                </td>
                <td>
                    <c:out value="${user.email}" />
                </td>
                <td>
                    <c:out value="${user.username}" />
                </td>
                <td>
                    <a class="blue-link" href="${user.song.songLink}" target="_blank">
                    <c:out value="${user.song.songName}" />
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>


    <a href="<%=request.getContextPath()%>/user/create">Add User</a>
    <br><br>
    <a href="<%=request.getContextPath()%>/login/logout">Logout</a>
</center>
</body>
</html>