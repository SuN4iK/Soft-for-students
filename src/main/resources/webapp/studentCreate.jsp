<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@page import="org.example.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Students list</title>

   <link rel="stylesheet" type="text/css" href="resources/css/style.css">
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

.navigation{
    flex-grow:1;
    margin-top:5rem;
    margin-left:3rem;
    align-self:flex-start;

}

.heading-secondary{
    margin-top:2rem;
    margin-bottom:1rem;


}

table{
border-collapse:collapse;
height:2rem;
}

tr, th,td{
    padding:1rem 1.5rem;
}

th{
    background-color: #ca9090;
}

.student-btns{
    display:flex;

}

.student-btn{
    width:20rem;
    padding:5px;

}

.student-btns1{
    display:flex;
    flex-direction:column;

}

.field{
    display:flex;
    flex-direction:column;
    margin-left: 7rem;
    padding: 8px;
    border: 2px solid #000;
    border-radius:10%;
}

.cell1{
    width:11rem;
    text-align: "left";
}

</style>


<aside class="navigation">
<a href = "/" class="navigation-item">На главную</a>
<a href = "students" class="navigation-item">Назад</a>
</aside>

<main class="main">
    <h1 class="main-heading"> система управления студентами и их успеваемостью</h1>
<h2 class="heading-secondary">Для создания студента заполните все поля и нажмите кнопку "создать"</h2>
<form action="studentCreate" method="POST">

<table>
<tr>
<td class"cell1"> <h3>Фамилия</h3></td>
<td><input name="surname" type="text" id ="name"></td>
</tr>
</table>

<table>
<tr>
<td class"cell1"> <h3>Имя</h3></td>
<td><input name="name_student" type="text" id ="name_student"></td>
</tr>
</table>

<table>
<tr>
<td class"cell1"><h3>Группа</h3></td>
<td><input name="group_student" type="text" id ="group_student"></td>
</tr>
</table>

<table>
<tr>
<td class"cell1"><h3>Дата поступления</h3></td>
<td><input name="date_student" type="text" id ="date_student"></td>
</tr>
</table>

<input type="submit" value="Создать" class="field">
<c:if test="${message eq '1'}">
    <h3>Пожалуйста заполните все поля!</h3>
    </c:if>
</form>

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