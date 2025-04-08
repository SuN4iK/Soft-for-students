<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Система управления студентами и их успеваемостью</h1>
<a href="students">студенты</a>
<a href="#">дисциплины</a>
<a href="#">семестры</a>

<aside>
<c:choose>
<c:when test="${isLogin eq 1}">
<a href="logout">Logout,${login}</a>
</c:when>
<c:otherwise>
<a href="login">Login</a>
</c:otherwise>
</c:choose>
</aside>

</body>
</html>