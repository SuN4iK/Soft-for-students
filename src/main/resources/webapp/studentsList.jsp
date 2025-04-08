<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Система управления студентами и их успеваемостью</h1>
<c:if test="${role eq 1}">
<form action="studentCreate" method="get">
<input type="submit" value="создать студента">
</form>
</c:if>
<h2>Список студентов</h2>

<table border=1>
<tr>
<th></th>
<th>фамилия</th>
<th>имя</th>
<th>группа</th>
<th>дата поступления</th>
</tr>
<c:forEach items="${students}" var="st">
<tr>
<td><input type="checkbox" name="checkbox" id="checkbox" class="checkbox"></td>
<td>${st.surname}</td>
<td>${st.name_student}</td>
<td>${st.group_student}</td>
<td><fmt:formatDate value="${st.date_student}" pattern="dd/MM/yyyy"/></td>
</tr>
</c:forEach>
</table>

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