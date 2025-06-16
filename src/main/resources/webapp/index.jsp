<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">

        <title>Главаная</title>
</head>
<body>
<style>

*{
*{
margin:0;
padding:0;
box-sizing: border-box;
}

body{
background-image:linear-gradient(#d1cccce7, #523131d8);
background-size:cover;
background-attachment:fixed;
height: 100vh;
display:flex;
justify-content: space-between;

padding: 1rem 2rem;
text-shadow:5px 5px 3px #369;
font-family:'Kelly Slab', cursive;
}

.main{
flex-grow: 3;
margin-top: 1rem;
}

.main-heading{
    border:2px solid #000;
    padding: 0.5rem 1rem;
    text-align:center;
    margin: 2rem 10rem;
}

a{
font-size:1.5rem;
}

.container{
display:flex;
justify-content:space-around;
}

.logout{
flex-grow:1;
text-align:center;
}

</style>
<main class="main">
    <h1 class="main-heading"> система управления студентами и их успеваемостью</h1>
    <div class="container">
        <a href="students" class="tittle-btn">студенты</a>
        <a href="disciplines" class="tittle-btn">дисциплины</a>
        <a href="#" class="tittle-btn">семестры</a>
    </div>

</main>

<aside>
<c:choose>
<c:when test="${isLogin eq 1}">
<a href = "logout" class="logout-btn">Logout, ${login}</a>
</c:when>
<c:otherwise>
<a href = "login" class="logout-btn">Login</a>
</c:otherwise>
</c:choose>
</aside>

</body>
</html>